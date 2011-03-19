package ANTLR::Runtime::CharStreamState;

use Moose;

# Index into the char stream of next lookahead char
has 'p' => (
    is  => 'rw',
    isa => 'Int',
    default => 0,
);

# What line number is the scanner at before processing buffer[p]?
has 'line' => (
    is  => 'rw',
    isa => 'Int',
    default => 0,
);

# What char position 0..n-1 in line is scanner before processing buffer[p]?
has 'char_position_in_line' => (
    is  => 'rw',
    isa => 'Int',
    default => 0,
);

sub get_p {
	my ($self) = @_;
	return $self->p;
}

sub get_line {
	my ($self) = @_;
	return $self->line;
}

sub get_char_position_in_line {
	my ($self) = @_;
	return $self->char_position_in_line;
}

sub set_p {
	my ($self,$p) = @_;
	$self->p($p);
	return;
}

sub set_line {
	my ($self,$line) = @_;
	$self->line($line);
	return;
}

sub set_char_position_in_line {
	my ($self,$char_position_in_line) = @_;
	$self->char_position_in_line($char_position_in_line);
	return;
}

no Moose;
__PACKAGE__->meta->make_immutable();
1;
__END__

=head1 NAME

ANTLR::Runtime::CharStreamState

=head1 DESCRIPTION

When walking ahead with cyclic DFA or for syntactic predicates,
we need to record the state of the input stream (char index,
line, etc...) so that we can rewind the state after scanning ahead.
This is the complete state of a stream.