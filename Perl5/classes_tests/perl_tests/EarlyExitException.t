#!/usr/bin/perl

use strict;
use warnings;

use Try::Tiny;
use Exception::Class;
use English qw( -no_match_vars );

use Test::More tests => 18;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::EarlyExitException' );
	use_ok( 'ANTLR::Runtime::ANTLRStringStream' );
}

# New Ok

my $stream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is input text' ] );
my $eee = new_ok( 'ANTLR::Runtime::EarlyExitException' => [ input => $stream, decision_number => 1 ] );

# Accessors Ok

is( $eee->{message}, '', 'message is empty' );

# New Ok With New Construct

$eee = new_ok( 'ANTLR::Runtime::EarlyExitException' => [
                                input => $stream,
                                message => 'test error message',
                                decision_number => 1
               ]
);

# Accessors Ok

is( $eee->{message}, 'test error message', "message is 'test error message'" );
is_deeply( $eee->input->input, ['t','h','i','s',' ','i','s',' ','i','n','p','u','t',' ','t','e','x','t'], "input is 'this is input text'" );
is( $eee->index, 0, 'index is 0 (default)' );
is( $eee->get_token(), undef, 'token is undefined (default)' );
is( $eee->node, undef, 'node is undefined (default)' );
is( $eee->get_c(), 't', "current char is 't' (LA(1))" );
is( $eee->get_line(), 1, 'line is 1 (default)' );
is( $eee->get_char_position_in_line(), 0, 'char_position_in_line is 0 (default)' );
is( $eee->approximate_line_info, undef, 'approximate_line_info is undefined (default)' );
is( $eee->decision_number, 1, 'decision number is 1' );

# Methods Ok

is( $eee->get_unexpected_type(), 't', "got unexpected type 't'" );

# Throw Ok

try {
	$eee->throw();
}

# Catch Ok

catch {
	$EVAL_ERROR = $_;
    my $error = Exception::Class->caught('ANTLR::Runtime::EarlyExitException');
    is( $error->{message}, 'test error message', 'ERROR: test error message' );
}