# $ANTLR 3.2 Aug 03, 2010 13:12:17 grammars/t013parser.g 2010-12-22 00:16:16
package t013parserLexer;

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


use constant {
	IDENTIFIER => 4,
	EOF => -1,
};


sub BUILD {
    my ($self, $arg_ref) = @_;

    $self->init_dfas();
}

sub get_grammar_file_name {
    return 'grammars/t013parser.g';
}

# $ANTLR start "IDENTIFIER"
sub m_IDENTIFIER {
    my ($self) = @_;
    try {
        my $_type = IDENTIFIER;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # grammars/t013parser.g:42:11: ( ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )* )
        # grammars/t013parser.g:42:13: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
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

         # grammars/t013parser.g:42:37: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
         LOOP1:
         while (1) {
             my $alt1 = 2;
             my $LA1_0 = $self->input->LA(1);

             if ( (($LA1_0 ge '0' && $LA1_0 le '9') || ($LA1_0 ge 'A' && $LA1_0 le 'Z') || $LA1_0 eq '_' || ($LA1_0 ge 'a' && $LA1_0 le 'z')) ) {
                 $alt1 = 1;
             }


             given ($alt1) {
         	    when (1) {
         	        # grammars/t013parser.g:
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
# $ANTLR end "IDENTIFIER"

sub m_tokens {
    my ($self) = @_;
    # grammars/t013parser.g:1:8: ( IDENTIFIER )
    # grammars/t013parser.g:1:10: IDENTIFIER
    {
     $self->m_IDENTIFIER(); 

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
