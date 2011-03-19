#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 76;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::BaseRecognizer' );
	use_ok( 'ANTLR::Runtime::RecognizerSharedState' );
	use_ok( 'ANTLR::Runtime::BitSet' );
	use_ok( 'ANTLR::Runtime::ANTLRStringStream' );
	use_ok( 'ANTLR::Runtime::RecognitionException' );
	use_ok( 'ANTLR::Runtime::CommonToken' );
	use_ok( 'ANTLR::Runtime::EarlyExitException' );
	use_ok( 'ANTLR::Runtime::UnwantedTokenException' );
}

# New Ok

my $br = new_ok( 'ANTLR::Runtime::BaseRecognizer' );
my $follow = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000040' ] });
my $follow2 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000044' ] });
my $follow3 = ANTLR::Runtime::BitSet->new({ bits => '011011101100' });
my $strstream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is input text' ] );
my $intstream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => '201345' ] );
my $re = new_ok( 'ANTLR::Runtime::RecognitionException' => [ input => $strstream ] );
my $token = new_ok( 'ANTLR::Runtime::CommonToken' => [
                                        type => 2,
                                        line => 1,
                                        input => $strstream,
                                        start => 1,
                                        stop => 10
                         ]
);
my $token2 = new_ok( 'ANTLR::Runtime::CommonToken' => [
                                        type => 2,
                                        line => 1,
                                        input => $intstream,
                                        start => 2,
                                        stop => 5
                         ]
);
my $token3 = new_ok( 'ANTLR::Runtime::CommonToken' => [
                                        type => 2,
                                        line => 1,
                                        input => $strstream,
                                        start => 3,
                                        stop => 6
                         ]
);
my $eee = new_ok( 'ANTLR::Runtime::EarlyExitException' => [
                                input => $strstream,
                                message => 'test error message',
                                decision_number => 1,
                                token => $token
                  ]
);
my $ute = new_ok( 'ANTLR::Runtime::UnwantedTokenException' => [ input => $strstream, token => $token ] );

# Static Values Ok

is( $br->MEMO_RULE_FAILED(), -2, 'Memo rule failed is -2');
is( $br->MEMO_RULE_UNKNOWN(), -1, 'Memo rule unknown is -1');
is( $br->INITIAL_FOLLOW_STACK_SIZE(), 100, 'Initial follow stack size is 100');
is( $br->DEFAULT_TOKEN_CHANNEL(), 0, 'Default token channel is 0');
is( $br->HIDDEN(), 99, 'Hidden channel is 99');
is( $br->NEXT_TOKEN_RULE_NAME(), 'next_token', "Next token rule name is 'next_token'");

# Accessors Ok

ok( $br->state->isa('ANTLR::Runtime::RecognizerSharedState'), 'State is an instance of ANTLR::Runtime::RecognizerSharedState class' );
is( $br->get_number_of_syntax_errors(), 0, 'number of syntax errors is 0 (default)' );
is( $br->get_backtracking_level(), 0, 'backtracking level is 0 (default)' );

# Mutators Ok

$br->state->_fsp(2);
$br->state->rule_memo([{0 => 1,2 => 3,4 => 5},{0 => 1,2 => 4,4 => 256}]);
$br->set_backtracking_level(1);

# Methods Ok

is( $br->state->_fsp, 2, '_fsp is now 2' );
is_deeply( $br->state->rule_memo, [{4 => 5,0 => 1,2 => 3},{4 => 256,0 => 1,2 => 4}], 'Rule memo is now a list with two hashes' );
is( $br->get_backtracking_level(), 1, 'backtracking level is now 1' );
is( $br->reset(), undef, 'Reset the state' );
is( $br->state->_fsp, -1, '_fsp after reset is -1' );
is_deeply( $br->state->rule_memo, [], 'Rule memo after reset is empty' );
is( $br->get_backtracking_level(), 0, 'backtracking level after reset is 0' );

