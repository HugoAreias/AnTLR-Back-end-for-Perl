# $ANTLR 3.2 Aug 03, 2010 13:12:17 grammars/t017parser.g 2011-02-04 04:50:48
package t017parserLexer;

# use ANTLR::Runtime::Class;

use Moose;
use Carp;
use English qw( -no_match_vars );
use Data::Lock qw( dlock );
use Try::Tiny;
use feature qw( switch );

use ANTLR::Runtime::Token;
use ANTLR::Runtime::BaseRecognizer;
use ANTLR::Runtime::DFA;
use ANTLR::Runtime::NoViableAltException;
use ANTLR::Runtime::MismatchedSetException;
use ANTLR::Runtime::EarlyExitException;
use ANTLR::Runtime::CommonToken;

extends 'ANTLR::Runtime::Lexer';

dlock( my $HIDDEN = ANTLR::Runtime::BaseRecognizer->HIDDEN );

use constant {
	T__12 => 12,
	T__20 => 20,
	WS => 6,
	T__13 => 13,
	T__19 => 19,
	T__9 => 9,
	T__14 => 14,
	T__11 => 11,
	T__7 => 7,
	T__17 => 17,
	INT => 5,
	T__8 => 8,
	EOF => -1,
	T__16 => 16,
	T__10 => 10,
	T__18 => 18,
	T__15 => 15,
	ID => 4,
};


sub BUILD {
    my ($self, $arg_ref) = @_;

    $self->init_dfas();

	return;
}

sub get_grammar_file_name {
    return 'grammars/t017parser.g';
}

