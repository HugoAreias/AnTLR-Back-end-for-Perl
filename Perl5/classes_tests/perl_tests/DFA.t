#!/usr/bin/perl

use strict;
use warnings;

use Data::Lock qw( dlock );
use Exception::Class;
use English qw( -no_match_vars );
use Try::Tiny;

use Test::More tests => 18;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::DFA' );
	use_ok( 'ANTLR::Runtime::BaseRecognizer' );
	use_ok( 'ANTLR::Runtime::ANTLRStringStream' );
	use_ok( 'ANTLR::Runtime::Lexer' );
	use_ok( 'ANTLR::Runtime::NoViableAltException' );
}

dlock( my $eot = ANTLR::Runtime::DFA->unpack_encoded_string('\u{5}\u{65535}'.
    '\u{5}\u{10}\u{1}\u{65535}\u{1}\u{19}\u{1}\u{65535}\u{2}\u{10}\u{1}\u{23}'.
    '\u{1}\u{10}\u{1}\u{25}\u{1}\u{10}\u{1}\u{65535}\u{1}\u{19}\u{1}\u{29}'.
    '\u{1}\u{10}\u{1}\u{65535}\u{1}\u{31}\u{1}\u{65535}\u{1}\u{32}\u{1}\u{65535}'.
    '\u{1}\u{10}\u{1}\u{65535}\u{1}\u{34}\u{2}\u{65535}\u{1}\u{35}\u{2}\u{65535}') );
dlock( my $eof = ANTLR::Runtime::DFA->unpack_encoded_string('\u{36}'.
    '\u{65535}') );
dlock( my $min = ANTLR::Runtime::DFA->unpack_encoded_string_to_unsigned_chars(''.
    '\u{1}\u{9}\u{4}\u{65535}\u{1}\u{97}\u{1}\u{114}\u{1}\u{108}\u{1}\u{97}'.
    '\u{1}\u{105}\u{1}\u{65535}\u{1}\u{48}\u{1}\u{65535}\u{1}\u{114}\u{1}'.
    '\u{115}\u{1}\u{65}\u{1}\u{103}\u{1}\u{65}\u{1}\u{98}\u{1}\u{65535}\u{1}'.
    '\u{45}\u{1}\u{65}\u{1}\u{97}\u{1}\u{65535}\u{1}\u{65}\u{1}\u{65535}'.
    '\u{1}\u{65}\u{1}\u{65535}\u{1}\u{111}\u{1}\u{65535}\u{1}\u{65}\u{2}'.
    '\u{65535}\u{1}\u{65}\u{2}\u{65535}') );
dlock( my $max = ANTLR::Runtime::DFA->unpack_encoded_string_to_unsigned_chars(''.
    '\u{1}\u{122}\u{4}\u{65535}\u{1}\u{111}\u{1}\u{114}\u{1}\u{108}\u{1}'.
    '\u{97}\u{1}\u{105}\u{1}\u{65535}\u{1}\u{57}\u{1}\u{65535}\u{1}\u{114}'.
    '\u{1}\u{115}\u{1}\u{122}\u{1}\u{103}\u{1}\u{122}\u{1}\u{98}\u{1}\u{65535}'.
    '\u{1}\u{45}\u{1}\u{122}\u{1}\u{97}\u{1}\u{65535}\u{1}\u{122}\u{1}\u{65535}'.
    '\u{1}\u{122}\u{1}\u{65535}\u{1}\u{111}\u{1}\u{65535}\u{1}\u{122}\u{2}'.
    '\u{65535}\u{1}\u{122}\u{2}\u{65535}') );
dlock( my $accept = ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}'.
    '\u{65535}\u{1}\u{1}\u{1}\u{2}\u{1}\u{3}\u{1}\u{4}\u{5}\u{65535}\u{1}'.
    '\u{12}\u{1}\u{65535}\u{1}\u{15}\u{6}\u{65535}\u{1}\u{13}\u{3}\u{65535}'.
    '\u{1}\u{7}\u{1}\u{65535}\u{1}\u{10}\u{1}\u{65535}\u{1}\u{14}\u{1}\u{65535}'.
    '\u{1}\u{8}\u{1}\u{65535}\u{1}\u{9}\u{1}\u{11}\u{1}\u{65535}\u{1}\u{6}'.
    '\u{1}\u{5}') );
