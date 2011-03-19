package ANTLR::Runtime::NoViableAltException;

use Moose;

use overload
    '""' => \&to_string;

extends 'ANTLR::Runtime::RecognitionException';

has 'grammar_decision_description' => (
    is  => 'ro',
    isa => 'Str',
    required => 1,
);

has 'decision_number' => (
    is  => 'ro',
    isa => 'Int',
    required => 1,
);

has 'state_number' => (
    is  => 'ro',
    isa => 'Int',
    required => 1,
);

sub to_string {
	my ($self) = @_;
	
	if ( $self->input->does('ANTLR::Runtime::CharStream') ) {
		return "NoViableAltException('" . $self->get_unexpected_type() . "'\@[" . $self->grammar_decision_description . '])';
	}
	else {
		return 'NoViableAltException(' . $self->get_unexpected_type() . '@[' . $self->grammar_decision_description . '])';
	}
}

no Moose;
__PACKAGE__->meta->make_immutable();
1;
__END__

=head1 NAME

ANTLR::Runtime::NoViableAltException

=head1 DESCRIPTION