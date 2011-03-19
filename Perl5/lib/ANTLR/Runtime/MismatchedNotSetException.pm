package ANTLR::Runtime::MismatchedNotSetException;

use Moose;

use overload
	'""' => \&to_string;

extends 'ANTLR::Runtime::MismatchedSetException';

sub to_string {
	my ($self) = @_;
	
	return 'MismatchedNotSetException(' . $self->get_unexpected_type() . '!=' . $self->expecting . ')';
}

no Moose;
__PACKAGE__->meta->make_immutable();
1;
__END__

=head1 NAME

ANTLR::Runtime::MismatchedNotSetException

=head1 DESCRIPTION