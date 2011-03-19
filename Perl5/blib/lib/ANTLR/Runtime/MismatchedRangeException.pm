package ANTLR::Runtime::MismatchedRangeException;

use Moose;

use overload
	'""' => \&to_string;

extends 'ANTLR::Runtime::RecognitionException';

has 'a' => (
	is => 'ro',
	isa => 'Int',
	required => 1,
);

has 'b' => (
	is => 'ro',
	isa => 'Int',
	required => 1,
);

sub to_string {
	my ($self) = @_;
	my $a = $self->a;
	my $b = $self->b;
	
	return 'MismatchedNotSetException(' . $self->get_unexpected_type() . " not in [$a,$b])";
}

no Moose;
__PACKAGE__->meta->make_immutable();
1;
__END__

=head1 NAME

ANTLR::Runtime::MismatchedRangeException

=head1 DESCRIPTION