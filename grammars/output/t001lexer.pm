# $ANTLR 3.2 Sep 23, 2009 12:02:23 /Users/Hades/Projects/ANTLR/antlr-3.2/runtime/Perl5/grammars/t001lexer.g 2010-09-01 18:50:22

package t001lexer;
use ANTLR::Runtime::Class;

use Carp;
use English qw( -no_match_vars ) ;
use Readonly;
use Switch;

use ANTLR::Runtime::BaseRecognizer;
use ANTLR::Runtime::DFA;
use ANTLR::Runtime::NoViableAltException;

extends 'ANTLR::Runtime::Lexer';

use constant {
    HIDDEN => ANTLR::Runtime::BaseRecognizer->HIDDEN
};

use constant {
     ZERO => 4, 
     EOF => -1, 
};

sub BUILD {
    my ($self, $arg_ref) = @_;

    $self->init_dfas();
}

sub get_grammar_file_name {
    return "/Users/Hades/Projects/ANTLR/antlr-3.2/runtime/Perl5/grammars/t001lexer.g";
}

# $ANTLR start ZERO
sub m_ZERO {
# 
    my ($self) = @_;
    eval {
        my $_type = ZERO;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # /Users/Hades/Projects/ANTLR/antlr-3.2/runtime/Perl5/grammars/t001lexer.g:6:5: ( '0' )
        # /Users/Hades/Projects/ANTLR/antlr-3.2/runtime/Perl5/grammars/t001lexer.g:6:7: '0'
        {
        $self->match('0'); 

        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    };

    if ($EVAL_ERROR) {
        croak $EVAL_ERROR;
    }
}
# $ANTLR end ZERO

sub m_tokens {
    my ($self) = @_;
    # /Users/Hades/Projects/ANTLR/antlr-3.2/runtime/Perl5/grammars/t001lexer.g:1:8: ( ZERO )
    # /Users/Hades/Projects/ANTLR/antlr-3.2/runtime/Perl5/grammars/t001lexer.g:1:10: ZERO
    {
    $self->m_ZERO(); 

    }


}



sub init_dfas {
    my ($self) = @_;


    return;
}

 

1;
