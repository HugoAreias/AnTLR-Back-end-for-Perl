package ANTLR::Runtime::ANTLRStringStream;

use Carp;

use ANTLR::Runtime::CharStreamState;

use Moose;

with 'ANTLR::Runtime::IntStream', 'ANTLR::Runtime::CharStream';

# The data being scanned
# has 'input' => (
#     is  => 'ro',
#     isa => 'Str',
#     required => 1,
# );

# efficiency decision
has 'input' => (
    is  => 'ro',
    isa => 'ArrayRef[Str]', # future change: supposed to be Char
    required => 1,
);

# length of the input (efficiency decision)
has 'length' => (
    is  => 'rw',
    isa => 'Int',
    default => 0,
);

# 0..n-1 index into string of next char
has 'p' => (
    is  => 'rw',
    isa => 'Int',
    default => 0,
);

# line number 1..n within the input
has 'line' => (
    is  => 'rw',
    isa => 'Int',
    default => 1,
);

# The index of the character relative to the beginning of the line 0..n-1
has 'char_position_in_line' => (
    is  => 'rw',
    isa => 'Int',
    default => 0,
);

# tracks how deep mark() calls are nested
has 'mark_depth' => (
    is  => 'rw',
    isa => 'Int',
    default => 0,
);

# A list of CharStreamState objects that tracks the stream state
# values line, charPositionInLine, and p that can change as you
# move through the input stream.  Indexed from 1..markDepth.
# A null is kept @ index 0.
has 'markers' => (
    is  => 'rw',
    isa => 'ArrayRef[Maybe[ANTLR::Runtime::CharStreamState]]',
    default => sub { [ undef ] },
);

# Track the last mark() call result value for use in rewind().
has 'last_marker' => (
    is  => 'rw',
    isa => 'Int',
    default => 0,
);

# What is name or source of this char stream?
has 'name' => (
    is  => 'rw',
    isa => 'Str',
    default => q{},
);

# determines the input size at the beginning to avoid multiple calculations (efficiency decision)
sub BUILD {
	my ($self,$args) = @_;
	$self->length(scalar @{$self->input});
	return;
}

# convert to a char array (efficiency decision)
sub BUILDARGS {
	my ($class,@args) = @_;
	my $args = $class->SUPER::BUILDARGS(@args);

	my $input = $args->{input};
	return unless defined $input;
	my @chararray = ();
	@chararray = split //, $input;
	$args->{input} = \@chararray;
	
	return $args;
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

sub get_char_position_in_line {
    my ($self) = @_;
    return $self->char_position_in_line;
}

sub set_char_position_in_line {
    my ($self, $char_position_in_line) = @_;
    $self->char_position_in_line($char_position_in_line);
    return;
}

# Reset the stream so that it's in the same state it was
# when the object was created *except* the data array is not
# touched.
sub reset {
    my ($self) = @_;

    $self->p(0);
    $self->line(1);
    $self->char_position_in_line(0);
    $self->mark_depth(0);
    return;
}

sub consume {
    my ($self) = @_;

    # if ($self->p < length $self->input) {
	# efficiency decision
	if ($self->p < $self->length) {
        $self->char_position_in_line($self->char_position_in_line + 1);
        # if (substr($self->input, $self->p, 1) eq "\n") {
	    # efficiency decision
		if ( $self->input->[$self->p] eq "\n" ) {
            $self->line($self->line + 1);
            $self->char_position_in_line(0);
        }
        $self->p($self->p + 1);
    }
    return;
}

sub LA {
    my ($self, $i) = @_;

    if ($i == 0) {
        return undef;
    }

    if ($i < 0) {
        ++$i; # e.g., translate LA(-1) to use offset i=0; then input[p+0-1]
        if ($self->p + $i - 1 < 0) {
            return $self->EOF;
        }
    }

    # if ($self->p + $i - 1 >= length $self->input) {
	# efficiency decision
	if ($self->p + $i - 1 >= $self->length) {
        return $self->EOF;
    }

    # return substr $self->input, $self->p + $i - 1, 1;
	# efficiency decision
	return $self->input->[$self->p + $i - 1];
}

sub LT {
    my ($self, $i) = @_;

    return $self->LA($i);
}

# Return the current input symbol index 0..n where n indicates the
# last symbol has been read.  The index is the index of char to
# be returned from LA(1).
sub index {
    my ($self) = @_;

    return $self->p;
}

sub size {
    my ($self) = @_;

    # return length $self->input;
    # efficiency decision
	return $self->length;
}

sub mark {
    my ($self) = @_;

    $self->mark_depth($self->mark_depth + 1);
    my $state;
    if ($self->mark_depth >= @{$self->markers}) {
        $state = ANTLR::Runtime::CharStreamState->new();
        push @{$self->markers}, $state;
    } else {
        $state = $self->markers->[$self->mark_depth];
    }

    $state->set_p($self->p);
    $state->set_line($self->line);
    $state->set_char_position_in_line($self->char_position_in_line);
    $self->last_marker($self->mark_depth);

    return $self->mark_depth;
}

sub rewind {
    my $self = shift;
    my $m;
    if (@_ == 0) {
        $m = $self->last_marker;
    } else {
        $m = shift;
    }

    my $state = $self->markers->[$m];
    # restore stream state
    $self->seek($state->get_p());
    $self->line($state->get_line());
    $self->char_position_in_line($state->get_char_position_in_line());
    $self->release($m);
    return;
}

sub release {
    my ($self, $marker) = @_;

    # unwind any other markers made after m and release m
    $self->mark_depth($marker);
    # release this marker
    $self->mark_depth($self->mark_depth - 1);
    return;
}

# consume() ahead unit p == index; can't just set p = index as we must update
# line and char_position_in_line
sub seek {
    my ($self, $index) = @_;

    if ($index <= $self->p) {
        # just jump; don't update stream state (line, ...)
        $self->p($index);
        return;
    }

    # seek forward, consume until p hits index
    while ($self->p < $index) {
        $self->consume();
    }
    return;
}

sub substring {
    my ($self, $start, $stop) = @_;

    # return substr $self->input, $start, $stop - $start + 1;
	# efficiency decision
	return join '',@{$self->input}[$start..$stop];
}

sub get_source_name {
    my ($self) = @_;
    return $self->name;
}

no Moose;
__PACKAGE__->meta->make_immutable();
1;

__END__

=head1 NAME

ANTLR::Runtime::ANTLRStringStream

=head1 DESCRIPTION

A pretty quick CharStream that pulls all data from an array
directly.  Every method call counts in the lexer.