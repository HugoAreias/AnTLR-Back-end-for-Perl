#!/usr/bin/perl

use strict;
use warnings;

use Try::Tiny;
use Exception::Class;
use English qw( -no_match_vars );

use Test::More tests => 20;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::MismatchedSetException' );
	use_ok( 'ANTLR::Runtime::ANTLRStringStream' );
	use_ok( 'ANTLR::Runtime::BitSet' );
}

# New Ok

my $bitset = new_ok( 'ANTLR::Runtime::BitSet' );
my $stream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is input text' ] );
my $mse = new_ok( 'ANTLR::Runtime::MismatchedSetException' => [ input => $stream, expecting => $bitset ] );

# Accessors Ok

is( $mse->{message}, '', 'message is empty' );

# New Ok With New Construct

$mse = new_ok( 'ANTLR::Runtime::MismatchedSetException' => [
                                       input => $stream,
                                       message => 'test error message',
                                       expecting => $bitset
                ]
);

# Accessors Ok

is( $mse->{message}, 'test error message', "message is 'test error message'" );
is_deeply( $mse->input->input, ['t','h','i','s',' ','i','s',' ','i','n','p','u','t',' ','t','e','x','t'], "input is 'this is input text'" );
is( $mse->index, 0, 'index is 0 (default)' );
is( $mse->get_token(), undef, 'token is undefined (default)' );
is( $mse->node, undef, 'node is undefined (default)' );
is( $mse->get_c(), 't', "current char is 't' (LA(1))" );
is( $mse->get_line(), 1, 'line is 1 (default)' );
is( $mse->get_char_position_in_line(), 0, 'char_position_in_line is 0 (default)' );
is( $mse->approximate_line_info, undef, 'approximate_line_info is undefined (default)' );

# Methods Ok

is( $mse->get_unexpected_type(), 't', "got unexpected type 't'" );

# Throw Ok

try {
	$mse->throw();
}

# Catch Ok

catch {
	$EVAL_ERROR = $_;
    my $error = Exception::Class->caught('ANTLR::Runtime::MismatchedSetException');
    is( $error->{message}, 'test error message', 'ERROR: test error message' );
    is( "$error", 'MismatchedSetException(t!={})', 'to_String() == MismatchedSetException(t!={})' );
}