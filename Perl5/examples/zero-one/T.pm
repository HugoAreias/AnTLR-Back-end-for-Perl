# $ANTLR 3.2 Aug 03, 2010 13:12:17 ../examples/zero-one/T.g 2010-08-03 23:24:31

package T;
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
     ONE => 5, 
     EOF => -1, 
};

sub BUILD {
    my ($self, $arg_ref) = @_;

    $self->init_dfas();
}

sub get_grammar_file_name {
    return "../examples/zero-one/T.g";
}

# $ANTLR start ZERO
sub m_ZERO {
# 
    my ($self) = @_;
    eval {
        my $_type = ZERO;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # ../examples/zero-one/T.g:3:5: ( '0' )
        # ../examples/zero-one/T.g:3:7: '0'
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

# $ANTLR start ONE
sub m_ONE {
# 
    my ($self) = @_;
    eval {
        my $_type = ONE;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # ../examples/zero-one/T.g:4:4: ( '1' )
        # ../examples/zero-one/T.g:4:6: '1'
        {
        $self->match('1'); 

        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    };

    if ($EVAL_ERROR) {
        croak $EVAL_ERROR;
    }
}
# $ANTLR end ONE

sub m_tokens {
    my ($self) = @_;
    # ../examples/zero-one/T.g:1:8: ( ZERO | ONE )
    my $alt1 = 2;
    my $LA1_0 = $self->input->LA(1);

    if ( ($LA1_0 eq '0') ) {
        $alt1 = 1;
    }
    elsif ( ($LA1_0 eq '1') ) {
        $alt1 = 2;
    }
    else {
        my $nvae =
            ANTLR::Runtime::NoViableAltException->new({
                grammar_decision_description => "",
                decision_number => 1,
                state_number => 0,
                input => $self->input,
            });

        croak $nvae;
    }
    switch ($alt1) {
        case 1 {
            # ../examples/zero-one/T.g:1:10: ZERO
            {
            $self->m_ZERO(); 

            }
        }
        case 2 {
            # ../examples/zero-one/T.g:1:15: ONE
            {
            $self->m_ONE(); 

            }
        }

    }

}



sub init_dfas {
    my ($self) = @_;


    return;
}

 

1;
