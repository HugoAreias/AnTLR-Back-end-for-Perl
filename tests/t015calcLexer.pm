# $ANTLR 3.2 Aug 03, 2010 13:12:17 grammars/t015calc.g 2011-02-04 03:31:40
package t015calcLexer;

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
	INTEGER => 4,
	T__12 => 12,
	T__8 => 8,
	EOF => -1,
	WS => 7,
	T__13 => 13,
	T__16 => 16,
	T__10 => 10,
	DIGIT => 6,
	T__9 => 9,
	T__14 => 14,
	T__11 => 11,
	DECIMAL => 5,
	T__15 => 15,
};


sub BUILD {
    my ($self, $arg_ref) = @_;

    $self->init_dfas();

	return;
}

sub get_grammar_file_name {
    return 'grammars/t015calc.g';
}

# $ANTLR start "T__8"
sub m_T__8 {
    my ($self) = @_;
    try {
        my $_type = T__8;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t015calc.g:7:6: ( '+' )
        # grammars/t015calc.g:7:8: '+'
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
# $ANTLR end "T__8"

# $ANTLR start "T__9"
sub m_T__9 {
    my ($self) = @_;
    try {
        my $_type = T__9;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t015calc.g:8:6: ( '-' )
        # grammars/t015calc.g:8:8: '-'
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
# $ANTLR end "T__9"

# $ANTLR start "T__10"
sub m_T__10 {
    my ($self) = @_;
    try {
        my $_type = T__10;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t015calc.g:9:7: ( '*' )
        # grammars/t015calc.g:9:9: '*'
        {
         $self->match('*'); 

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
        # grammars/t015calc.g:10:7: ( '/' )
        # grammars/t015calc.g:10:9: '/'
        {
         $self->match('/'); 

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
        # grammars/t015calc.g:11:7: ( 'ln' )
        # grammars/t015calc.g:11:9: 'ln'
        {
         $self->match("ln"); 


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
        # grammars/t015calc.g:12:7: ( '^' )
        # grammars/t015calc.g:12:9: '^'
        {
         $self->match('^'); 

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
        # grammars/t015calc.g:13:7: ( '(' )
        # grammars/t015calc.g:13:9: '('
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
# $ANTLR end "T__14"

# $ANTLR start "T__15"
sub m_T__15 {
    my ($self) = @_;
    try {
        my $_type = T__15;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t015calc.g:14:7: ( ')' )
        # grammars/t015calc.g:14:9: ')'
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
# $ANTLR end "T__15"

# $ANTLR start "T__16"
sub m_T__16 {
    my ($self) = @_;
    try {
        my $_type = T__16;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t015calc.g:15:7: ( 'PI' )
        # grammars/t015calc.g:15:9: 'PI'
        {
         $self->match("PI"); 


        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "T__16"

# $ANTLR start "INTEGER"
sub m_INTEGER {
    my ($self) = @_;
    try {
        my $_type = INTEGER;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t015calc.g:50:8: ( ( DIGIT )+ )
        # grammars/t015calc.g:50:10: ( DIGIT )+
        {
         # grammars/t015calc.g:50:10: ( DIGIT )+
         my $cnt1 = 0;
         LOOP1:
         while (1) {
             my $alt1 = 2;
             my $LA1_0 = $self->input->LA(1);

             if ( (($LA1_0 ge '0' && $LA1_0 le '9')) ) {
                 $alt1 = 1;
             }


             given ($alt1) {
         	    when (1) {
         	        # grammars/t015calc.g:50:10: DIGIT
         	        {
         	         $self->m_DIGIT(); 

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
# $ANTLR end "INTEGER"

# $ANTLR start "DECIMAL"
sub m_DECIMAL {
    my ($self) = @_;
    try {
        my $_type = DECIMAL;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t015calc.g:52:8: ( ( DIGIT )+ '.' ( DIGIT )+ )
        # grammars/t015calc.g:52:10: ( DIGIT )+ '.' ( DIGIT )+
        {
         # grammars/t015calc.g:52:10: ( DIGIT )+
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
         	        # grammars/t015calc.g:52:10: DIGIT
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

         $self->match('.'); 
         # grammars/t015calc.g:52:21: ( DIGIT )+
         my $cnt3 = 0;
         LOOP3:
         while (1) {
             my $alt3 = 2;
             my $LA3_0 = $self->input->LA(1);

             if ( (($LA3_0 ge '0' && $LA3_0 le '9')) ) {
                 $alt3 = 1;
             }


             given ($alt3) {
         	    when (1) {
         	        # grammars/t015calc.g:52:21: DIGIT
         	        {
         	         $self->m_DIGIT(); 

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


        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    }
	finally {
	};
	return;
}
# $ANTLR end "DECIMAL"

# $ANTLR start "DIGIT"
sub m_DIGIT {
    my ($self) = @_;
    try {
        # grammars/t015calc.g:55:6: ( '0' .. '9' )
        # grammars/t015calc.g:55:8: '0' .. '9'
        {
         $self->match_range('0','9'); 

        }

    }
	finally {
	};
	return;
}
# $ANTLR end "DIGIT"

# $ANTLR start "WS"
sub m_WS {
    my ($self) = @_;
    try {
        my $_type = WS;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t015calc.g:57:3: ( ( ' ' | '\\n' | '\\t' )+ )
        # grammars/t015calc.g:57:5: ( ' ' | '\\n' | '\\t' )+
        {
         # grammars/t015calc.g:57:5: ( ' ' | '\\n' | '\\t' )+
         my $cnt4 = 0;
         LOOP4:
         while (1) {
             my $alt4 = 2;
             my $LA4_0 = $self->input->LA(1);

             if ( (($LA4_0 ge "\t" && $LA4_0 le "\n") || $LA4_0 eq ' ') ) {
                 $alt4 = 1;
             }


             given ($alt4) {
         	    when (1) {
         	        # grammars/t015calc.g:
         	        {
         	         if ( ($self->input->LA(1) ge "\t" && $self->input->LA(1) le "\n") || $self->input->LA(1) eq ' ' ) {
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
         	        last LOOP4 if ( $cnt4 >= 1 );
                     my $eee =
         				ANTLR::Runtime::EarlyExitException->new({
         					decision_number => 4,
         					input => $self->input,
         				});
                     $eee->throw();
                 }
             }
             ++$cnt4;
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
    # grammars/t015calc.g:1:8: ( T__8 | T__9 | T__10 | T__11 | T__12 | T__13 | T__14 | T__15 | T__16 | INTEGER | DECIMAL | WS )
    my $alt5 = 12;
    $alt5 = $self->dfa5->predict($self->input);
    given ($alt5) {
        when (1) {
            # grammars/t015calc.g:1:10: T__8
            {
             $self->m_T__8(); 

            }
        }
        when (2) {
            # grammars/t015calc.g:1:15: T__9
            {
             $self->m_T__9(); 

            }
        }
        when (3) {
            # grammars/t015calc.g:1:20: T__10
            {
             $self->m_T__10(); 

            }
        }
        when (4) {
            # grammars/t015calc.g:1:26: T__11
            {
             $self->m_T__11(); 

            }
        }
        when (5) {
            # grammars/t015calc.g:1:32: T__12
            {
             $self->m_T__12(); 

            }
        }
        when (6) {
            # grammars/t015calc.g:1:38: T__13
            {
             $self->m_T__13(); 

            }
        }
        when (7) {
            # grammars/t015calc.g:1:44: T__14
            {
             $self->m_T__14(); 

            }
        }
        when (8) {
            # grammars/t015calc.g:1:50: T__15
            {
             $self->m_T__15(); 

            }
        }
        when (9) {
            # grammars/t015calc.g:1:56: T__16
            {
             $self->m_T__16(); 

            }
        }
        when (10) {
            # grammars/t015calc.g:1:62: INTEGER
            {
             $self->m_INTEGER(); 

            }
        }
        when (11) {
            # grammars/t015calc.g:1:70: DECIMAL
            {
             $self->m_DECIMAL(); 

            }
        }
        when (12) {
            # grammars/t015calc.g:1:78: WS
            {
             $self->m_WS(); 

            }
        }

    }

	return;
}


has 'dfa5' => ( is => 'rw' );

sub init_dfas {
    my ($self) = @_;

    $self->dfa5(t015calcLexer::DFA5->new({ recognizer => $self }));
        

    return;
}


dlock( my $DFA5_eot = ANTLR::Runtime::DFA->unpack_encoded_string('\u{10}'.
    '\u{65535}\u{1}\u{12}\u{3}\u{65535}') );
dlock( my $DFA5_eof = ANTLR::Runtime::DFA->unpack_encoded_string('\u{14}'.
    '\u{65535}') );
dlock( my $DFA5_min = ANTLR::Runtime::DFA->unpack_encoded_string_to_unsigned_chars(''.
    '\u{1}\u{9}\u{9}\u{65535}\u{1}\u{46}\u{3}\u{65535}') );
dlock( my $DFA5_max = ANTLR::Runtime::DFA->unpack_encoded_string_to_unsigned_chars(''.
    '\u{1}\u{108}\u{9}\u{65535}\u{1}\u{57}\u{3}\u{65535}') );
dlock( my $DFA5_accept = ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}'.
    '\u{65535}\u{1}\u{1}\u{1}\u{2}\u{1}\u{3}\u{1}\u{4}\u{1}\u{5}\u{1}\u{6}'.
    '\u{1}\u{7}\u{1}\u{8}\u{1}\u{9}\u{1}\u{65535}\u{1}\u{12}\u{1}\u{10}\u{1}'.
    '\u{11}') );
dlock( my $DFA5_special = ANTLR::Runtime::DFA->unpack_encoded_string('\u{14}'.
    '\u{65535}') );
dlock( my $DFA5_transition = [
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{2}\u{11}\u{21}\u{65535}\u{1}'.
	'\u{11}\u{7}\u{65535}\u{1}\u{7}\u{1}\u{8}\u{1}\u{3}\u{1}\u{1}\u{1}\u{65535}'.
	'\u{1}\u{2}\u{1}\u{65535}\u{1}\u{4}\u{10}\u{10}\u{22}\u{65535}\u{1}\u{9}'.
	'\u{13}\u{65535}\u{1}\u{6}\u{13}\u{65535}\u{1}\u{5}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{13}\u{1}\u{65535}\u{10}'.
	'\u{10}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('')
] );

{
package t015calcLexer::DFA5;
# use ANTLR::Runtime::Class;

use Moose;

extends 'ANTLR::Runtime::DFA';

sub BUILD {
    my ($self,$param_ref) = @_;

    $self->recognizer($param_ref->{recognizer});
    $self->decision_number(5);
    $self->eot($DFA5_eot);
    $self->eof($DFA5_eof);
    $self->min($DFA5_min);
    $self->max($DFA5_max);
    $self->accept($DFA5_accept);
    $self->special($DFA5_special);
    $self->transition($DFA5_transition);

	return;
}

sub get_description {
    return "1:1: Tokens : ( T__8 | T__9 | T__10 | T__11 | T__12 | T__13 | T__14 | T__15 | T__16 | INTEGER | DECIMAL | WS );";
}


}
 

no Moose;
__PACKAGE__->meta->make_immutable();
1;
