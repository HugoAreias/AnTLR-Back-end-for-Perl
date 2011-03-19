#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 41;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::RecognizerSharedState' );
	use_ok( 'ANTLR::Runtime::BitSet' );
	use_ok( 'ANTLR::Runtime::CommonToken' );
}

# New Ok

my $rss = new_ok( 'ANTLR::Runtime::RecognizerSharedState' );

# Accessors Ok

is_deeply( $rss->following, [], 'Following is empty (default)' );
is( $rss->_fsp, -1, '_fsp is -1 (default)' );
is( $rss->error_recovery, 0, 'Error recovery is 0 (default)' );
is( $rss->last_error_index, -1, 'Last error index is -1 (default)' );
is( $rss->failed, 0, 'failed is 0 (default)' );
is( $rss->syntax_errors, 0, 'Syntax errors is 0 (default)' );
is( $rss->backtracking, 0, 'backtracking is 0 (default)' );
is( $rss->rule_memo, undef, 'Rule memo is undefined (default)' );
is( $rss->token, undef, 'Token is undefined (default)' );
is( $rss->token_start_char_index, -1, 'Token start char index is -1 (default)' );
is( $rss->token_start_line, undef, 'Token start line is undefined (default)' );
is( $rss->token_start_char_position_in_line, undef, 'Token start char position in line is undefined (default)' );
is( $rss->channel, undef, 'Channel is undefined (default)' );
is( $rss->type, undef, 'Type is undefined (default)' );
is( $rss->text, undef, 'Text is undefined (default)' );

# New Ok

my $bitset = new_ok( 'ANTLR::Runtime::BitSet' );
my $token = new_ok( 'ANTLR::Runtime::CommonToken' => [ type => 1, start => 1, stop => 10 ] );

# Mutators Ok

push @{$rss->following}, $bitset;
$rss->_fsp(0);
$rss->error_recovery(1);
$rss->last_error_index(1);
$rss->failed(1);
$rss->syntax_errors(1);
$rss->backtracking(1);
$rss->rule_memo([{0 => 1,2 => 3,4 => 5},{0 => 1,2 => 4,4 => 256}]);
$rss->token($token);
$rss->token_start_char_index(0);
$rss->token_start_line(0);
$rss->token_start_char_position_in_line(0);
$rss->channel(1);
$rss->type(1);
$rss->text('my text');

# Accessors Ok

is_deeply( $rss->following, [$bitset], 'Following now contains one bitset' );
is( $rss->_fsp, 0, '_fsp is now 0' );
is( $rss->error_recovery, 1, 'Error recovery is now 1' );
is( $rss->last_error_index, 1, 'Last error index is now 1' );
is( $rss->failed, 1, 'failed is now 1' );
is( $rss->syntax_errors, 1, 'Syntax errors is now 1' );
is( $rss->backtracking, 1, 'backtracking is now 1' );
is_deeply( $rss->rule_memo, [{4 => 5,0 => 1,2 => 3},{4 => 256,0 => 1,2 => 4}], 'Rule memo is now a list with two hashes' );
is( $rss->token, $token, 'Token now contains a token of type 1' );
is( $rss->token_start_char_index, 0, 'Token start char index is now 0' );
is( $rss->token_start_line, 0, 'Token start line is now 0' );
is( $rss->token_start_char_position_in_line, 0, 'Token start char position in line is now 0' );
is( $rss->channel, 1, 'Channel is now 1' );
is( $rss->type, 1, 'Type is now 1' );
is( $rss->text, 'my text', "Text is now 'my text'" );

# New Ok

my $new_rss = new_ok( 'ANTLR::Runtime::RecognizerSharedState' => [
                                            backtracking => 1,
                                            type => 2,
                                            token_start_line => 1,
                                            token_start_char_position_in_line => 0,
                                            channel => 2
                      ]
);

# New Ok With New Construct

$rss = new_ok( 'ANTLR::Runtime::RecognizerSharedState' => [ state => $new_rss ] );

# Accessors Ok

is( $rss->backtracking, 1, 'Backtracking in the new state is 1' );
is( $rss->type, 2, 'Type of the new state is 2' );
is( $rss->channel, 2, 'Channel of the new state is 2' );