is( $br->trace_in('lavanda',0,$token), undef, 'Trace in of rule lavanda' );
is( $br->trace_out('lavanda',0,$token), undef, 'Trace out of rule lavanda' );
is( $br->begin_resync(), undef, 'Begin to resynchronise' );
is( $br->end_resync(), undef, 'End resynchronising' );
is( $br->get_token_names(), undef, 'Get token names' );
is( $br->get_grammar_file_name(), undef, 'Get grammar file name' );
is( $br->get_current_input_symbol(), undef, 'Get current input symbol' );
is( $br->get_missing_symbol({
	input => $intstream,
	exception => $re,
	expected_token_type => 1,
	follow => $follow}), undef, 'Get missing symbol' );
ok( !$br->failed(), 'failed is false' );

is( $br->emit_error_message('ERROR: this is my error message'), undef, 'Emit error message to STDERR' );
is( $br->get_token_error_display($token), "'his is inp'", "Error token display is 'his is inp'" );
is( $br->get_error_header($re), 'line 1:0', "Error header is 'line 1:0'" );
is( $br->get_error_message($re,[]), undef, 'No error message for RecognitionException' );
ok( (print $br->get_error_message($eee,['EOF','ID','NAME']) . "\n"), 'Error message for EarlyExitException' );
ok( (print $br->get_error_message($ute,['EOF','ID','NAME']) . "\n"), 'Error message for UnwantedTokenException' );
is( $br->display_recognition_error(['EOF','ID','NAME'],$ute), undef, 'Display recognition error (UnwantedTokenException)' );
is( $br->report_error($eee), undef, 'Report error (EarlyExitException)' );
is( $br->get_number_of_syntax_errors(), 1, 'number of syntax errors is now 1' );
ok( !$br->mismatch_is_unwanted_token($intstream,2), 'Mismatch is unwanted token' );
ok( !$br->mismatch_is_missing_token($intstream,$follow), 'Mismatch is missing token' );
ok( $br->mismatch_is_missing_token($intstream,$follow2), 'Mismatch is not a missing token' );
is( $br->recover_from_mismatched_token($intstream,2,$follow2), undef, 'Recover from mismatched token' );
is( $br->recover_from_mismatched_set($intstream,$eee,$follow2), undef, 'Recover from mismatched set' );

is( $br->push_follow($follow3), undef, 'Pushed a BitSet into the following stack' );
ok( $br->compute_error_recovery_set()->isa('ANTLR::Runtime::BitSet'), 'combine_follows(0) returned a BitSet' );
ok( $br->compute_context_sensitive_rule_FOLLOW()->isa('ANTLR::Runtime::BitSet'), 'combine_follows(1) returned a BitSet' );

print "Input is: ", $intstream->input, "\n";
is( $br->match($intstream,2,$follow3), undef, 'Match and consume token of type 2' );
is( $intstream->LA(1), 0, 'LA(1) == 0' );
is( $br->match_any($intstream), undef, 'Match any, consume type 0' );
is( $intstream->LA(1), 1, 'LA(1) == 1' );
is( $br->consume_until({input => $intstream, ttype => 4}), undef, 'Consumes 1 and 3' );
is( $intstream->LA(1), 4, 'LA(1) == 4' );
is( $br->consume_until({input => $intstream, follow => $follow3}), undef, 'Does not consume anything' );
is( $intstream->LA(1), 4, 'LA(1) == 4' );
is( $br->recover($intstream,$eee), undef, 'Try to recover' );
is( $intstream->LA(3), -1, 'LA(1) == -1 (consumed all the input)' );

$br->state->rule_memo([{0 => 1,2 => 3,4 => 5},{0 => 1,2 => 4,4 => 256}]);
is( $br->get_rule_memoization(1,2), 4, 'Rule Memoization. Rule with index 1, starting at 2, stops at 4' );
is( $br->get_rule_memoization_cache_size(), 6, 'There are a total of 6 rule/input pairs' );
is( $br->memoize($intstream,1,4), undef, "memoize('201345',1,4) == 3" );
is( $br->get_rule_memoization(1,4), 3, 'Index changed from 256 to 3 after calling memoize' );
ok( $br->already_parsed_rule($intstream,0), "already_parsed_rule('201345',0)" );
is( $intstream->index(), 6, 'index (p) increased to 6 after already_parsed_rule()' );
is_deeply( $br->get_rule_invocation_stack(), [], 'Rule invocation stack is empty' );

print $br->to_strings([$token,$token2,$token3]),"\n";