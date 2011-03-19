#!/usr/bin/perl

use strict;
use warnings;

use Try::Tiny;
use Exception::Class;
use English qw( -no_match_vars );

use Test::More tests => 22;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::MismatchedRangeException' );
	use_ok( 'ANTLR::Runtime::ANTLRStringStream' );
	use_ok( 'ANTLR::Runtime::BitSet' );
}

# New Ok

my $bitset = new_ok( 'ANTLR::Runtime::BitSet' );
my $stream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is input text' ] );
my $mre = new_ok( 'ANTLR::Runtime::MismatchedRangeException' => [
                                  input => $stream,
                                  expecting => $bitset,
                                  a => 2,
                                  b => 4
                  ]
);

# Accessors Ok

is( $mre->{message}, '', 'message is empty' );

# New Ok With New Construct

$mre = new_ok( 'ANTLR::Runtime::MismatchedRangeException' => [
                                       input => $stream,
                                       message => 'test error message',
                                       expecting => $bitset,
                                       a => 1,
                                       b => 6
                ]
);

# Accessors Ok

is( $mre->{message}, 'test error message', "message is 'test error message'" );
is_deeply( $mre->input->input, ['t','h','i','s',' ','i','s',' ','i','n','p','u','t',' ','t','e','x','t'], "input is 'this is input text'" );
is( $mre->index, 0, 'index is 0 (default)' );
is( $mre->get_token(), undef, 'token is undefined (default)' );
is( $mre->node, undef, 'node is undefined (default)' );
is( $mre->get_c(), 't', "current char is 't' (LA(1))" );
is( $mre->get_line(), 1, 'line is 1 (default)' );
is( $mre->get_char_position_in_line(), 0, 'char_position_in_line is 0 (default)' );
is( $mre->approximate_line_info, undef, 'approximate_line_info is undefined (default)' );
is( $mre->a, 1, 'a is 1' );
is( $mre->b, 6, 'b is 6' );

# Methods Ok

is( $mre->get_unexpected_type(), 't', "got unexpected type 't'" );

# Throw Ok

try {
	$mre->throw();
}

# Catch Ok

catch {
	$EVAL_ERROR = $_;
    my $error = Exception::Class->caught('ANTLR::Runtime::MismatchedRangeException');
    is( $error->{message}, 'test error message', 'ERROR: test error message' );
    is( "$error", 'MismatchedNotSetException(t not in [1,6])', 'to_String() == MismatchedNotSetException(t not in [1,6])' );
}