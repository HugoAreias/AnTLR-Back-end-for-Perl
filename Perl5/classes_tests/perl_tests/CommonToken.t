#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 34;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::CommonToken' );
	use_ok( 'ANTLR::Runtime::ANTLRStringStream');
}

# New Ok

my $token = new_ok( 'ANTLR::Runtime::CommonToken' => [ type => 1 ] );

# Accessors Ok

is( $token->get_type(), 1, 'type is 1' );
is( $token->get_line(), 0, 'line is 0 (default)' );
is( $token->get_char_position_in_line(), -1, 'char_position_in_line is -1 (default)' );
require_ok( 'ANTLR::Runtime::Token' );
is( $token->get_channel(), ANTLR::Runtime::Token->DEFAULT_CHANNEL, 'channel is 0 (default)' );
is( $token->get_input_stream(), undef, 'input is undefined (default)' );
is( $token->get_text(), undef, 'text is undefined (default)' );
is( $token->get_token_index(), -1, 'index is -1 (default)' );
is( $token->get_start_index(), undef, 'start is undefined (default)' );
is( $token->get_stop_index(), undef, 'stop is undefined (default)' );

# New Ok

my $strstream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is input text' ] );
my $new_token = new_ok( 'ANTLR::Runtime::CommonToken' => [
                                        type => 2,
                                        line => 1,
                                        input => $strstream,
                                        start => 1,
                                        stop => 10
                         ]
);

# New Ok With New Construct

$token = new_ok( 'ANTLR::Runtime::CommonToken' => [ type => -1, token => $new_token ] );

# Accessors Ok

is( $token->get_type(), 2, 'type in new token is 2' );
is( $token->get_line(), 1, 'line in new token is 1' );
is( $token->get_char_position_in_line(), -1, 'char_position_in_line in new token is -1 (default)' );
is( $token->get_channel(), ANTLR::Runtime::Token->DEFAULT_CHANNEL, 'channel in new token is 0 (default)' );
is( $token->get_input_stream(), undef, 'input in new token is undefined (default)' );
is( $token->get_text(), 'his is inp', "text in new token is 'his is inp' with start = 1 and stop = 10" );
is( $token->get_token_index(), -1, 'index in new token is -1 (default)' );
is( $token->get_start_index(), 1, 'start in new token is 1' );
is( $token->get_stop_index(), 10, 'stop in new token is 10' );

# Mutators Ok

$token->set_type(3);
$token->set_line(2);
$token->set_char_position_in_line(0);
$token->set_channel(1);
$token->set_input_stream($strstream);
$token->set_text('THIS IS MY NEW TEXT');
$token->set_token_index(1);
$token->set_start_index(0);
$token->set_stop_index(7);

# Accessing Previous Mutations Ok

is( $token->get_type(), 3, 'type is now 3' );
is( $token->get_line(), 2, 'line is now 2' );
is( $token->get_char_position_in_line(), 0, 'char_position_in_line is now 0' );
is( $token->get_channel(), 1, 'channel is now 1' );
is( $token->get_input_stream(), $strstream, "input is now '" . $strstream->input . "'" );
is( $token->get_text(), 'THIS IS MY NEW TEXT', "text is now 'THIS IS MY NEW TEXT'" );
is( $token->get_token_index(), 1, 'index is now 1' );
is( $token->get_start_index(), 0, 'start is now 0' );
is( $token->get_stop_index(), 7, 'stop is now 7' );

# Methods Ok

print "to_String() == " . $token->to_string . "\n";
print "not_eof() == " . $token->not_eof() . "\n" if $token;