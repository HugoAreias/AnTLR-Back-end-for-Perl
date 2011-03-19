package ANTLR::Runtime::MismatchedSetException;

use Moose;

use overload
    '""' => \&to_string;

extends 'ANTLR::Runtime::RecognitionException';

has 'expecting' => (
	is => 'ro',
	isa => 'Maybe[ANTLR::Runtime::BitSet]',
	required => 1,
);

sub get_expecting {
	my ($self) = @_;
	
	return $self->expecting;
}

sub to_string {
	my ($self) = @_;
	
	return 'MismatchedSetException(' . $self->get_unexpected_type() . '!=' . $self->expecting . ')';
}

no Moose;
__PACKAGE__->meta->make_immutable();
1;
__END__

=head1 NAME

ANTLR::Runtime::MismatchedSetException

=head1 DESCRIPTION