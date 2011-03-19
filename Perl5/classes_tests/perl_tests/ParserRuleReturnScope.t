#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 14;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::ParserRuleReturnScope' );
	use_ok( 'ANTLR::Runtime::CommonToken' );
}

# New Ok

my $rule = new_ok( 'ANTLR::Runtime::ParserRuleReturnScope' );
my $token_start = new_ok( 'ANTLR::Runtime::CommonToken' => [ type => 1, start => 0, stop => 2 ] );
my $token_stop = new_ok( 'ANTLR::Runtime::CommonToken' => [ type => 2, start => 1, stop => 5 ] );

# Accessors Ok

is( $rule->get_start(), undef, 'start is undefined (default)' );
is( $rule->get_stop(), undef, 'stop is undefined (default)' );

# Mutators

$rule->start($token_start);
$rule->stop($token_stop);

# Accessing Previous Mutations Ok

is( $rule->get_start(), $token_start, "start is the token represented by $token_start" );
is( $rule->get_stop(), $token_stop, "stop is the token represented by $token_stop" );

# New Ok

$token_start = new_ok( 'ANTLR::Runtime::CommonToken' => [ type => 1, start => 0, stop => 2, text => 'token 1' ] );
$token_stop = new_ok( 'ANTLR::Runtime::CommonToken' => [ type => 2, start => 1, stop => 5, text => 'token 2' ] );

# New Ok With New Construct

$rule = new_ok( 'ANTLR::Runtime::ParserRuleReturnScope' => [ start => $token_start, stop => $token_stop ] );

# Accessors Ok

is( $rule->get_start(), $token_start, "start is token 1, represented by $token_start" );
is( $rule->get_stop(), $token_stop, "stop is token 2, represented by $token_stop" );