dlock( my $special = ANTLR::Runtime::DFA->unpack_encoded_string('\u{36}'.
    '\u{65535}') );
dlock( my $transition = [
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{2}\u{12}\u{2}\u{65535}\u{1}'.
	'\u{12}\u{18}\u{65535}\u{1}\u{12}\u{7}\u{65535}\u{1}\u{1}\u{1}\u{2}\u{2}'.
	'\u{65535}\u{1}\u{3}\u{1}\u{4}\u{2}\u{65535}\u{10}\u{11}\u{7}\u{65535}\u{26}'.
	'\u{10}\u{6}\u{65535}\u{1}\u{7}\u{1}\u{6}\u{1}\u{5}\u{2}\u{10}\u{1}\u{9}'.
	'\u{5}\u{10}\u{1}\u{8}\u{14}\u{10}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{14}\u{13}\u{65535}'.
	'\u{1}\u{13}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{15}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{16}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{17}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{18}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{10}\u{20}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{21}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{22}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{26}\u{10}\u{6}\u{65535}'.
	'\u{26}\u{10}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{24}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{26}\u{10}\u{6}\u{65535}'.
	'\u{26}\u{10}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{26}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{27}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{26}\u{10}\u{6}\u{65535}'.
	'\u{15}\u{10}\u{1}\u{28}\u{10}\u{10}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{30}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{26}\u{10}\u{6}\u{65535}'.
	'\u{26}\u{10}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{26}\u{10}\u{6}\u{65535}'.
	'\u{26}\u{10}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{33}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{26}\u{10}\u{6}\u{65535}'.
	'\u{26}\u{10}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{26}\u{10}\u{6}\u{65535}'.
	'\u{26}\u{10}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('')
] );

# New Ok

my $input = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is input text' ] );
my $intstream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => '201345' ] );
my $lexer = new_ok( 'ANTLR::Runtime::Lexer' => [ input => $input ] );
my $dfa = new_ok( 'ANTLR::Runtime::DFA' => [
                           input => $input,
                           eot => $eot,
                           eof => $eof,
                           min => $min,
                           max => $max,
                           accept => $accept,
                           special => $special,
                           transition => $transition,
                           recognizer => $lexer,
                           decision_number => 4
] );
my $nvae = new_ok( 'ANTLR::Runtime::NoViableAltException' => [
                                input => $intstream,
                                decision_number => 1,
                                state_number => 0,
                                grammar_decision_description => ''
               ]
);

# Methods Ok

is( $dfa->get_description(), 'n/a', 'get_description is implemented by the Lexer' );
is( $dfa->error($nvae), undef, 'error() is for debugging' );
is( $dfa->special_state_transition(1,$intstream), -1, 'special_state_transition() returns -1' );
is( $dfa->unistr_to_signedXint('65535',16), -1, "unistr_to_signedXint('65535',16) returns -1" );
is_deeply( $dfa->unpack_encoded_string('\u{2}\u{33}'), [33,33], "unpack_encoded_string('\u{2}\u{33}) returns [33,33]" );
is_deeply( $dfa->unpack_encoded_string_to_unsigned_chars('\u{2}\u{33}'), ['33','33'], "unpack_encoded_string_to_unsigned_chars('\u{2}\u{33}) returns ['33','33']" );
is( $dfa->predict($intstream), 13, 'predict() returns 13' );

# Throw Ok

try {
	$dfa->no_viable_alt(1,$intstream);
}

# Catch Ok

catch {
	$EVAL_ERROR = $_;
    my $error = Exception::Class->caught('ANTLR::Runtime::NoViableAltException');
    is( "$error", "NoViableAltException('2'@[n/a])", "NoViableAltException('2'@[n/a])" );
}