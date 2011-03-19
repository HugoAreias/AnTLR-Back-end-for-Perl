#!/usr/bin/perl

use strict;
use warnings;

use Try::Tiny;
use Exception::Class;
use English qw( -no_match_vars );

use Test::More tests => 21;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::NoViableAltException' );
	use_ok( 'ANTLR::Runtime::ANTLRStringStream' );
}

# New Ok

my $stream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is input text' ] );
my $nvae = new_ok( 'ANTLR::Runtime::NoViableAltException' => [
                                input => $stream,
                                decision_number => 1,
                                state_number => 0,
                                grammar_decision_description => ""
               ]
);

# Accessors Ok

is( $nvae->{message}, '', 'message is empty' );

# New Ok With New Construct

$nvae = new_ok( 'ANTLR::Runtime::NoViableAltException' => [
                                input => $stream,
                                message => 'test error message',
                                decision_number => 1,
                                state_number => 0,
                                grammar_decision_description => 'expected saco'
               ]
);

# Accessors Ok

is( $nvae->{message}, 'test error message', "message is 'test error message'" );
is_deeply( $nvae->input->input, ['t','h','i','s',' ','i','s',' ','i','n','p','u','t',' ','t','e','x','t'], "input is 'this is input text'" );
is( $nvae->index, 0, 'index is 0 (default)' );
is( $nvae->get_token(), undef, 'token is undefined (default)' );
is( $nvae->node, undef, 'node is undefined (default)' );
is( $nvae->get_c(), 't', "current char is 't' (LA(1))" );
is( $nvae->get_line(), 1, 'line is 1 (default)' );
is( $nvae->get_char_position_in_line(), 0, 'char_position_in_line is 0 (default)' );
is( $nvae->approximate_line_info, undef, 'approximate_line_info is undefined (default)' );
is( $nvae->decision_number, 1, 'decision number is 1' );
is( $nvae->state_number, 0, 'state number is 0' );
is( $nvae->grammar_decision_description, 'expected saco', "grammar decision description is 'expected saco'" );

# Methods Ok

is( $nvae->get_unexpected_type(), 't', "got unexpected type 't'" );

# Throw Ok

try {
	$nvae->throw();
}

# Catch Ok

catch {
	$EVAL_ERROR = $_;
    my $error = Exception::Class->caught('ANTLR::Runtime::NoViableAltException');
    is( $error->{message}, 'test error message', 'ERROR: test error message' );
    is( "$error", "NoViableAltException('t'@[expected saco])", "to_String() == NoViableAltException('t'@[expected saco])" );
}