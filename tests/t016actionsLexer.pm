# $ANTLR 3.2 Aug 03, 2010 13:12:17 grammars/t016actions.g 2011-02-04 03:49:36
package t016actionsLexer;

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
	T__7 => 7,
	T__8 => 8,
	EOF => -1,
	WS => 5,
	T__9 => 9,
	T__6 => 6,
	ID => 4,
};


sub BUILD {
    my ($self, $arg_ref) = @_;

    $self->init_dfas();

	return;
}

sub get_grammar_file_name {
    return 'grammars/t016actions.g';
}

# $ANTLR start "T__6"
sub m_T__6 {
    my ($self) = @_;
    try {
        my $_type = T__6;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t016actions.g:7:6: ( ';' )
        # grammars/t016actions.g:7:8: ';'
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
# $ANTLR end "T__6"

# $ANTLR start "T__7"
sub m_T__7 {
    my ($self) = @_;
    try {
        my $_type = T__7;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t016actions.g:8:6: ( 'int' )
        # grammars/t016actions.g:8:8: 'int'
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
# $ANTLR end "T__7"

# $ANTLR start "T__8"
sub m_T__8 {
    my ($self) = @_;
    try {
        my $_type = T__8;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t016actions.g:9:6: ( 'char' )
        # grammars/t016actions.g:9:8: 'char'
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
# $ANTLR end "T__8"

# $ANTLR start "T__9"
sub m_T__9 {
    my ($self) = @_;
    try {
        my $_type = T__9;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t016actions.g:10:6: ( 'void' )
        # grammars/t016actions.g:10:8: 'void'
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
# $ANTLR end "T__9"

# $ANTLR start "ID"
sub m_ID {
    my ($self) = @_;
    try {
        my $_type = ID;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t016actions.g:21:5: ( ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )* )
        # grammars/t016actions.g:21:9: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
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

         # grammars/t016actions.g:21:33: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
         LOOP1:
         while (1) {
             my $alt1 = 2;
             my $LA1_0 = $self->input->LA(1);

             if ( (($LA1_0 ge '0' && $LA1_0 le '9') || ($LA1_0 ge 'A' && $LA1_0 le 'Z') || $LA1_0 eq '_' || ($LA1_0 ge 'a' && $LA1_0 le 'z')) ) {
                 $alt1 = 1;
             }


             given ($alt1) {
         	    when (1) {
         	        # grammars/t016actions.g:
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

# $ANTLR start "WS"
sub m_WS {
    my ($self) = @_;
    try {
        my $_type = WS;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t016actions.g:24:5: ( ( ' ' | '\\t' | '\\r' | '\\n' )+ )
        # grammars/t016actions.g:24:9: ( ' ' | '\\t' | '\\r' | '\\n' )+
        {
         # grammars/t016actions.g:24:9: ( ' ' | '\\t' | '\\r' | '\\n' )+
         my $cnt2 = 0;
         LOOP2:
         while (1) {
             my $alt2 = 2;
             my $LA2_0 = $self->input->LA(1);

             if ( (($LA2_0 ge "\t" && $LA2_0 le "\n") || $LA2_0 eq "\r" || $LA2_0 eq ' ') ) {
                 $alt2 = 1;
             }


             given ($alt2) {
         	    when (1) {
         	        # grammars/t016actions.g:
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
    # grammars/t016actions.g:1:8: ( T__6 | T__7 | T__8 | T__9 | ID | WS )
    my $alt3 = 6;
    $alt3 = $self->dfa3->predict($self->input);
    given ($alt3) {
        when (1) {
            # grammars/t016actions.g:1:10: T__6
            {
             $self->m_T__6(); 

            }
        }
        when (2) {
            # grammars/t016actions.g:1:15: T__7
            {
             $self->m_T__7(); 

            }
        }
        when (3) {
            # grammars/t016actions.g:1:20: T__8
            {
             $self->m_T__8(); 

            }
        }
        when (4) {
            # grammars/t016actions.g:1:25: T__9
            {
             $self->m_T__9(); 

            }
        }
        when (5) {
            # grammars/t016actions.g:1:30: ID
            {
             $self->m_ID(); 

            }
        }
        when (6) {
            # grammars/t016actions.g:1:33: WS
            {
             $self->m_WS(); 

            }
        }

    }

	return;
}


has 'dfa3' => ( is => 'rw' );

sub init_dfas {
    my ($self) = @_;

    $self->dfa3(t016actionsLexer::DFA3->new({ recognizer => $self }));
        

    return;
}


dlock( my $DFA3_eot = ANTLR::Runtime::DFA->unpack_encoded_string('\u{2}\u{65535}'.
    '\u{3}\u{5}\u{2}\u{65535}\u{3}\u{5}\u{1}\u{13}\u{2}\u{5}\u{1}\u{65535}'.
    '\u{1}\u{16}\u{1}\u{17}\u{2}\u{65535}') );
dlock( my $DFA3_eof = ANTLR::Runtime::DFA->unpack_encoded_string('\u{18}'.
    '\u{65535}') );
dlock( my $DFA3_min = ANTLR::Runtime::DFA->unpack_encoded_string_to_unsigned_chars(''.
    '\u{1}\u{9}\u{1}\u{65535}\u{1}\u{110}\u{1}\u{104}\u{1}\u{111}\u{2}\u{65535}'.
    '\u{1}\u{116}\u{1}\u{97}\u{1}\u{105}\u{1}\u{48}\u{1}\u{114}\u{1}\u{100}'.
    '\u{1}\u{65535}\u{2}\u{48}\u{2}\u{65535}') );
dlock( my $DFA3_max = ANTLR::Runtime::DFA->unpack_encoded_string_to_unsigned_chars(''.
    '\u{1}\u{122}\u{1}\u{65535}\u{1}\u{110}\u{1}\u{104}\u{1}\u{111}\u{2}'.
    '\u{65535}\u{1}\u{116}\u{1}\u{97}\u{1}\u{105}\u{1}\u{122}\u{1}\u{114}'.
    '\u{1}\u{100}\u{1}\u{65535}\u{2}\u{122}\u{2}\u{65535}') );
dlock( my $DFA3_accept = ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}'.
    '\u{65535}\u{1}\u{1}\u{3}\u{65535}\u{1}\u{5}\u{1}\u{6}\u{6}\u{65535}'.
    '\u{1}\u{2}\u{2}\u{65535}\u{1}\u{3}\u{1}\u{4}') );
dlock( my $DFA3_special = ANTLR::Runtime::DFA->unpack_encoded_string('\u{18}'.
    '\u{65535}') );
dlock( my $DFA3_transition = [
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{2}\u{6}\u{2}\u{65535}\u{1}'.
	'\u{6}\u{18}\u{65535}\u{1}\u{6}\u{26}\u{65535}\u{1}\u{1}\u{5}\u{65535}\u{26}'.
	'\u{5}\u{4}\u{65535}\u{1}\u{5}\u{1}\u{65535}\u{2}\u{5}\u{1}\u{3}\u{5}\u{5}'.
	'\u{1}\u{2}\u{12}\u{5}\u{1}\u{4}\u{4}\u{5}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{7}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{8}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{9}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{10}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{11}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{12}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{10}\u{5}\u{7}\u{65535}\u{26}'.
	'\u{5}\u{4}\u{65535}\u{1}\u{5}\u{1}\u{65535}\u{26}\u{5}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{14}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{15}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{10}\u{5}\u{7}\u{65535}\u{26}'.
	'\u{5}\u{4}\u{65535}\u{1}\u{5}\u{1}\u{65535}\u{26}\u{5}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{10}\u{5}\u{7}\u{65535}\u{26}'.
	'\u{5}\u{4}\u{65535}\u{1}\u{5}\u{1}\u{65535}\u{26}\u{5}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('')
] );

{
package t016actionsLexer::DFA3;
# use ANTLR::Runtime::Class;

use Moose;

extends 'ANTLR::Runtime::DFA';

sub BUILD {
    my ($self,$param_ref) = @_;

    $self->recognizer($param_ref->{recognizer});
    $self->decision_number(3);
    $self->eot($DFA3_eot);
    $self->eof($DFA3_eof);
    $self->min($DFA3_min);
    $self->max($DFA3_max);
    $self->accept($DFA3_accept);
    $self->special($DFA3_special);
    $self->transition($DFA3_transition);

	return;
}

sub get_description {
    return "1:1: Tokens : ( T__6 | T__7 | T__8 | T__9 | ID | WS );";
}


}
 

no Moose;
__PACKAGE__->meta->make_immutable();
1;
