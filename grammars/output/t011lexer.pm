# $ANTLR 3.2 Sep 23, 2009 12:02:23 /Users/Hades/Desktop/PerlANTLR/t011lexer.g 2010-04-14 00:41:23

package t011lexer;
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
     IDENTIFIER => 4, 
     WS => 5, 
     EOF => -1, 
};

sub BUILD {
    my ($self, $arg_ref) = @_;

    $self->init_dfas();
}

sub get_grammar_file_name {
    return "/Users/Hades/Desktop/PerlANTLR/t011lexer.g";
}

# $ANTLR start IDENTIFIER
sub m_IDENTIFIER {
# 
    my ($self) = @_;
    eval {
        my $_type = IDENTIFIER;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # /Users/Hades/Desktop/PerlANTLR/t011lexer.g:6:11: ( ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )* )
        # /Users/Hades/Desktop/PerlANTLR/t011lexer.g:7:9: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
        {
        if ( ($self->input->LA(1) ge 'A' && $self->input->LA(1) le 'Z') || $self->input->LA(1) eq '_' || ($self->input->LA(1) ge 'a' && $self->input->LA(1) le 'z') ) {
            $self->input->consume();

        }
        else {
            my $mse =
                ANTLR::Runtime::MismatchedSetException->new(undef, $self->input);
            $self->recover($mse);
            $mse->throw();}

        # /Users/Hades/Desktop/PerlANTLR/t011lexer.g:8:9: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
        LOOP1:
        while (1) {
            my $alt1 = 5;
            switch ( $self->input->LA(1) ) {
            case ['a' , 'b' , 'c' , 'd' , 'e' , 'f' , 'g' , 'h' , 'i' , 'j' , 'k' , 'l' , 'm' , 'n' , 'o' , 'p' , 'q' , 'r' , 's' , 't' , 'u' , 'v' , 'w' , 'x' , 'y' , 'z' ] { $alt1 = 1; }
            case ['A' , 'B' , 'C' , 'D' , 'E' , 'F' , 'G' , 'H' , 'I' , 'J' , 'K' , 'L' , 'M' , 'N' , 'O' , 'P' , 'Q' , 'R' , 'S' , 'T' , 'U' , 'V' , 'W' , 'X' , 'Y' , 'Z' ] { $alt1 = 2; }
            case ['0' , '1' , '2' , '3' , '4' , '5' , '6' , '7' , '8' , '9' ] { $alt1 = 3; }
            case ['_' ] { $alt1 = 4; }

            }

            switch ($alt1) {
        	    case 1 {
        	        # /Users/Hades/Desktop/PerlANTLR/t011lexer.g:8:10: 'a' .. 'z'
        	        {
        	        $self->match_range('a','z'); 

        	        }
        	    }
        	    case 2 {
        	        # /Users/Hades/Desktop/PerlANTLR/t011lexer.g:9:10: 'A' .. 'Z'
        	        {
        	        $self->match_range('A','Z'); 

        	        }
        	    }
        	    case 3 {
        	        # /Users/Hades/Desktop/PerlANTLR/t011lexer.g:10:10: '0' .. '9'
        	        {
        	        $self->match_range('0','9'); 

        	        }
        	    }
        	    case 4 {
        	        # /Users/Hades/Desktop/PerlANTLR/t011lexer.g:11:10: '_'
        	        {
        	        $self->match('_'); 
        	         
        	                      print "Underscore" 
        	                      print "foo"
        	                    

        	        }
        	    }

        	    else { last LOOP1 }
            }
        }


        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    };

    if ($EVAL_ERROR) {
        croak $EVAL_ERROR;
    }
}
# $ANTLR end IDENTIFIER

# $ANTLR start WS
sub m_WS {
# 
    my ($self) = @_;
    eval {
        my $_type = WS;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # /Users/Hades/Desktop/PerlANTLR/t011lexer.g:19:3: ( ( ' ' | '\\n' )+ )
        # /Users/Hades/Desktop/PerlANTLR/t011lexer.g:19:5: ( ' ' | '\\n' )+
        {
        # /Users/Hades/Desktop/PerlANTLR/t011lexer.g:19:5: ( ' ' | '\\n' )+
        my $cnt2 = 0;
        LOOP2:
        while (1) {
            my $alt2 = 2;
            my $LA2_0 = $self->input->LA(1);

            if ( ($LA2_0 eq "\n" || $LA2_0 eq ' ') ) {
                $alt2 = 1;
            }


            switch ($alt2) {
        	    case 1 {
        	        # /Users/Hades/Desktop/PerlANTLR/t011lexer.g:
        	        {
        	        if ( $self->input->LA(1) eq "\n" || $self->input->LA(1) eq ' ' ) {
        	            $self->input->consume();

        	        }
        	        else {
        	            my $mse =
        	                ANTLR::Runtime::MismatchedSetException->new(undef, $self->input);
        	            $self->recover($mse);
        	            $mse->throw();}


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


        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    };

    if ($EVAL_ERROR) {
        croak $EVAL_ERROR;
    }
}
# $ANTLR end WS

sub m_tokens {
    my ($self) = @_;
    # /Users/Hades/Desktop/PerlANTLR/t011lexer.g:1:8: ( IDENTIFIER | WS )
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

        croak $nvae;
    }
    switch ($alt3) {
        case 1 {
            # /Users/Hades/Desktop/PerlANTLR/t011lexer.g:1:10: IDENTIFIER
            {
            $self->m_IDENTIFIER(); 

            }
        }
        case 2 {
            # /Users/Hades/Desktop/PerlANTLR/t011lexer.g:1:21: WS
            {
            $self->m_WS(); 

            }
        }

    }

}



sub init_dfas {
    my ($self) = @_;


    return;
}

 

1;
