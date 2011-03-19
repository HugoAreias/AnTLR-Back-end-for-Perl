#!/usr/bin/perl

use strict;
use warnings;

use Try::Tiny;
use Exception::Class;
use English qw( -no_match_vars );

use Test::More tests => 24;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::MissingTokenException' );
	use_ok( 'ANTLR::Runtime::ANTLRStringStream' );
	use_ok( 'ANTLR::Runtime::CommonToken' );
}

# New Ok

my $stream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is input text' ] );
my $token = new_ok( 'ANTLR::Runtime::CommonToken' => [
                                        type => 1,
                                        line => 1,
                                        input => $stream,
                                        start => 1,
                                        stop => 10
                         ]
);
my $ute = new_ok( 'ANTLR::Runtime::MissingTokenException' => [ input => $stream ] );

# Accessors Ok

is( $ute->{message}, '', 'message is empty' );
is( $ute->get_missing_type(), 0, 'missing type is 0 (default expecting)');
is( $ute->inserted, undef, 'inserted is undefined (default)');

# New Ok With New Construct

$ute = new_ok( 'ANTLR::Runtime::MissingTokenException' => [
                                       input => $stream,
                                       message => 'test error message',
                                       expecting => 1,
                                       token => $token,
                                       inserted => $token
                ]
);

# Accessors Ok

is( $ute->{message}, 'test error message', "message is 'test error message'" );
is_deeply( $ute->input->input, ['t','h','i','s',' ','i','s',' ','i','n','p','u','t',' ','t','e','x','t'], "input is 'this is input text'" );
is( $ute->get_missing_type(), 1, 'missing type is 1 (expecting)');
is( $ute->index, 0, 'index is 0 (default)' );
is( $ute->get_token()->type, 1, 'token type is 1' );
is( $ute->node, undef, 'node is undefined (default)' );
is( $ute->get_c(), 't', "current char is 't' (LA(1))" );
is( $ute->get_line(), 1, 'line is 1 (default)' );
is( $ute->get_char_position_in_line(), 0, 'char_position_in_line is 0 (default)' );
is( $ute->approximate_line_info, undef, 'approximate_line_info is undefined (default)' );
is( $ute->inserted, $token, 'inserted is a token' );

# Methods Ok

is( $ute->get_unexpected_type(), 't', "got unexpected type 't'" );

# Throw Ok

try {
	$ute->throw();
}

# Catch Ok

catch {
	$EVAL_ERROR = $_;
    my $error = Exception::Class->caught('ANTLR::Runtime::MissingTokenException');
    is( $error->{message}, 'test error message', 'ERROR: test error message' );
    is( "$error", "MissingTokenException(inserted [\@-1,1:10='his is inp',<1>,1:-1] at his is inp)", "MissingTokenException(inserted [\@-1,1:10=his is inp',<1>,1:-1] at his is inp)" );
}