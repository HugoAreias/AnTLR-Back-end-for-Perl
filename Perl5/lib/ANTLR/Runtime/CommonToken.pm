package ANTLR::Runtime::CommonToken;

use Moose;

use overload
	# '""' => \&to_string, # conflicts with comparisons
    'bool' => \&not_eof,
    fallback => 1,
    ;

with 'ANTLR::Runtime::Token';

has 'type' => (
    is  => 'rw',
    isa => 'Int',
    required => 1,
);

has 'line' => (
    is  => 'rw',
    isa => 'Int',
    default => 0,
);

has 'char_position_in_line' => (
    is  => 'rw',
    isa => 'Int',
    # set to invalid position
    default => -1,
);

has 'channel' => (
    is  => 'rw',
    isa => 'Int',
    default => sub { ANTLR::Runtime::Token->DEFAULT_CHANNEL }
);

has 'input' => (
    is  => 'rw',
    isa => 'Maybe[ANTLR::Runtime::CharStream]',
);

# We need to be able to change the text once in a while.  If
# this is non-null, then getText should return this.  Note that
# start/stop are not affected by changing this.
has 'text' => (
    is  => 'rw',
    isa => 'Maybe[Str]',
);

# What token number is this from 0..n-1 tokens; < 0 implies invalid index
has 'index' => (
    is  => 'rw',
    isa => 'Int',
    default => -1,
);

# The char position into the input buffer where this token starts
has 'start' => (
    is  => 'rw',
    isa => 'Int',
);

# The char position into the input buffer where this token stops
has 'stop' => (
    is  => 'rw',
    isa => 'Int',
);

sub BUILD {
    my ($self, $arg_ref) = @_;

    if (exists $arg_ref->{token}) {
        my $token = $arg_ref->{token};
        $self->text($token->get_text());
        $self->type($token->get_type());
        $self->line($token->get_line());
        $self->index($token->get_token_index());
        $self->char_position_in_line($token->get_char_position_in_line());
        $self->channel($token->get_channel());
		if ( $token->isa('ANTLR::Runtime::CommonToken') ) {
			$self->start($token->get_start_index());
			$self->stop($token->get_stop_index());
		}
    }
    return;
}

sub get_type {
    my ($self) = @_;
    return $self->type;
}

sub set_type {
    my ($self, $value) = @_;
    $self->type($value);
    return;
}

sub get_line {
    my ($self) = @_;
    return $self->line;
}

sub set_line {
    my ($self, $line) = @_;
    $self->line($line);
    return;
}

sub get_text {
    my ($self) = @_;

    if (defined $self->text) {
        return $self->text;
    }
    if (!defined $self->input) {
        return undef;
    }
    $self->text($self->input->substring($self->start, $self->stop));
    return $self->text;
}

# Override the text for this token.  getText() will return this text
# rather than pulling from the buffer.  Note that this does not mean
# that start/stop indexes are not valid.  It means that that input
# was converted to a new string in the token object.

sub set_text {
    my ($self, $text) = @_;
    $self->text($text);
    return;
}

sub get_char_position_in_line {
    my ($self) = @_;
    return $self->char_position_in_line;
}

sub set_char_position_in_line {
    my ($self, $pos) = @_;
    $self->char_position_in_line($pos);
    return;
}

sub get_channel {
    my ($self) = @_;
    return $self->channel;
}

sub set_channel {
    my ($self, $channel) = @_;
    $self->channel($channel);
    return;
}

sub get_start_index {
    my ($self) = @_;
    return $self->start;
}

sub set_start_index {
    my ($self, $start) = @_;
    $self->start($start);
    return;
}

sub get_stop_index {
    my ($self) = @_;
    return $self->stop;
}

sub set_stop_index {
    my ($self, $stop) = @_;
    $self->stop($stop);
    return;
}

sub get_token_index {
    my ($self) = @_;
    return $self->index;
}

sub set_token_index {
    my ($self, $index) = @_;
    $self->index($index);
    return;
}

sub get_input_stream {
    my ($self) = @_;
    return $self->input;
}

sub set_input_stream {
    my ($self, $input) = @_;
    $self->input($input);
    return;
}

sub not_eof {
    my ($self) = @_;
    return $self->type != ANTLR::Runtime::Token->EOF;
}

sub to_string {
	my ($self) = @_;
	my $channelStr = '';
	if ( $self->channel > 0 ) {
		$channelStr = ',channel=' . $self->channel;
	}
	my $txt = $self->get_text();
	if ( defined $txt ) {
		$txt =~ s/\n/\\\\n/g;
		$txt =~ s/\r/\\\\r/g;
		$txt =~ s/\t/\\\\t/g;
	}
	else {
		$txt = '<no text>';
	}
	return '[@' . $self->index . ',' . $self->start . ':' . $self->stop . "='"
		. $txt . "',<" . $self->type . '>' . $channelStr . ',' . $self->line . ':'
		. $self->char_position_in_line . ']';
}

no Moose;
__PACKAGE__->meta->make_immutable();
1;
__END__

=head1 NAME

ANTLR::Runtime::CommonToken

=head1 DESCRIPTION