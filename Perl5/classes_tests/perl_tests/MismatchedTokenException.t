#!/usr/bin/perl

use strict;
use warnings;

use Try::Tiny;
use Exception::Class;
use English qw( -no_match_vars );

use Test::More tests => 22;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::MismatchedTokenException' );
	use_ok( 'ANTLR::Runtime::ANTLRStringStream' );
	use_ok( 'ANTLR::Runtime::CommonToken' );
}

# New Ok

my $stream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is input text' ] );
my $token = new_ok( 'ANTLR::Runtime::CommonToken' => [ type => 1 ] );
my $mte = new_ok( 'ANTLR::Runtime::MismatchedTokenException' => [ input => $stream ] );

# Accessors Ok

is( $mte->{message}, '', 'message is empty' );
is( $mte->get_expecting(), 0, 'expecting is 0 (default)');

# New Ok With New Construct

$mte = new_ok( 'ANTLR::Runtime::MismatchedTokenException' => [
                                       input => $stream,
                                       message => 'test error message',
                                       expecting => 1,
                                       token => $token
                ]
);

# Accessors Ok

is( $mte->{message}, 'test error message', "message is 'test error message'" );
is_deeply( $mte->input->input, ['t','h','i','s',' ','i','s',' ','i','n','p','u','t',' ','t','e','x','t'], "input is 'this is input text'" );
is( $mte->get_expecting(), 1, 'expecting is 1');
is( $mte->index, 0, 'index is 0 (default)' );
is( $mte->get_token()->type, 1, 'token type is 1' );
is( $mte->node, undef, 'node is undefined (default)' );
is( $mte->get_c(), 't', "current char is 't' (LA(1))" );
is( $mte->get_line(), 1, 'line is 1 (default)' );
is( $mte->get_char_position_in_line(), 0, 'char_position_in_line is 0 (default)' );
is( $mte->approximate_line_info, undef, 'approximate_line_info is undefined (default)' );

# Methods Ok

is( $mte->get_unexpected_type(), 't', "got unexpected type 't'" );

# Throw Ok

try {
	$mte->throw();
}

# Catch Ok

catch {
	$EVAL_ERROR = $_;
    my $error = Exception::Class->caught('ANTLR::Runtime::MismatchedTokenException');
    is( $error->{message}, 'test error message', 'ERROR: test error message' );
    is( "$error", 'MismatchedTokenException(t!=1)', 'to_String() == MismatchedTokenException(t!=1)' );
}