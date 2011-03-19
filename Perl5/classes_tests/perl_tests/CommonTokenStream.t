#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 62;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::Lexer' );
	use_ok( 'ANTLR::Runtime::CommonTokenStream');
	use_ok( 'ANTLR::Runtime::ANTLRStringStream');
	use_ok( 'ANTLR::Runtime::RecognizerSharedState');
	use_ok( 'ANTLR::Runtime::BitSet');
	use_ok( 'ANTLR::Runtime::CommonToken');
}

# New Ok

my $input = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is the input' ] );
my $lexer = new_ok( 'ANTLR::Runtime::Lexer' => [ input => $input ] );
my $cts = new_ok( 'ANTLR::Runtime::CommonTokenStream' => [ token_source => $lexer ] );

# Accessors Ok

ok( $cts->get_token_source()->isa('ANTLR::Runtime::Lexer'), 'Token source is an instance of ANTLR::Runtime::Lexer class' );
is_deeply( $cts->get_token_source()->input->input, ['t','h','i','s',' ','i','s',' ','t','h','e',' ','i','n','p','u','t'], "Input is 'this is the input'" );
is_deeply( $cts->tokens, [], 'tokens list is empty (default)' );
is( $cts->discard_set, undef, 'discard set is an undefined list (default)' );
is( $cts->discard_off_channel_tokens, 0, 'discard off channel takens is false (default)' );
is( $cts->channel, 0, 'channel is 0 (default)' );
is( $cts->channel_override_map, undef, 'channel override map is an undefined list (default)' );
is( $cts->last_marker, 0, 'last marker is 0 (default)');
is( $cts->index(), -1, 'p is -1 (default)' );

# New Ok

my $bitset = new_ok( 'ANTLR::Runtime::BitSet' => [ bits => '0101010' ] );
$input = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is the new input' ] );
my $rss = new_ok( 'ANTLR::Runtime::RecognizerSharedState' => [
                                            backtracking => 1,
                                            type => 2,
                                            token_start_line => 1,
                                            token_start_char_position_in_line => 0,
                                            channel => 2
                      ]
);
$lexer = new_ok( 'ANTLR::Runtime::Lexer' => [ input => $input, state => $rss ] );
my $token1 = new_ok( 'ANTLR::Runtime::CommonToken' => [
                                        type => 1,
                                        line => 1,
                                        input => $input,
                                        start => 1,
                                        stop => 10
                         ]
);
my $token2 = new_ok( 'ANTLR::Runtime::CommonToken' => [
                                        type => 2,
                                        line => 1,
                                        input => $input,
                                        start => 1,
                                        stop => 10
                         ]
);
my $token3 = new_ok( 'ANTLR::Runtime::CommonToken' => [
                                        type => 3,
                                        line => 1,
                                        input => $input,
                                        start => 1,
                                        stop => 10
                         ]
);
my $token4 = new_ok( 'ANTLR::Runtime::CommonToken' => [
                                        type => 4,
                                        line => 1,
                                        input => $input,
                                        start => 1,
                                        stop => 10
                         ]
);
my $token5 = new_ok( 'ANTLR::Runtime::CommonToken' => [
                                        type => 5,
                                        line => 1,
                                        input => $input,
                                        start => 1,
                                        stop => 10
                         ]
);

# Mutators

$cts->set_token_source($lexer);
$cts->tokens([$token1,$token2]);
$cts->discard_token_type(2);
$cts->discard_off_channel_tokens(1);
$cts->channel(1);
$cts->set_token_type_channel(2,1);
$cts->last_marker(1);
$cts->seek(2);

# Accessing Previous Mutations Ok

is_deeply( $cts->get_token_source()->input->input, ['t','h','i','s',' ','i','s',' ','t','h','e',' ','n','e','w',' ','i','n','p','u','t'], "Input is now 'this is the new input'" );
is_deeply( $cts->discard_set, {2 => 1}, 'discard set contains token type 2' );
is( $cts->discard_off_channel_tokens, 1, 'discard off channel tokens set to true' );
is( $cts->channel, 1, 'channel is 1' );
is_deeply( $cts->channel_override_map, {2 => 1}, 'token type 2 is overriden in channel 1' );
is( $cts->last_marker, 1, 'last marker is 1');
is( $cts->index(), 2, 'p is 2' );
is( $cts->get_source_name(), '', 'Source name is empty (default)' );

# Methods Ok

is( $cts->size(), 2, 'The token stream has 2 tokens' );

$cts->channel(0);
is( $cts->skip_off_token_channels(0), 0, 'Token in channel 1 found at index 0' );
is( $cts->skip_off_token_channels_reverse(1), 1, 'Token in channel 1 found at index 1 using reverse' );

is( $cts->reset(), undef, 'Resetted index (p) and last marker' );
is( $cts->index(), 0, 'p is 0 after reset' );
is( $cts->last_marker, 0, 'last marker is 0 after reset' );

ok( $cts->last_marker(1), 'last marker set to 1' );
is( $cts->rewind(), undef, 'rewind()');
is( $cts->index(), 1, 'index is 1 (last marker) after rewind' );
is( $cts->rewind(2), undef, 'rewind(2)');
is( $cts->index(), 2, 'index is 2 after rewind' );

ok( $cts->release(3), 'No resources to release' );

# $cts->seek(-1);
# is( $cts->mark(), 0, 'last marker set to 0' ); # infinite loop
is( $cts->mark(), 2, 'last marker set to 2 (index)' );

# is( $cts->fill_buffer(), undef, 'fill buffer' ); #infinite loop

$cts->seek(0);
ok( $cts->tokens([$token1,$token2,$token3,$token4,$token5]), 'tokens has now 5 elements' );
is( $cts->consume(), undef, "Consumed token 1" );
is( $cts->LA(1), 2, "LA(1) after consuming token 1 is token 2" );
is( $cts->LA(-1), 1, "LA(-1) (lookback) is token 1" );
is( $cts->LB(1), $token2, "LB(1) after consuming token 1 is token 2" );
is( $cts->LT(1), $token2, "LT(1) after consuming token 1 is token 2" );
is( $cts->LT(2), $token3, "LT(2) after consuming token 1 is token 3" );
is( $cts->consume(), undef, "Consumed token 2" );
is( $cts->LT(1), $token3, "LT(1) after consuming token 2 is token 3" );

is( $cts->get(0), $token1, "Token at index 0 is token 1" );
is( $cts->get(2), $token3, "Token at index 2 is token 3" );
is( $cts->get(4), $token5, "Token at index 4 is token 5" );
is_deeply( $cts->get_tokens({ start => 0, stop => 4, types => $bitset}), [$token1,$token3,$token5], 'Tokens 1, 3 and 5 are members of the BitSet' );
is_deeply( $cts->get_tokens({ start => 0, stop => 2, ttype => 2}), [$token2], 'Token 2 is member of BitSet->of(2)' );

print "to_String(0,4) with substring(1,10) == $cts\n";