#!/usr/bin/perl

use strict;
use warnings;

use Try::Tiny;
use Exception::Class;
use English qw( -no_match_vars );

use Test::More tests => 20;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::MismatchedNotSetException' );
	use_ok( 'ANTLR::Runtime::ANTLRStringStream' );
	use_ok( 'ANTLR::Runtime::BitSet' );
}

# New Ok

my $bitset = new_ok( 'ANTLR::Runtime::BitSet' );
my $stream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is input text' ] );
my $mnse = new_ok( 'ANTLR::Runtime::MismatchedNotSetException' => [ input => $stream, expecting => $bitset ] );

# Accessors Ok

is( $mnse->{message}, '', 'message is empty' );

# New Ok With New Construct

$mnse = new_ok( 'ANTLR::Runtime::MismatchedNotSetException' => [
                                       input => $stream,
                                       message => 'test error message',
                                       expecting => $bitset
                ]
);

# Accessors Ok

is( $mnse->{message}, 'test error message', "message is 'test error message'" );
is_deeply( $mnse->input->input, ['t','h','i','s',' ','i','s',' ','i','n','p','u','t',' ','t','e','x','t'], "input is 'this is input text'" );
is( $mnse->index, 0, 'index is 0 (default)' );
is( $mnse->get_token(), undef, 'token is undefined (default)' );
is( $mnse->node, undef, 'node is undefined (default)' );
is( $mnse->get_c(), 't', "current char is 't' (LA(1))" );
is( $mnse->get_line(), 1, 'line is 1 (default)' );
is( $mnse->get_char_position_in_line(), 0, 'char_position_in_line is 0 (default)' );
is( $mnse->approximate_line_info, undef, 'approximate_line_info is undefined (default)' );

# Methods Ok

is( $mnse->get_unexpected_type(), 't', "got unexpected type 't'" );

# Throw Ok

try {
	$mnse->throw();
}

# Catch Ok

catch {
	$EVAL_ERROR = $_;
    my $error = Exception::Class->caught('ANTLR::Runtime::MismatchedNotSetException');
    is( $error->{message}, 'test error message', 'ERROR: test error message' );
    is( "$error", 'MismatchedNotSetException(t!={})', 'to_String() == MismatchedNotSetException(t!={})' );
}