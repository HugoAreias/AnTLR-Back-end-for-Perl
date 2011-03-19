package ANTLR::Runtime::RecognitionException;

use Moose;
use Moose::Util::TypeConstraints;

extends 'ANTLR::Runtime::Exception';

# What input stream did the error occur in?
has 'input' => (
    is   => 'ro',
    does => 'ANTLR::Runtime::IntStream',
    required => 1,
);

# What is index of token/char were we looking at when the error occurred?
has 'index' => (
    is  => 'ro',
    isa => 'Int',
    default => 0,
);

# The current Token when an error occurred.  Since not all streams
# can retrieve the ith Token, we have to track the Token object.
# For parsers.  Even when it's a tree parser, token might be set.
has 'token' => (
    is   => 'ro',
    does => 'ANTLR::Runtime::Token',
);

# If this is a tree parser exception, node is set to the node with
# the problem.
has 'node' => (
    is  => 'ro',
    isa => 'Any',
);

subtype 'Char'
    => as 'Str'
    => where { $_ eq '-1' || length == 1 };

# The current char when an error occurred. For lexers.
has 'c' => (
    is  => 'ro',
    isa => 'Maybe[Char]',
);

# Track the line at which the error occurred in case this is
# generated from a lexer.  We need to track this since the
# unexpected char doesn't carry the line info.
has 'line' => (
    is  => 'ro',
    isa => 'Int',
    default => 0,
);

has 'char_position_in_line' => (
    is  => 'ro',
    isa => 'Int',
    default => 0,
);

# If you are parsing a tree node stream, you will encounter som
# imaginary nodes w/o line/col info.  We now search backwards looking
# for most recent token with line/col info, but notify getErrorHeader()
# that info is approximate.
has 'approximate_line_info' => (
    is  => 'rw',
    isa => 'Bool',
);

sub BUILDARGS {
    my ($class, @args) = @_;
    my $args = $class->SUPER::BUILDARGS(@args);

    my $new_args = { %$args };
    my $input = $args->{input};
    $new_args->{input} = $input;
    $new_args->{index} = $input->index();

    if ($input->does('ANTLR::Runtime::TokenStream')) {
        my $token = $input->LT(1);
        $new_args->{token} = $token;
        $new_args->{line} = $token->get_line();
        $new_args->{char_position_in_line} = $token->get_char_position_in_line();
    }

    if ($input->does('ANTLR::Runtime::TreeNodeStream')) {
        # extract_information_from_tree_node_stream($input);
    }
    elsif ($input->does('ANTLR::Runtime::CharStream')) {
        $new_args->{c} = $input->LA(1);
        $new_args->{line} = $input->get_line();
        $new_args->{char_position_in_line} = $input->get_char_position_in_line();
    }
    else {
        $new_args->{c} = $input->LA(1);
    }

    return $new_args;
}

# Return the token type or char of the unexpected input element
sub get_unexpected_type {
    my ($self) = @_;

    if ($self->input->does('ANTLR::Runtime::TokenStream')) {
        return $self->token->get_type();
    }
	elsif ($self->input->does('ANTLR::Runtime::TreeNodeStream')) {
		# my $adaptor = $self->input->get_tree_adaptor();
		# return $adaptor->get_type($self->node)
	}
	else {
        return $self->c;
    }
}

sub get_c {
    my ($self) = @_;
    return $self->c;
}

sub get_line {
    my ($self) = @_;
    return $self->line;
}

sub get_char_position_in_line {
    my ($self) = @_;
    return $self->char_position_in_line;
}

sub get_token {
    my ($self) = @_;
    return $self->token;
}

no Moose;
__PACKAGE__->meta->make_immutable();
1;
__END__

=head1 NAME

ANTLR::Runtime::RecognitionException

=head1 DESCRIPTION

The root of the ANTLR exception hierarchy.

To avoid English-only error messages and to generally make things
as flexible as possible, these exceptions are not created with strings,
but rather the information necessary to generate an error.  Then
the various reporting methods in Parser and Lexer can be overridden
to generate a localized error message.  For example, MismatchedToken
exceptions are built with the expected token type.
So, don't expect getMessage() to return anything.

ANTLR generates code that throws exceptions upon recognition error and
also generates code to catch these exceptions in each rule.  If you
want to quit upon first error, you can turn off the automatic error
handling mechanism using rulecatch action, but you still need to
override methods mismatch and recoverFromMismatchSet.

In general, the recognition exceptions can track where in a grammar a
problem occurred and/or what was the expected input.  While the parser
knows its state (such as current input symbol and line info) that
state can change before the exception is reported so current token index
is computed and stored at exception time.  From this info, you can
perhaps print an entire line of input not just a single token, for example.
Better to just say the recognizer had a problem and then let the parser
figure out a fancy report.