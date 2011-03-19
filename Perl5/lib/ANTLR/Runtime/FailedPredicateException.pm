package ANTLR::Runtime::FailedPredicateException;

use Moose;

use overload
	'""' => \&to_string;

extends 'ANTLR::Runtime::RecognitionException';

has 'rule_name' => (
	is => 'ro',
	isa => 'Str',
	required => 1,
);

has 'predicate_text' => (
	is => 'ro',
	isa => 'Str',
	required => 1,
);

sub get_rule_name {
	my ($self) = @_;
	
	return $self->rule_name;
}

sub get_predicate_text {
	my ($self) = @_;
	
	return $self->predicate_text;
}

sub to_string {
	my ($self) = @_;
	
	return 'FailedPredicateException(' . $self->rule_name . ',{' . $self->predicate_text . '}?)';
}

no Moose;
__PACKAGE__->meta->make_immutable();
1;
__END__

=head1 NAME

ANTLR::Runtime::FailedPredicateException

=head1 DESCRIPTION

A semantic predicate failed during validation.  Validation of predicates
occurs when normally parsing the alternative just like matching a token.
Disambiguating predicate evaluation occurs when we hoist a predicate into
a prediction decision.