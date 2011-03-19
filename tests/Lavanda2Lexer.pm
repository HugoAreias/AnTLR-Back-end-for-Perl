# $ANTLR 3.2 Aug 03, 2010 13:12:17 grammars/Lavanda2.g 2011-02-02 00:05:47
package Lavanda2Lexer;

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
	LETTER => 7,
	T__12 => 12,
	T__20 => 20,
	WS => 9,
	T__13 => 13,
	T__19 => 19,
	DATA => 4,
	T__14 => 14,
	T__11 => 11,
	T__17 => 17,
	EOF => -1,
	T__16 => 16,
	NUM => 6,
	T__10 => 10,
	DIGIT => 8,
	T__18 => 18,
	T__15 => 15,
	ID => 5,
};


sub BUILD {
    my ($self, $arg_ref) = @_;

    $self->init_dfas();

	return;
}

sub get_grammar_file_name {
    return 'grammars/Lavanda2.g';
}

# $ANTLR start "T__10"
sub m_T__10 {
    my ($self) = @_;
    try {
        my $_type = T__10;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/Lavanda2.g:7:7: ( '(' )
        # grammars/Lavanda2.g:7:9: '('
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
# $ANTLR end "T__10"

# $ANTLR start "T__11"
sub m_T__11 {
    my ($self) = @_;
    try {
        my $_type = T__11;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/Lavanda2.g:8:7: ( ')' )
        # grammars/Lavanda2.g:8:9: ')'
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
# $ANTLR end "T__11"

# $ANTLR start "T__12"
sub m_T__12 {
    my ($self) = @_;
    try {
        my $_type = T__12;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/Lavanda2.g:9:7: ( ',' )
        # grammars/Lavanda2.g:9:9: ','
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
# $ANTLR end "T__12"

# $ANTLR start "T__13"
sub m_T__13 {
    my ($self) = @_;
    try {
        my $_type = T__13;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/Lavanda2.g:10:7: ( '-' )
        # grammars/Lavanda2.g:10:9: '-'
        {
         $self->match('-'); 

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
        # grammars/Lavanda2.g:11:7: ( 'corpo' )
        # grammars/Lavanda2.g:11:9: 'corpo'
        {
         $self->match("corpo"); 


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
        # grammars/Lavanda2.g:12:7: ( 'casa' )
        # grammars/Lavanda2.g:12:9: 'casa'
        {
         $self->match("casa"); 


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
        # grammars/Lavanda2.g:13:7: ( 'br' )
        # grammars/Lavanda2.g:13:9: 'br'
        {
         $self->match("br"); 


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
        # grammars/Lavanda2.g:14:7: ( 'cor' )
        # grammars/Lavanda2.g:14:9: 'cor'
        {
         $self->match("cor"); 


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
        # grammars/Lavanda2.g:15:7: ( 'alg' )
        # grammars/Lavanda2.g:15:9: 'alg'
        {
         $self->match("alg"); 


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
        # grammars/Lavanda2.g:16:7: ( 'la' )
        # grammars/Lavanda2.g:16:9: 'la'
        {
         $self->match("la"); 


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
        # grammars/Lavanda2.g:17:7: ( 'fib' )
        # grammars/Lavanda2.g:17:9: 'fib'
        {
         $self->match("fib"); 


        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "T__20"

# $ANTLR start "LETTER"
sub m_LETTER {
    my ($self) = @_;
    try {
        # grammars/Lavanda2.g:79:9: ( 'a' .. 'z' | 'A' .. 'Z' )
        # grammars/Lavanda2.g:
        {
         if ( ($self->input->LA(1) ge 'A' && $self->input->LA(1) le 'Z') || ($self->input->LA(1) ge 'a' && $self->input->LA(1) le 'z') ) {
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
	finally {
	};
	return;
}
# $ANTLR end "LETTER"

# $ANTLR start "DIGIT"
sub m_DIGIT {
    my ($self) = @_;
    try {
        # grammars/Lavanda2.g:81:9: ( '0' .. '9' )
        # grammars/Lavanda2.g:81:11: '0' .. '9'
        {
         $self->match_range('0','9'); 

        }

    }
	finally {
	};
	return;
}
# $ANTLR end "DIGIT"

# $ANTLR start "ID"
sub m_ID {
    my ($self) = @_;
    try {
        my $_type = ID;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/Lavanda2.g:83:7: ( ( LETTER )+ )
        # grammars/Lavanda2.g:83:9: ( LETTER )+
        {
         # grammars/Lavanda2.g:83:9: ( LETTER )+
         my $cnt1 = 0;
         LOOP1:
         while (1) {
             my $alt1 = 2;
             my $LA1_0 = $self->input->LA(1);

             if ( (($LA1_0 ge 'A' && $LA1_0 le 'Z') || ($LA1_0 ge 'a' && $LA1_0 le 'z')) ) {
                 $alt1 = 1;
             }


             given ($alt1) {
         	    when (1) {
         	        # grammars/Lavanda2.g:83:9: LETTER
         	        {
         	         $self->m_LETTER(); 

         	        }
         	    }

         	    default {
         	        last LOOP1 if ( $cnt1 >= 1 );
                     my $eee =
         				ANTLR::Runtime::EarlyExitException->new({
         					decision_number => 1,
         					input => $self->input,
         				});
                     $eee->throw();
                 }
             }
             ++$cnt1;
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

# $ANTLR start "NUM"
sub m_NUM {
    my ($self) = @_;
    try {
        my $_type = NUM;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/Lavanda2.g:84:7: ( ( DIGIT )+ )
        # grammars/Lavanda2.g:84:9: ( DIGIT )+
        {
         # grammars/Lavanda2.g:84:9: ( DIGIT )+
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
         	        # grammars/Lavanda2.g:84:9: DIGIT
         	        {
         	         $self->m_DIGIT(); 

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
# $ANTLR end "NUM"

# $ANTLR start "DATA"
sub m_DATA {
    my ($self) = @_;
    try {
        my $_type = DATA;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/Lavanda2.g:85:7: ( DIGIT DIGIT '-' DIGIT DIGIT '-' DIGIT DIGIT DIGIT DIGIT )
        # grammars/Lavanda2.g:85:9: DIGIT DIGIT '-' DIGIT DIGIT '-' DIGIT DIGIT DIGIT DIGIT
        {
         $self->m_DIGIT(); 
         $self->m_DIGIT(); 
         $self->match('-'); 
         $self->m_DIGIT(); 
         $self->m_DIGIT(); 
         $self->match('-'); 
         $self->m_DIGIT(); 
         $self->m_DIGIT(); 
         $self->m_DIGIT(); 
         $self->m_DIGIT(); 

        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "DATA"

# $ANTLR start "WS"
sub m_WS {
    my ($self) = @_;
    try {
        my $_type = WS;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/Lavanda2.g:86:7: ( ( '\\r' | '\\n' | ' ' | '\\t' )+ )
        # grammars/Lavanda2.g:86:9: ( '\\r' | '\\n' | ' ' | '\\t' )+
        {
         # grammars/Lavanda2.g:86:9: ( '\\r' | '\\n' | ' ' | '\\t' )+
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
         	        # grammars/Lavanda2.g:
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
    # grammars/Lavanda2.g:1:8: ( T__10 | T__11 | T__12 | T__13 | T__14 | T__15 | T__16 | T__17 | T__18 | T__19 | T__20 | ID | NUM | DATA | WS )
    my $alt4 = 15;
    $alt4 = $self->dfa4->predict($self->input);
    given ($alt4) {
        when (1) {
            # grammars/Lavanda2.g:1:10: T__10
            {
             $self->m_T__10(); 

            }
        }
        when (2) {
            # grammars/Lavanda2.g:1:16: T__11
            {
             $self->m_T__11(); 

            }
        }
        when (3) {
            # grammars/Lavanda2.g:1:22: T__12
            {
             $self->m_T__12(); 

            }
        }
        when (4) {
            # grammars/Lavanda2.g:1:28: T__13
            {
             $self->m_T__13(); 

            }
        }
        when (5) {
            # grammars/Lavanda2.g:1:34: T__14
            {
             $self->m_T__14(); 

            }
        }
        when (6) {
            # grammars/Lavanda2.g:1:40: T__15
            {
             $self->m_T__15(); 

            }
        }
        when (7) {
            # grammars/Lavanda2.g:1:46: T__16
            {
             $self->m_T__16(); 

            }
        }
        when (8) {
            # grammars/Lavanda2.g:1:52: T__17
            {
             $self->m_T__17(); 

            }
        }
        when (9) {
            # grammars/Lavanda2.g:1:58: T__18
            {
             $self->m_T__18(); 

            }
        }
        when (10) {
            # grammars/Lavanda2.g:1:64: T__19
            {
             $self->m_T__19(); 

            }
        }
        when (11) {
            # grammars/Lavanda2.g:1:70: T__20
            {
             $self->m_T__20(); 

            }
        }
        when (12) {
            # grammars/Lavanda2.g:1:76: ID
            {
             $self->m_ID(); 

            }
        }
        when (13) {
            # grammars/Lavanda2.g:1:79: NUM
            {
             $self->m_NUM(); 

            }
        }
        when (14) {
            # grammars/Lavanda2.g:1:83: DATA
            {
             $self->m_DATA(); 

            }
        }
        when (15) {
            # grammars/Lavanda2.g:1:88: WS
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

    $self->dfa4(Lavanda2Lexer::DFA4->new({ recognizer => $self }));
        

    return;
}


dlock( my $DFA4_eot = ANTLR::Runtime::DFA->unpack_encoded_string('\u{5}\u{65535}'.
    '\u{5}\u{10}\u{1}\u{65535}\u{1}\u{19}\u{1}\u{65535}\u{2}\u{10}\u{1}\u{23}'.
    '\u{1}\u{10}\u{1}\u{25}\u{1}\u{10}\u{1}\u{65535}\u{1}\u{19}\u{1}\u{29}'.
    '\u{1}\u{10}\u{1}\u{65535}\u{1}\u{31}\u{1}\u{65535}\u{1}\u{32}\u{1}\u{65535}'.
    '\u{1}\u{10}\u{1}\u{65535}\u{1}\u{34}\u{2}\u{65535}\u{1}\u{35}\u{2}\u{65535}') );
dlock( my $DFA4_eof = ANTLR::Runtime::DFA->unpack_encoded_string('\u{36}'.
    '\u{65535}') );
dlock( my $DFA4_min = ANTLR::Runtime::DFA->unpack_encoded_string_to_unsigned_chars(''.
    '\u{1}\u{9}\u{4}\u{65535}\u{1}\u{97}\u{1}\u{114}\u{1}\u{108}\u{1}\u{97}'.
    '\u{1}\u{105}\u{1}\u{65535}\u{1}\u{48}\u{1}\u{65535}\u{1}\u{114}\u{1}'.
    '\u{115}\u{1}\u{65}\u{1}\u{103}\u{1}\u{65}\u{1}\u{98}\u{1}\u{65535}\u{1}'.
    '\u{45}\u{1}\u{65}\u{1}\u{97}\u{1}\u{65535}\u{1}\u{65}\u{1}\u{65535}'.
    '\u{1}\u{65}\u{1}\u{65535}\u{1}\u{111}\u{1}\u{65535}\u{1}\u{65}\u{2}'.
    '\u{65535}\u{1}\u{65}\u{2}\u{65535}') );
dlock( my $DFA4_max = ANTLR::Runtime::DFA->unpack_encoded_string_to_unsigned_chars(''.
    '\u{1}\u{122}\u{4}\u{65535}\u{1}\u{111}\u{1}\u{114}\u{1}\u{108}\u{1}'.
    '\u{97}\u{1}\u{105}\u{1}\u{65535}\u{1}\u{57}\u{1}\u{65535}\u{1}\u{114}'.
    '\u{1}\u{115}\u{1}\u{122}\u{1}\u{103}\u{1}\u{122}\u{1}\u{98}\u{1}\u{65535}'.
    '\u{1}\u{45}\u{1}\u{122}\u{1}\u{97}\u{1}\u{65535}\u{1}\u{122}\u{1}\u{65535}'.
    '\u{1}\u{122}\u{1}\u{65535}\u{1}\u{111}\u{1}\u{65535}\u{1}\u{122}\u{2}'.
    '\u{65535}\u{1}\u{122}\u{2}\u{65535}') );
dlock( my $DFA4_accept = ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}'.
    '\u{65535}\u{1}\u{1}\u{1}\u{2}\u{1}\u{3}\u{1}\u{4}\u{5}\u{65535}\u{1}'.
    '\u{12}\u{1}\u{65535}\u{1}\u{15}\u{6}\u{65535}\u{1}\u{13}\u{3}\u{65535}'.
    '\u{1}\u{7}\u{1}\u{65535}\u{1}\u{10}\u{1}\u{65535}\u{1}\u{14}\u{1}\u{65535}'.
    '\u{1}\u{8}\u{1}\u{65535}\u{1}\u{9}\u{1}\u{11}\u{1}\u{65535}\u{1}\u{6}'.
    '\u{1}\u{5}') );
dlock( my $DFA4_special = ANTLR::Runtime::DFA->unpack_encoded_string('\u{36}'.
    '\u{65535}') );
dlock( my $DFA4_transition = [
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

{
package Lavanda2Lexer::DFA4;
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
    return "1:1: Tokens : ( T__10 | T__11 | T__12 | T__13 | T__14 | T__15 | T__16 | T__17 | T__18 | T__19 | T__20 | ID | NUM | DATA | WS );";
}


}
 

no Moose;
__PACKAGE__->meta->make_immutable();
1;
