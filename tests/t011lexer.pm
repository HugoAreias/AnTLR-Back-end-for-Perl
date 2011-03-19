# $ANTLR 3.2 Aug 03, 2010 13:12:17 grammars/t011lexer.g 2011-02-04 01:13:34
package t011lexer;

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
	IDENTIFIER => 4,
	WS => 5,
	EOF => -1,
};


sub BUILD {
    my ($self, $arg_ref) = @_;

    $self->init_dfas();

	return;
}

sub get_grammar_file_name {
    return 'grammars/t011lexer.g';
}

# $ANTLR start "IDENTIFIER"
sub m_IDENTIFIER {
    my ($self) = @_;
    try {
        my $_type = IDENTIFIER;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t011lexer.g:6:11: ( ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )* )
        # grammars/t011lexer.g:7:9: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
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

         # grammars/t011lexer.g:8:9: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
         LOOP1:
         while (1) {
             my $alt1 = 5;
             given ( $self->input->LA(1) ) {
             	when (['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']) {
             		$alt1 = 1;
             	}
             	when (['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']) {
             		$alt1 = 2;
             	}
             	when (['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) {
             		$alt1 = 3;
             	}
             	when (['_']) {
             		$alt1 = 4;
             	}

             }

             given ($alt1) {
         	    when (1) {
         	        # grammars/t011lexer.g:8:10: 'a' .. 'z'
         	        {
         	         $self->match_range('a','z'); 

         	        }
         	    }
         	    when (2) {
         	        # grammars/t011lexer.g:9:10: 'A' .. 'Z'
         	        {
         	         $self->match_range('A','Z'); 

         	        }
         	    }
         	    when (3) {
         	        # grammars/t011lexer.g:10:10: '0' .. '9'
         	        {
         	         $self->match_range('0','9'); 

         	        }
         	    }
         	    when (4) {
         	        # grammars/t011lexer.g:11:10: '_'
         	        {
         	         $self->match('_'); 
         	          
         	                       print "Underscore\n";
         	                       print "foo\n";
         	                     

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
# $ANTLR end "IDENTIFIER"

# $ANTLR start "WS"
sub m_WS {
    my ($self) = @_;
    try {
        my $_type = WS;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t011lexer.g:19:3: ( ( ' ' | '\\n' )+ )
        # grammars/t011lexer.g:19:5: ( ' ' | '\\n' )+
        {
         # grammars/t011lexer.g:19:5: ( ' ' | '\\n' )+
         my $cnt2 = 0;
         LOOP2:
         while (1) {
             my $alt2 = 2;
             my $LA2_0 = $self->input->LA(1);

             if ( ($LA2_0 eq "\n" || $LA2_0 eq ' ') ) {
                 $alt2 = 1;
             }


             given ($alt2) {
         	    when (1) {
         	        # grammars/t011lexer.g:
         	        {
         	         if ( $self->input->LA(1) eq "\n" || $self->input->LA(1) eq ' ' ) {
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
    # grammars/t011lexer.g:1:8: ( IDENTIFIER | WS )
    my $alt3 = 2;
    my $LA3_0 = $self->input->LA(1);

    if ( (($LA3_0 ge 'A' && $LA3_0 le 'Z') || $LA3_0 eq '_' || ($LA3_0 ge 'a' && $LA3_0 le 'z')) ) {
        $alt3 = 1;
    }
    elsif ( ($LA3_0 eq "\n" || $LA3_0 eq ' ') ) {
        $alt3 = 2;
    }
    else {
        my $nvae =
    		ANTLR::Runtime::NoViableAltException->new({
                grammar_decision_description => "",
                decision_number => 3,
                state_number => 0,
                input => $self->input,
            });

        $nvae->throw();
    }
    given ($alt3) {
        when (1) {
            # grammars/t011lexer.g:1:10: IDENTIFIER
            {
             $self->m_IDENTIFIER(); 

            }
        }
        when (2) {
            # grammars/t011lexer.g:1:21: WS
            {
             $self->m_WS(); 

            }
        }

    }

	return;
}



sub init_dfas {
    my ($self) = @_;


    return;
}

 

no Moose;
__PACKAGE__->meta->make_immutable();
1;
