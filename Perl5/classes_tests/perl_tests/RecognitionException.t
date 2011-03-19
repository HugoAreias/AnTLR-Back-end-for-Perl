#!/usr/bin/perl

use strict;
use warnings;

use Try::Tiny;
use Exception::Class;
use English qw( -no_match_vars );

use Test::More tests => 17;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::RecognitionException' );
	use_ok( 'ANTLR::Runtime::ANTLRStringStream' );
}

# New Ok

my $stream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is input text' ] );
my $re = new_ok( 'ANTLR::Runtime::RecognitionException' => [ input => $stream ] );

# Accessors Ok

is( $re->{message}, '', 'message is empty' );

# New Ok With New Construct

$re = new_ok( 'ANTLR::Runtime::RecognitionException' => [ input => $stream, message => 'test error message' ] );

# Accessors Ok

is( $re->{message}, 'test error message', "message is 'test error message'" );
is_deeply( $re->input->input, ['t','h','i','s',' ','i','s',' ','i','n','p','u','t',' ','t','e','x','t'], "input is 'this is input text'" );
is( $re->index, 0, 'index is 0 (default)' );
is( $re->get_token(), undef, 'token is undefined (default)' );
is( $re->node, undef, 'node is undefined (default)' );
is( $re->get_c(), 't', "current char is 't' (LA(1))" );
is( $re->get_line(), 1, 'line is 1 (default)' );
is( $re->get_char_position_in_line(), 0, 'char_position_in_line is 0 (default)' );
is( $re->approximate_line_info, undef, 'approximate_line_info is undefined (default)' );

# Methods Ok

is( $re->get_unexpected_type(), 't', "got unexpected type 't'" );

# Throw Ok

try {
	$re->throw();
}

# Catch Ok

catch {
	$EVAL_ERROR = $_;
    my $error = Exception::Class->caught('ANTLR::Runtime::RecognitionException');
    is( $error->{message}, 'test error message', 'ERROR: test error message' );
}