# $ANTLR start "T__7"
sub m_T__7 {
    my ($self) = @_;
    try {
        my $_type = T__7;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t017parser.g:7:6: ( ';' )
        # grammars/t017parser.g:7:8: ';'
        {
         $self->match(';'); 

        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "T__7"

# $ANTLR start "T__8"
sub m_T__8 {
    my ($self) = @_;
    try {
        my $_type = T__8;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t017parser.g:8:6: ( '(' )
        # grammars/t017parser.g:8:8: '('
        {
         $self->match('('); 

        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "T__8"

# $ANTLR start "T__9"
sub m_T__9 {
    my ($self) = @_;
    try {
        my $_type = T__9;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t017parser.g:9:6: ( ',' )
        # grammars/t017parser.g:9:8: ','
        {
         $self->match(','); 

        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "T__9"

# $ANTLR start "T__10"
sub m_T__10 {
    my ($self) = @_;
    try {
        my $_type = T__10;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t017parser.g:10:7: ( ')' )
        # grammars/t017parser.g:10:9: ')'
        {
         $self->match(')'); 

        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "T__10"

# $ANTLR start "T__11"
sub m_T__11 {
    my ($self) = @_;
    try {
        my $_type = T__11;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t017parser.g:11:7: ( 'int' )
        # grammars/t017parser.g:11:9: 'int'
        {
         $self->match("int"); 


        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "T__11"

# $ANTLR start "T__12"
sub m_T__12 {
    my ($self) = @_;
    try {
        my $_type = T__12;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t017parser.g:12:7: ( 'char' )
        # grammars/t017parser.g:12:9: 'char'
        {
         $self->match("char"); 


        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "T__12"

# $ANTLR start "T__13"
sub m_T__13 {
    my ($self) = @_;
    try {
        my $_type = T__13;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t017parser.g:13:7: ( 'void' )
        # grammars/t017parser.g:13:9: 'void'
        {
         $self->match("void"); 


        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "T__13"

# $ANTLR start "T__14"
sub m_T__14 {
    my ($self) = @_;
    try {
        my $_type = T__14;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t017parser.g:14:7: ( '{' )
        # grammars/t017parser.g:14:9: '{'
        {
         $self->match('{'); 

        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "T__14"

# $ANTLR start "T__15"
sub m_T__15 {
    my ($self) = @_;
    try {
        my $_type = T__15;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t017parser.g:15:7: ( '}' )
        # grammars/t017parser.g:15:9: '}'
        {
         $self->match('}'); 

        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "T__15"

# $ANTLR start "T__16"
sub m_T__16 {
    my ($self) = @_;
    try {
        my $_type = T__16;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t017parser.g:16:7: ( 'for' )
        # grammars/t017parser.g:16:9: 'for'
        {
         $self->match("for"); 


        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "T__16"

# $ANTLR start "T__17"
sub m_T__17 {
    my ($self) = @_;
    try {
        my $_type = T__17;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t017parser.g:17:7: ( '=' )
        # grammars/t017parser.g:17:9: '='
        {
         $self->match('='); 

        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "T__17"

# $ANTLR start "T__18"
sub m_T__18 {
    my ($self) = @_;
    try {
        my $_type = T__18;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t017parser.g:18:7: ( '==' )
        # grammars/t017parser.g:18:9: '=='
        {
         $self->match("=="); 


        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "T__18"

# $ANTLR start "T__19"
sub m_T__19 {
    my ($self) = @_;
    try {
        my $_type = T__19;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t017parser.g:19:7: ( '<' )
        # grammars/t017parser.g:19:9: '<'
        {
         $self->match('<'); 

        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "T__19"

# $ANTLR start "T__20"
sub m_T__20 {
    my ($self) = @_;
    try {
        my $_type = T__20;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t017parser.g:20:7: ( '+' )
        # grammars/t017parser.g:20:9: '+'
        {
         $self->match('+'); 

        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "T__20"

# $ANTLR start "ID"
sub m_ID {
    my ($self) = @_;
    try {
        my $_type = ID;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t017parser.g:79:5: ( ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )* )
        # grammars/t017parser.g:79:9: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
        {
         if ( ($self->input->LA(1) ge 'A' && $self->input->LA(1) le 'Z') || $self->input->LA(1) eq '_' || ($self->input->LA(1) ge 'a' && $self->input->LA(1) le 'z') ) {
             $self->input->consume();

         }
         else {
             my $mse =
         		ANTLR::Runtime::MismatchedSetException->new({
         			expecting => undef,
         			input => $self->input,
         		});
             $self->recover($mse);
             $mse->throw();}

         # grammars/t017parser.g:79:33: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
         LOOP1:
         while (1) {
             my $alt1 = 2;
             my $LA1_0 = $self->input->LA(1);

             if ( (($LA1_0 ge '0' && $LA1_0 le '9') || ($LA1_0 ge 'A' && $LA1_0 le 'Z') || $LA1_0 eq '_' || ($LA1_0 ge 'a' && $LA1_0 le 'z')) ) {
                 $alt1 = 1;
             }


             given ($alt1) {
         	    when (1) {
         	        # grammars/t017parser.g:
         	        {
         	         if ( ($self->input->LA(1) ge '0' && $self->input->LA(1) le '9') || ($self->input->LA(1) ge 'A' && $self->input->LA(1) le 'Z') || $self->input->LA(1) eq '_' || ($self->input->LA(1) ge 'a' && $self->input->LA(1) le 'z') ) {
         	             $self->input->consume();

         	         }
         	         else {
         	             my $mse =
         	         		ANTLR::Runtime::MismatchedSetException->new({
         	         			expecting => undef,
         	         			input => $self->input,
         	         		});
         	             $self->recover($mse);
         	             $mse->throw();}


         	        }
         	    }

         	    default { last LOOP1; }
             }
         }


        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "ID"

# $ANTLR start "INT"
sub m_INT {
    my ($self) = @_;
    try {
        my $_type = INT;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t017parser.g:82:5: ( ( '0' .. '9' )+ )
        # grammars/t017parser.g:82:7: ( '0' .. '9' )+
        {
         # grammars/t017parser.g:82:7: ( '0' .. '9' )+
         my $cnt2 = 0;
         LOOP2:
         while (1) {
             my $alt2 = 2;
             my $LA2_0 = $self->input->LA(1);

             if ( (($LA2_0 ge '0' && $LA2_0 le '9')) ) {
                 $alt2 = 1;
             }


             given ($alt2) {
         	    when (1) {
         	        # grammars/t017parser.g:82:8: '0' .. '9'
         	        {
         	         $self->match_range('0','9'); 

         	        }
         	    }

         	    default {
         	        last LOOP2 if ( $cnt2 >= 1 );
                     my $eee =
         				ANTLR::Runtime::EarlyExitException->new({
         					decision_number => 2,
         					input => $self->input,
         				});
                     $eee->throw();
                 }
             }
             ++$cnt2;
         }


        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "INT"

# $ANTLR start "WS"
sub m_WS {
    my ($self) = @_;
    try {
        my $_type = WS;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t017parser.g:85:5: ( ( ' ' | '\\t' | '\\r' | '\\n' )+ )
        # grammars/t017parser.g:85:9: ( ' ' | '\\t' | '\\r' | '\\n' )+
        {
         # grammars/t017parser.g:85:9: ( ' ' | '\\t' | '\\r' | '\\n' )+
         my $cnt3 = 0;
         LOOP3:
         while (1) {
             my $alt3 = 2;
             my $LA3_0 = $self->input->LA(1);

             if ( (($LA3_0 ge "\t" && $LA3_0 le "\n") || $LA3_0 eq "\r" || $LA3_0 eq ' ') ) {
                 $alt3 = 1;
             }


             given ($alt3) {
         	    when (1) {
         	        # grammars/t017parser.g:
         	        {
         	         if ( ($self->input->LA(1) ge "\t" && $self->input->LA(1) le "\n") || $self->input->LA(1) eq "\r" || $self->input->LA(1) eq ' ' ) {
         	             $self->input->consume();

         	         }
         	         else {
         	             my $mse =
         	         		ANTLR::Runtime::MismatchedSetException->new({
         	         			expecting => undef,
         	         			input => $self->input,
         	         		});
         	             $self->recover($mse);
         	             $mse->throw();}


         	        }
         	    }

         	    default {
         	        last LOOP3 if ( $cnt3 >= 1 );
                     my $eee =
         				ANTLR::Runtime::EarlyExitException->new({
         					decision_number => 3,
         					input => $self->input,
         				});
                     $eee->throw();
                 }
             }
             ++$cnt3;
         }

         $self->skip();

        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "WS"

sub m_tokens {
    my ($self) = @_;
    # grammars/t017parser.g:1:8: ( T__7 | T__8 | T__9 | T__10 | T__11 | T__12 | T__13 | T__14 | T__15 | T__16 | T__17 | T__18 | T__19 | T__20 | ID | INT | WS )
    my $alt4 = 17;
    $alt4 = $self->dfa4->predict($self->input);
    given ($alt4) {
        when (1) {
            # grammars/t017parser.g:1:10: T__7
            {
             $self->m_T__7(); 

            }
        }
        when (2) {
            # grammars/t017parser.g:1:15: T__8
            {
             $self->m_T__8(); 

            }
        }
        when (3) {
            # grammars/t017parser.g:1:20: T__9
            {
             $self->m_T__9(); 

            }
        }
        when (4) {
            # grammars/t017parser.g:1:25: T__10
            {
             $self->m_T__10(); 

            }
        }
        when (5) {
            # grammars/t017parser.g:1:31: T__11
            {
             $self->m_T__11(); 

            }
        }
        when (6) {
            # grammars/t017parser.g:1:37: T__12
            {
             $self->m_T__12(); 

            }
        }
        when (7) {
            # grammars/t017parser.g:1:43: T__13
            {
             $self->m_T__13(); 

            }
        }
        when (8) {
            # grammars/t017parser.g:1:49: T__14
            {
             $self->m_T__14(); 

            }
        }
        when (9) {
            # grammars/t017parser.g:1:55: T__15
            {
             $self->m_T__15(); 

            }
        }
        when (10) {
            # grammars/t017parser.g:1:61: T__16
            {
             $self->m_T__16(); 

            }
        }
        when (11) {
            # grammars/t017parser.g:1:67: T__17
            {
             $self->m_T__17(); 

            }
        }
        when (12) {
            # grammars/t017parser.g:1:73: T__18
            {
             $self->m_T__18(); 

            }
        }
        when (13) {
            # grammars/t017parser.g:1:79: T__19
            {
             $self->m_T__19(); 

            }
        }
        when (14) {
            # grammars/t017parser.g:1:85: T__20
            {
             $self->m_T__20(); 

            }
        }
        when (15) {
            # grammars/t017parser.g:1:91: ID
            {
             $self->m_ID(); 

            }
        }
        when (16) {
            # grammars/t017parser.g:1:94: INT
            {
             $self->m_INT(); 

            }
        }
        when (17) {
            # grammars/t017parser.g:1:98: WS
            {
             $self->m_WS(); 

            }
        }

    }

	return;
}


has 'dfa4' => ( is => 'rw' );

sub init_dfas {
    my ($self) = @_;

    $self->dfa4(t017parserLexer::DFA4->new({ recognizer => $self }));
        

    return;
}


dlock( my $DFA4_eot = ANTLR::Runtime::DFA->unpack_encoded_string('\u{5}\u{65535}'.
    '\u{3}\u{14}\u{2}\u{65535}\u{1}\u{14}\u{1}\u{22}\u{5}\u{65535}\u{4}\u{14}'.
    '\u{2}\u{65535}\u{1}\u{27}\u{2}\u{14}\u{1}\u{30}\u{1}\u{65535}\u{1}\u{31}'.
    '\u{1}\u{32}\u{3}\u{65535}') );
dlock( my $DFA4_eof = ANTLR::Runtime::DFA->unpack_encoded_string('\u{33}'.
    '\u{65535}') );
dlock( my $DFA4_min = ANTLR::Runtime::DFA->unpack_encoded_string_to_unsigned_chars(''.
    '\u{1}\u{9}\u{4}\u{65535}\u{1}\u{110}\u{1}\u{104}\u{1}\u{111}\u{2}\u{65535}'.
    '\u{1}\u{111}\u{1}\u{61}\u{5}\u{65535}\u{1}\u{116}\u{1}\u{97}\u{1}\u{105}'.
    '\u{1}\u{114}\u{2}\u{65535}\u{1}\u{48}\u{1}\u{114}\u{1}\u{100}\u{1}\u{48}'.
    '\u{1}\u{65535}\u{2}\u{48}\u{3}\u{65535}') );
dlock( my $DFA4_max = ANTLR::Runtime::DFA->unpack_encoded_string_to_unsigned_chars(''.
    '\u{1}\u{125}\u{4}\u{65535}\u{1}\u{110}\u{1}\u{104}\u{1}\u{111}\u{2}'.
    '\u{65535}\u{1}\u{111}\u{1}\u{61}\u{5}\u{65535}\u{1}\u{116}\u{1}\u{97}'.
    '\u{1}\u{105}\u{1}\u{114}\u{2}\u{65535}\u{1}\u{122}\u{1}\u{114}\u{1}'.
    '\u{100}\u{1}\u{122}\u{1}\u{65535}\u{2}\u{122}\u{3}\u{65535}') );
dlock( my $DFA4_accept = ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}'.
    '\u{65535}\u{1}\u{1}\u{1}\u{2}\u{1}\u{3}\u{1}\u{4}\u{3}\u{65535}\u{1}'.
    '\u{8}\u{1}\u{9}\u{2}\u{65535}\u{1}\u{13}\u{1}\u{14}\u{1}\u{15}\u{1}'.
    '\u{16}\u{1}\u{17}\u{4}\u{65535}\u{1}\u{12}\u{1}\u{11}\u{4}\u{65535}'.
    '\u{1}\u{5}\u{2}\u{65535}\u{1}\u{10}\u{1}\u{6}\u{1}\u{7}') );
dlock( my $DFA4_special = ANTLR::Runtime::DFA->unpack_encoded_string('\u{33}'.
    '\u{65535}') );
dlock( my $DFA4_transition = [
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{2}\u{16}\u{2}\u{65535}\u{1}'.
	'\u{16}\u{18}\u{65535}\u{1}\u{16}\u{7}\u{65535}\u{1}\u{2}\u{1}\u{4}\u{1}'.
	'\u{65535}\u{1}\u{13}\u{1}\u{3}\u{3}\u{65535}\u{10}\u{15}\u{1}\u{65535}'.
	'\u{1}\u{1}\u{1}\u{12}\u{1}\u{11}\u{3}\u{65535}\u{26}\u{14}\u{4}\u{65535}'.
	'\u{1}\u{14}\u{1}\u{65535}\u{2}\u{14}\u{1}\u{6}\u{2}\u{14}\u{1}\u{10}\u{2}'.
	'\u{14}\u{1}\u{5}\u{12}\u{14}\u{1}\u{7}\u{4}\u{14}\u{1}\u{8}\u{1}\u{65535}'.
	'\u{1}\u{9}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{17}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{18}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{19}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{20}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{21}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{23}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{24}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{25}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{26}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{10}\u{14}\u{7}\u{65535}'.
	'\u{26}\u{14}\u{4}\u{65535}\u{1}\u{14}\u{1}\u{65535}\u{26}\u{14}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{28}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{29}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{10}\u{14}\u{7}\u{65535}'.
	'\u{26}\u{14}\u{4}\u{65535}\u{1}\u{14}\u{1}\u{65535}\u{26}\u{14}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{10}\u{14}\u{7}\u{65535}'.
	'\u{26}\u{14}\u{4}\u{65535}\u{1}\u{14}\u{1}\u{65535}\u{26}\u{14}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{10}\u{14}\u{7}\u{65535}'.
	'\u{26}\u{14}\u{4}\u{65535}\u{1}\u{14}\u{1}\u{65535}\u{26}\u{14}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('')
] );

{
package t017parserLexer::DFA4;
# use ANTLR::Runtime::Class;

use Moose;

extends 'ANTLR::Runtime::DFA';

sub BUILD {
    my ($self,$param_ref) = @_;

    $self->recognizer($param_ref->{recognizer});
    $self->decision_number(4);
    $self->eot($DFA4_eot);
    $self->eof($DFA4_eof);
    $self->min($DFA4_min);
    $self->max($DFA4_max);
    $self->accept($DFA4_accept);
    $self->special($DFA4_special);
    $self->transition($DFA4_transition);

	return;
}

sub get_description {
    return "1:1: Tokens : ( T__7 | T__8 | T__9 | T__10 | T__11 | T__12 | T__13 | T__14 | T__15 | T__16 | T__17 | T__18 | T__19 | T__20 | ID | INT | WS );";
}


}
 

no Moose;
__PACKAGE__->meta->make_immutable();
1;
