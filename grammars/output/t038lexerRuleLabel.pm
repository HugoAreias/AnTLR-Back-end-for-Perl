# $ANTLR 3.2 Sep 23, 2009 12:02:23 /Users/Hades/Desktop/PerlANTLR/t038lexerRuleLabel.g 2010-04-07 18:41:00

package t038lexerRuleLabel;
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
     A => 5, 
     WS => 4, 
     EOF => -1, 
};

sub BUILD {
    my ($self, $arg_ref) = @_;

    $self->init_dfas();
}

sub get_grammar_file_name {
    return "/Users/Hades/Desktop/PerlANTLR/t038lexerRuleLabel.g";
}

# $ANTLR start A
sub m_A {
# 
    my ($self) = @_;
    eval {
        my $_type = A;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        Token WS1=null;

        # /Users/Hades/Desktop/PerlANTLR/t038lexerRuleLabel.g:6:2: ( 'a' .. 'z' WS '0' .. '9' )
        # /Users/Hades/Desktop/PerlANTLR/t038lexerRuleLabel.g:6:4: 'a' .. 'z' WS '0' .. '9'
        {
        $self->match_range('a','z'); 
        int WS1Start28 = getCharIndex();
        $self->m_[t038lexerRuleLabel.WS,index=2,line=18](); 
        WS1 = new CommonToken(input, Token.INVALID_TOKEN_TYPE, Token.DEFAULT_CHANNEL, WS1Start28, getCharIndex()-1);
        $self->match_range('0','9'); 

                    print $WS1
                    print WS1.getType()
                    print WS1.getLine()
                    print WS1.getCharPositionInLine()
                    print WS1.getChannel()
                    print WS1.getTokenIndex()
                    print WS1.getText()
                

        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    };

    if ($EVAL_ERROR) {
        croak $EVAL_ERROR;
    }
}
# $ANTLR end A

# $ANTLR start WS
sub m_WS {
# 
    my ($self) = @_;
    eval {
        # /Users/Hades/Desktop/PerlANTLR/t038lexerRuleLabel.g:18:14: ( ( ' ' | '\\t' | ( '\\n' | '\\r\\n' | '\\r' ) )+ )
        # /Users/Hades/Desktop/PerlANTLR/t038lexerRuleLabel.g:19:9: ( ' ' | '\\t' | ( '\\n' | '\\r\\n' | '\\r' ) )+
        {
        # /Users/Hades/Desktop/PerlANTLR/t038lexerRuleLabel.g:19:9: ( ' ' | '\\t' | ( '\\n' | '\\r\\n' | '\\r' ) )+
        my $cnt2 = 0;
        LOOP2:
        while (1) {
            my $alt2 = 4;
            switch ( $self->input->LA(1) ) {
            case [' ' ] { $alt2 = 1; }
            case ["\t" ] { $alt2 = 2; }
            case ["\n" , "\r" ] { $alt2 = 3; }

            }

            switch ($alt2) {
        	    case 1 {
        	        # /Users/Hades/Desktop/PerlANTLR/t038lexerRuleLabel.g:19:13: ' '
        	        {
        	        $self->match(' '); 

        	        }
        	    }
        	    case 2 {
        	        # /Users/Hades/Desktop/PerlANTLR/t038lexerRuleLabel.g:20:13: '\\t'
        	        {
        	        $self->match("\t"); 

        	        }
        	    }
        	    case 3 {
        	        # /Users/Hades/Desktop/PerlANTLR/t038lexerRuleLabel.g:21:12: ( '\\n' | '\\r\\n' | '\\r' )
        	        {
        	        # /Users/Hades/Desktop/PerlANTLR/t038lexerRuleLabel.g:21:12: ( '\\n' | '\\r\\n' | '\\r' )
        	        my $alt1 = 3;
        	        my $LA1_0 = $self->input->LA(1);

        	        if ( ($LA1_0 eq "\n") ) {
        	            $alt1 = 1;
        	        }
        	        elsif ( ($LA1_0 eq "\r") ) {
        	            my $LA1_2 = $self->input->LA(2);

        	            if ( ($LA1_2 eq "\n") ) {
        	                $alt1 = 2;
        	            }
        	            else {
        	                $alt1 = 3;}
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
        	                # /Users/Hades/Desktop/PerlANTLR/t038lexerRuleLabel.g:21:14: '\\n'
        	                {
        	                $self->match("\n"); 

        	                }
        	            }
        	            case 2 {
        	                # /Users/Hades/Desktop/PerlANTLR/t038lexerRuleLabel.g:22:15: '\\r\\n'
        	                {
        	                $self->match("\r\n"); 


        	                }
        	            }
        	            case 3 {
        	                # /Users/Hades/Desktop/PerlANTLR/t038lexerRuleLabel.g:23:15: '\\r'
        	                {
        	                $self->match("\r"); 

        	                }
        	            }

        	        }


        	        }
        	    }

        	    else {
        	        if ( $cnt2 >= 1 ) { last LOOP2 }
                    my $eee =
                        ANTLR::Runtime::EarlyExitException->new(2, $self->input);
                    croak $eee;
                }
            }
            ++$cnt2;
        }

         $_channel = HIDDEN 

        }

    };

    if ($EVAL_ERROR) {
        croak $EVAL_ERROR;
    }
}
# $ANTLR end WS

sub m_tokens {
    my ($self) = @_;
    # /Users/Hades/Desktop/PerlANTLR/t038lexerRuleLabel.g:1:8: ( A )
    # /Users/Hades/Desktop/PerlANTLR/t038lexerRuleLabel.g:1:10: A
    {
    $self->m_A(); 

    }


}



sub init_dfas {
    my ($self) = @_;


    return;
}

 

1;
