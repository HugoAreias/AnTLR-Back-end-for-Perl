package ANTLR::Runtime::CommonTokenStream;

use Carp;
use Data::Lock qw( dlock );

use ANTLR::Runtime::CharStream;
use ANTLR::Runtime::Token;
use ANTLR::Runtime::TokenSource;

use Moose;

use overload
    '""' => \&str
    ;

with 'ANTLR::Runtime::IntStream',
     'ANTLR::Runtime::TokenStream';

has 'token_source' => (
    is  => 'rw',
    does => 'ANTLR::Runtime::TokenSource',
);

# Record every single token pulled from the source so we can reproduce
# chunks of it later.
has 'tokens' => (
    is  => 'rw',
    isa => 'ArrayRef[ANTLR::Runtime::Token]',
    default => sub { [] },
);

# Map<tokentype, channel> to override some Tokens' channel numbers
has 'channel_override_map' => (
    is  => 'rw',
    isa => 'HashRef[Int]',
);

# Set<tokentype>; discard any tokens with this type
has 'discard_set' => (
    is  => 'rw',
    isa => 'HashRef[Int]',
);

# Skip tokens on any channel but this one; this is how we skip whitespace...
has 'channel' => (
    is  => 'rw',
    isa => 'Int',
    default => ANTLR::Runtime::Token->DEFAULT_CHANNEL,
);

# By default, track all incoming tokens
has 'discard_off_channel_tokens' => (
    is  => 'rw',
    isa => 'Bool',
    default => 0,
);

# Track the last mark() call result value for use in rewind().
has 'last_marker' => (
    is  => 'rw',
    isa => 'Int',
    default => 0,
);

# The index into the tokens list of the current token (next token
# to consume).  p==-1 indicates that the tokens list is empty
has 'p' => (
    is  => 'rw',
    isa => 'Int',
    default => -1,
);

# Reset this token stream by setting its token source.
sub set_token_source {
    my ($self, $token_source) = @_;

    $self->token_source($token_source);
    $self->tokens([]);
    $self->p(-1);
    $self->channel(ANTLR::Runtime::Token->DEFAULT_CHANNEL);
	return;
}

# Load all tokens from the token source and put in tokens.
# This is done upon first LT request because you might want to
# set some token type / channel overrides before filling buffer.
sub fill_buffer {
    my ($self) = @_;

    my $index = 0;
    my $t = $self->token_source->next_token();
    # efficiency decision
    # while (defined $t && $t->get_type() != ANTLR::Runtime::CharStream->EOF) {
    while (defined $t && $t->type != ANTLR::Runtime::CharStream->EOF) {
        my $discard = 0;
		# is there a channel override for token type?
        if (defined $self->channel_override_map) {
            my $channel = $self->channel_override_map->{$t->get_type()};
            if (defined $channel) {
                $t->set_channel($channel);
            }
        }
        if (defined $self->discard_set && exists $self->discard_set->{$t->get_type()}) {
            $discard = 1;
        } elsif ($self->discard_off_channel_tokens && $t->get_channel() != $self->channel) {
            $discard = 1;
        }
        if (!$discard) {
            $t->set_token_index($index);
            push @{$self->tokens}, $t;
            ++$index;
        }
    } continue {
        $t = $self->token_source->next_token();
    }
    # leave p pointing at first token on channel
    $self->p(0);
    $self->p($self->skip_off_token_channels($self->p));
	return;
}

# Move the input pointer to the next incoming token.  The stream
# must become active with LT(1) available.  consume() simply
# moves the input pointer so that LT(1) points at the next
# input symbol. Consume at least one token.
# 
# Walk past any token not on the channel the parser is listening to.
sub consume {
    my ($self) = @_;

    if ($self->p < @{$self->tokens}) {
        $self->p($self->p + 1);
        $self->p($self->skip_off_token_channels($self->p));  # leave p on valid token
    }
	return;
}

# Given a starting index, return the index of the first on-channel token.
sub skip_off_token_channels {
    my ($self, $i) = @_;

    my $n = @{$self->tokens};
    # while ($i < $n && $self->tokens->[$i]->get_channel() != $self->channel) {
	# efficiency decision
	while ($i < $n && $self->tokens->[$i]->channel != $self->channel) {
        ++$i;
    }

    return $i;
}

sub skip_off_token_channels_reverse {
    my ($self, $i) = @_;

    # while ($i >= 0 && $self->tokens->[$i]->get_channel() != $self->channel) {
	# efficiency decision
	my $tokens = $self->tokens;
	while ($i >= 0 && $tokens->[$i]->channel != $self->channel) {
        --$i;
    }

    return $i;
}

# A simple filter mechanism whereby you can tell this token stream
# to force all tokens of type ttype to be on channel.  For example,
# when interpreting, we cannot exec actions so we need to tell
# the stream to force all WS and NEWLINE to be a different, ignored
# channel.
sub set_token_type_channel {
    my ($self, $ttype, $channel) = @_;

    if (!defined $self->channel_override_map) {
        $self->channel_override_map({});
    }

    $self->channel_override_map->{$ttype} = $channel;
	return;
}

sub discard_token_type {
    my ($self, $ttype) = @_;

    if (!defined $self->discard_set) {
        $self->discard_set({});
    }

    $self->discard_set->{$ttype} = 1;
	return;
}

