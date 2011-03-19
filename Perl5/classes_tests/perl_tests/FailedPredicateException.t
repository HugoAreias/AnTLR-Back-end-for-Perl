#!/usr/bin/perl

use strict;
use warnings;

use Try::Tiny;
use Exception::Class;
use English qw( -no_match_vars );

use Test::More tests => 20;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::FailedPredicateException' );
	use_ok( 'ANTLR::Runtime::ANTLRStringStream' );
}

# New Ok

my $stream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is input text' ] );
my $fpe = new_ok( 'ANTLR::Runtime::FailedPredicateException' => [
                                  input => $stream,
                                  rule_name => 'lavanda',
                                  predicate_text => 'cabec sacos'
                  ]
);

# Accessors Ok

is( $fpe->{message}, '', 'message is empty' );

# New Ok With New Construct

$fpe = new_ok( 'ANTLR::Runtime::FailedPredicateException' => [
                                       input => $stream,
                                       message => 'test error message',
                                       rule_name => 'lavanda',
                                       predicate_text => 'cabec sacos'
                ]
);

# Accessors Ok

is( $fpe->{message}, 'test error message', "message is 'test error message'" );
is_deeply( $fpe->input->input, ['t','h','i','s',' ','i','s',' ','i','n','p','u','t',' ','t','e','x','t'], "input is 'this is input text'" );
is( $fpe->index, 0, 'index is 0 (default)' );
is( $fpe->get_token(), undef, 'token is undefined (default)' );
is( $fpe->node, undef, 'node is undefined (default)' );
is( $fpe->get_c(), 't', "current char is 't' (LA(1))" );
is( $fpe->get_line(), 1, 'line is 1 (default)' );
is( $fpe->get_char_position_in_line(), 0, 'char_position_in_line is 0 (default)' );
is( $fpe->approximate_line_info, undef, 'approximate_line_info is undefined (default)' );
is( $fpe->get_rule_name(), 'lavanda', "rule name is 'lavanda'" );
is( $fpe->get_predicate_text(), 'cabec sacos', "predicate text is 'cabec sacos'" );

# Methods Ok

is( $fpe->get_unexpected_type(), 't', "got unexpected type 't'" );

# Throw Ok

try {
	$fpe->throw();
}

# Catch Ok

catch {
	$EVAL_ERROR = $_;
    my $error = Exception::Class->caught('ANTLR::Runtime::FailedPredicateException');
    is( $error->{message}, 'test error message', 'ERROR: test error message' );
    is( "$error", 'FailedPredicateException(lavanda,{cabec sacos}?)', 'to_String() == FailedPredicateException(lavanda,{cabec sacos}?)' );
}