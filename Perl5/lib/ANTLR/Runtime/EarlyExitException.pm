package ANTLR::Runtime::EarlyExitException;

use Moose;

extends 'ANTLR::Runtime::RecognitionException';

has 'decision_number' => (
	is => 'ro',
	isa => 'Int',
	required => 1,
);

no Moose;
1;
__END__

=head1 NAME

ANTLR::Runtime::EarlyExitException

=head1 DESCRIPTION

The recognizer did not match anything for a (..)+ loop.