sub get_tokens {
    my ($self, $args) = @_;

    if ($self->p == -1) {
        $self->fill_buffer();
    }
    if (!defined $args) {
        return $self->tokens;
    }

	# Given a start and stop index, return a List of all tokens in
	# the token type BitSet.  Return null if no tokens were found.  This
	# method looks at both on and off channel tokens.
    my $start = $args->{start};
    my $stop = $args->{stop};

    my $types;
    if (exists $args->{types}) {
        if (ref $args->{types} eq 'ARRAY') {
            $types = ANTLR::Runtime::BitSet->new({ list => $args->{types} });
        } else {
            $types = $args->{types};
        }
    } else {
        my $ttype = $args->{ttype};
        $types = ANTLR::Runtime::BitSet->of($ttype);
    }

    $stop = $#{$self->tokens} if ($stop >= @{$self->tokens});
    $start = 0 if ($start < 0);
    return undef if ($start > $stop);

    my $filtered_tokens = [];
    foreach my $t (@{$self->tokens}[$start..$stop]) {
        if (!defined $types || $types->member($t->get_type())) {
            push @{$filtered_tokens}, $t;
        }
    }

    $filtered_tokens = undef if (!@{$filtered_tokens});

    return $filtered_tokens;
}

# Get the ith token from the current position 1..n where k=1 is the
# first symbol of lookahead.
sub LT {
    my ($self, $k) = @_;

    if ($self->p == -1) {
        $self->fill_buffer();
    }
    if ($k == 0) {
        return undef;
    }
    if ($k < 0) {
        return $self->LB(-$k);
    }

    if ($self->p + $k - 1 >= @{$self->tokens}) {
        return ANTLR::Runtime::Token->EOF_TOKEN;
    }

    my $i = $self->p;
    my $n = 1;

	# find k good tokens
    while ($n < $k) {
		# skip off-channel tokens
        $i = $self->skip_off_token_channels($i+1); # leave p on valid token
        ++$n;
    }

    if ($i >= @{$self->tokens}) {
        return ANTLR::Runtime::Token->EOF_TOKEN;
    }

    return $self->tokens->[$i];
}

# Look backwards k tokens on-channel tokens
sub LB {
    my ($self, $k) = @_;

    if ($self->p == -1) {
        $self->fill_buffer();
    }
    if ($k == 0) {
        return undef;
    }
    if ($self->p - $k < 0) {
        return undef;
    }

    my $i = $self->p;
    my $n = 1;
	# find k good tokens looking backwards
    while ($n <= $k) {
		# skip off-channel tokens
        $i = $self->skip_off_token_channels_reverse($i - 1); # leave p on valid token
        ++$n;
    }

    if ($i < 0) {
        return undef;
    }

    return $self->tokens->[$i];
}

# Return absolute token i; ignore which channel the tokens are on;
# that is, count all tokens not just on-channel tokens.
sub get {
    my ($self, $i) = @_;

    return $self->tokens->[$i];
}

sub LA {
    my ($self, $i) = @_;

    return $self->LT($i)->get_type();
}

sub mark {
    my ($self) = @_;

    if ($self->p == -1) {
        $self->fill_buffer();
    }
    $self->last_marker($self->index());
    return $self->last_marker;
}

sub release {
    my ($self, $marker) = @_;

    # no resources to release
}

sub size {
    my ($self) = @_;

    return scalar @{$self->tokens};
}

sub index {
    my ($self) = @_;

    return $self->p;
}

sub rewind {
    dlock( my $usage = 'void rewind(int marker) | void rewind()' );
    croak $usage if @_ != 1 && @_ != 2;

    if (@_ == 1) {
        my ($self) = @_;
        $self->seek($self->last_marker);
    } elsif (@_ == 2) {
        my ($self, $marker) = @_;
        $self->seek($marker);
    }
	return;
}

sub reset {
	my ($self) = @_;
	$self->p(0);
	$self->last_marker(0);
	return;
}

sub seek {
    my ($self,$index) = @_;
    $self->p($index);
	return;
}

sub get_token_source {
    my ($self) = @_;
    return $self->token_source;
}

sub get_source_name {
    my ($self) = @_;
    return $self->get_token_source()->get_source_name();
}

sub str {
    my ($self) = @_;
    return $self->to_string();
}

sub to_string {
    dlock( my $usage = 'String to_string() | String to_string(int start, int stop | String to_string(Token start, Token stop)' );
    croak $usage if @_ != 1 && @_ != 3;

    if (@_ == 1) {
        my ($self) = @_;

        if ($self->p == -1) {
            $self->fill_buffer();
        }
        return $self->to_string(0, $#{$self->tokens});
    } else {
        my ($self, $start, $stop) = @_;

        if (defined $start && defined $stop) {
            if (ref($start) && $start->isa('ANTLR::Runtime::Token')) {
                $start = $start->get_token_index();
            }

            if (ref($stop) && $stop->isa('ANTLR::Runtime::Token')) {
                $stop = $stop->get_token_index();
            }

            if ($start < 0 || $stop < 0) {
                return undef;
            }
            if ($self->p == -1) {
                $self->fill_buffer();
            }
            if ($stop >= @{$self->tokens}) {
                $stop = $#{$self->tokens};
            }

            my $buf = '';
            foreach my $t (@{$self->tokens}[$start..$stop]) {
                $buf .= $t->get_text();
            }

            return $buf;
        } else {
            return undef;
        }
    }
}

no Moose;
__PACKAGE__->meta->make_immutable();
1;
__END__

=head1 NAME

ANTLR::Runtime::CommonTokenStream

=head1 DESCRIPTION

The most common stream of tokens is one where every token is buffered up
and tokens are prefiltered for a certain channel (the parser will only
see these tokens and cannot change the filter channel number during the
parse).