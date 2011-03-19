#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 25;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::Lexer' );
	use_ok( 'ANTLR::Runtime::CommonTokenStream');
	use_ok( 'ANTLR::Runtime::ANTLRStringStream');
	use_ok( 'ANTLR::Runtime::Parser');
	use_ok( 'ANTLR::Runtime::RecognizerSharedState');
	use_ok( 'ANTLR::Runtime::EarlyExitException' );
	use_ok( 'ANTLR::Runtime::BitSet' );
}

# New Ok

my $follow = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000044' ] });
my $input = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is the input' ] );
my $intstream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => '201345' ] );
my $lexer = new_ok( 'ANTLR::Runtime::Lexer' => [ input => $input ] );
my $cts = new_ok( 'ANTLR::Runtime::CommonTokenStream' => [ token_source => $lexer ] );
my $parser = new_ok( 'ANTLR::Runtime::Parser' => [ input => undef ] );
my $rss = new_ok( 'ANTLR::Runtime::RecognizerSharedState' => [
                                            backtracking => 1,
                                            type => 2,
                                            token_start_line => 1,
                                            token_start_char_position_in_line => 0,
                                            channel => 2
                      ]
);
my $token1 = new_ok( 'ANTLR::Runtime::CommonToken' => [
                                        type => 1,
                                        line => 1,
                                        input => $input,
                                        start => 1,
                                        stop => 5
                         ]
);
my $token2 = new_ok( 'ANTLR::Runtime::CommonToken' => [
                                        type => 2,
                                        line => 1,
                                        input => $input,
                                        start => 1,
                                        stop => 8
                         ]
);
my $token3 = new_ok( 'ANTLR::Runtime::CommonToken' => [
                                        type => 3,
                                        line => 1,
                                        input => $input,
                                        start => 1,
                                        stop => 2
                         ]
);
my $eee = new_ok( 'ANTLR::Runtime::EarlyExitException' => [
                                input => $intstream,
                                message => 'test error message',
                                decision_number => 1,
                                token => $token1
                  ]
);

# Accessors Ok

ok( !defined $parser->input, 'Input is undefined' );

# New Ok

$parser = new_ok( 'ANTLR::Runtime::Parser' => [ input => $cts, state => $rss ] );

# Mutators Ok

$parser->input->tokens([$token1,$token2,$token3]);
$parser->input->seek(0);

# Accessors Ok

is( $parser->state->backtracking, 0, 'Backtracking was resetted to 0 after creating a new parser object' );
is( $parser->get_source_name(), '', 'Source name of the stream is empty (default)' );
ok( $parser->get_token_stream()->isa('ANTLR::Runtime::CommonTokenStream'), 'Token stream is an instance of ANTLR::Runtime::CommonTokenStream class' );

# Methods Ok

is( $parser->get_current_input_symbol(), $token1, "Current input symbol is '[\@-1,1:5='his i',<1>,1:-1]'" );
is( $parser->trace_in('lavanda',0), undef, 'Trace in of rule lavanda' );
is( $parser->trace_out('lavanda',0), undef, 'Trace out of rule lavanda' );

# needs the get_token_names generated in the parser by AnTLR
# ok( $parser->get_missing_symbol({
# 	input => $intstream,
# 	exception => $eee,
# 	expected_token_type => 1,
# 	follow => $follow })->isa('ANTLR::Runtime::CommonToken'), 'get_missing_symbol() returned an instance of ANTLR::Runtime::CommonToken class' );