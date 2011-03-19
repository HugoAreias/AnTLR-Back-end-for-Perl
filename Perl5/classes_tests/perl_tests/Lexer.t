#!/usr/bin/perl

use strict;
use warnings;

use Try::Tiny;
use Exception::Class;
use English qw( -no_match_vars );

use Test::More tests => 43;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::Lexer' );
	use_ok( 'ANTLR::Runtime::ANTLRStringStream' );
	use_ok( 'ANTLR::Runtime::EarlyExitException' );
}

# New Ok

my $strstream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is input text' ] );
my $lexer = new_ok( 'ANTLR::Runtime::Lexer' => [ input => $strstream ] );

# Accessors Ok

ok( $lexer->input->isa('ANTLR::Runtime::ANTLRStringStream'), 'Input is a char stream' );
is( $lexer->get_line(), 1, 'line is 1' );
is( $lexer->get_char_position_in_line(), 0, 'char position in line is 0' );
is( $lexer->get_char_index(), 0, 'p is 0' );
is( $lexer->get_text(), 't', "Text is 't' (the last char of input, since substring(-1,-1))" );

# Mutators Ok

$lexer->state->_fsp(2);
$lexer->state->rule_memo([{0 => 1,2 => 3,4 => 5},{0 => 1,2 => 4,4 => 256}]);

# Methods Ok

is( $lexer->state->_fsp, 2, '_fsp is 2' );
is_deeply( $lexer->state->rule_memo, [{4 => 5,0 => 1,2 => 3},{4 => 256,0 => 1,2 => 4}], 'Rule memo is a list with two hashes' );
is( $lexer->reset(), undef, 'Reset the state' );
is( $lexer->state->_fsp, -1, '_fsp after reset is -1' );
is_deeply( $lexer->state->rule_memo, [], 'Rule memo after reset is empty' );

ok( $lexer->next_token(), 'Returned the next token' );

is( $lexer->skip(), undef, 'Tell the lexer to skip a token' );
is( $lexer->state->token->type, 0, 'The type of the token is 0' );

is( $lexer->m_tokens(), undef, 'm\_tokens unimplemented');

$lexer->state->_fsp(4);
is( $lexer->state->_fsp, 4, '_fsp is 4' );
my $newstream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is a new input' ] );
is( $lexer->set_char_stream($newstream), undef, 'Setting a new input' );
is( $lexer->state->_fsp, -1, '_fsp is -1 after defining a new input' );
is_deeply( $lexer->get_char_stream()->input, ['t','h','i','s',' ','i','s',' ','a',' ','n','e','w',' ','i','n','p','u','t'], "Input is now 'this is a new input'" );
is( $lexer->get_source_name(), '', "The source name is empty (default)" );

is( $lexer->state->token(undef), undef, 'Token deleted' );
ok( $lexer->emit()->isa('ANTLR::Runtime::CommonToken'), 'New token returned is a CommonToken' );
is_deeply( $lexer->state->token->input->input, ['t','h','i','s',' ','i','s',' ','a',' ','n','e','w',' ','i','n','p','u','t'], "New token input is 'this is a new input'" );

is( $lexer->set_text('my new text'), undef, "Set text to 'my new text'");
is( $lexer->get_text(), 'my new text', "Text is 'my new text'" );

my $eee = new_ok( 'ANTLR::Runtime::EarlyExitException' => [ decision_number => 2, input => $strstream ] );
is( $lexer->report_error($eee), undef, 'report_error(error)' );
is( $lexer->get_error_message($eee,['TEXT','DATA','ID']), "required (...)+ loop did not match anything at character '<EOF>'", 'get_error_message(error,token_names)' );
is( $lexer->get_char_error_display(0), "'<EOF>'", "get_char_error_display(0) == '<EOF>'" );

is( $lexer->match_any(), undef, "Match any (consumes 't')" );
is( $lexer->input->LA(1), 'h', "LA(1) == 'h'" );
is( $lexer->recover(), undef, "Recovering (consumes 'h')" );
is( $lexer->input->LA(1), 'i', "LA(1) == 'i'" );
is( $lexer->trace_in('lavanda',0), undef, 'Trace in' );
is( $lexer->trace_out('lavanda',0), undef, 'Trace out' );

try {
	is( $lexer->match_range(1,3), undef, 'Match range 1 to 3');
}
catch {
	$EVAL_ERROR = $_;
    my $error = Exception::Class->caught('ANTLR::Runtime::MismatchedRangeException');
    is( "$error", 'MismatchedNotSetException(i not in [1,3])', 'to_String() == MismatchedNotSetException(i not in [1,3])' );
};
is( $lexer->input->LA(1), 's', "LA(1) == 's'" );
try {
	is( $lexer->match('this input'), undef, "Matching '<EOF>' with 'this input'" );
}
catch {
	$EVAL_ERROR = $_;
    my $error = Exception::Class->caught('ANTLR::Runtime::MismatchedTokenException');
    is( "$error", 'MismatchedTokenException(s!=116)', 'to_String() == MismatchedTokenException(s!=116)' );
};