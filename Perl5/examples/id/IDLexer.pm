# $ANTLR 3.2 Aug 03, 2010 13:12:17 ../examples/id/IDLexer.g 2010-08-03 23:24:55

package IDLexer;
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
     INT => 5, 
     EOF => -1, 
     WS => 7, 
     ID => 4, 
     NEWLINE => 6, 
};

sub BUILD {
    my ($self, $arg_ref) = @_;

    $self->init_dfas();
}

sub get_grammar_file_name {
    return "../examples/id/IDLexer.g";
}

# $ANTLR start ID
sub m_ID {
# 
    my ($self) = @_;
    eval {
        my $_type = ID;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # ../examples/id/IDLexer.g:4:5: ( ( 'a' .. 'z' | 'A' .. 'Z' )+ )
        # ../examples/id/IDLexer.g:4:9: ( 'a' .. 'z' | 'A' .. 'Z' )+
        {
        # ../examples/id/IDLexer.g:4:9: ( 'a' .. 'z' | 'A' .. 'Z' )+
        my $cnt1 = 0;
        LOOP1:
        while (1) {
            my $alt1 = 2;
            my $LA1_0 = $self->input->LA(1);

            if ( (($LA1_0 ge 'A' && $LA1_0 le 'Z') || ($LA1_0 ge 'a' && $LA1_0 le 'z')) ) {
                $alt1 = 1;
            }


            switch ($alt1) {
        	    case 1 {
        	        # ../examples/id/IDLexer.g:
        	        {
        	        if ( ($self->input->LA(1) ge 'A' && $self->input->LA(1) le 'Z') || ($self->input->LA(1) ge 'a' && $self->input->LA(1) le 'z') ) {
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
        	        if ( $cnt1 >= 1 ) { last LOOP1 }
                    my $eee =
                        ANTLR::Runtime::EarlyExitException->new(1, $self->input);
                    croak $eee;
                }
            }
            ++$cnt1;
        }


        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    };

    if ($EVAL_ERROR) {
        croak $EVAL_ERROR;
    }
}
# $ANTLR end ID

# $ANTLR start INT
sub m_INT {
# 
    my ($self) = @_;
    eval {
        my $_type = INT;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # ../examples/id/IDLexer.g:5:5: ( ( '0' .. '9' )+ )
        # ../examples/id/IDLexer.g:5:9: ( '0' .. '9' )+
        {
        # ../examples/id/IDLexer.g:5:9: ( '0' .. '9' )+
        my $cnt2 = 0;
        LOOP2:
        while (1) {
            my $alt2 = 2;
            my $LA2_0 = $self->input->LA(1);

            if ( (($LA2_0 ge '0' && $LA2_0 le '9')) ) {
                $alt2 = 1;
            }


            switch ($alt2) {
        	    case 1 {
        	        # ../examples/id/IDLexer.g:5:9: '0' .. '9'
        	        {
        	        $self->match_range('0','9'); 

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
# $ANTLR end INT

# $ANTLR start NEWLINE
sub m_NEWLINE {
# 
    my ($self) = @_;
    eval {
        my $_type = NEWLINE;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # ../examples/id/IDLexer.g:6:8: ( ( '\\r' )? '\\n' )
        # ../examples/id/IDLexer.g:6:9: ( '\\r' )? '\\n'
        {
        # ../examples/id/IDLexer.g:6:9: ( '\\r' )?
        my $alt3 = 2;
        my $LA3_0 = $self->input->LA(1);

        if ( ($LA3_0 eq "\r") ) {
            $alt3 = 1;
        }
        switch ($alt3) {
            case 1 {
                # ../examples/id/IDLexer.g:6:9: '\\r'
                {
                $self->match("\r"); 

                }
            }

        }

        $self->match("\n"); 
         $self->skip(); 

        }

        $self->state->type($_type);
        $self->state->channel($_channel);
    };

    if ($EVAL_ERROR) {
        croak $EVAL_ERROR;
    }
}
# $ANTLR end NEWLINE

# $ANTLR start WS
sub m_WS {
# 
    my ($self) = @_;
    eval {
        my $_type = WS;
        my $_channel = $self->DEFAULT_TOKEN_CHANNEL;
        # ../examples/id/IDLexer.g:7:5: ( ( ' ' | '\\t' )+ )
        # ../examples/id/IDLexer.g:7:9: ( ' ' | '\\t' )+
        {
        # ../examples/id/IDLexer.g:7:9: ( ' ' | '\\t' )+
        my $cnt4 = 0;
        LOOP4:
        while (1) {
            my $alt4 = 2;
            my $LA4_0 = $self->input->LA(1);

            if ( ($LA4_0 eq "\t" || $LA4_0 eq ' ') ) {
                $alt4 = 1;
            }


            switch ($alt4) {
        	    case 1 {
        	        # ../examples/id/IDLexer.g:
        	        {
        	        if ( $self->input->LA(1) eq "\t" || $self->input->LA(1) eq ' ' ) {
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
        	        if ( $cnt4 >= 1 ) { last LOOP4 }
                    my $eee =
                        ANTLR::Runtime::EarlyExitException->new(4, $self->input);
                    croak $eee;
                }
            }
            ++$cnt4;
        }

         $_channel = HIDDEN; 

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
    # ../examples/id/IDLexer.g:1:8: ( ID | INT | NEWLINE | WS )
    my $alt5 = 4;
    switch ( $self->input->LA(1) ) {
        case ['A' , 'B' , 'C' , 'D' , 'E' , 'F' , 'G' , 'H' , 'I' , 'J' , 'K' , 'L' , 'M' , 'N' , 'O' , 'P' , 'Q' , 'R' , 'S' , 'T' , 'U' , 'V' , 'W' , 'X' , 'Y' , 'Z' , 'a' , 'b' , 'c' , 'd' , 'e' , 'f' , 'g' , 'h' , 'i' , 'j' , 'k' , 'l' , 'm' , 'n' , 'o' , 'p' , 'q' , 'r' , 's' , 't' , 'u' , 'v' , 'w' , 'x' , 'y' , 'z' ] { $alt5 = 1; }
        case ['0' , '1' , '2' , '3' , '4' , '5' , '6' , '7' , '8' , '9' ] { $alt5 = 2; }
        case ["\n" , "\r" ] { $alt5 = 3; }
        case ["\t" , ' ' ] { $alt5 = 4; }
        else {
            my $nvae =
                ANTLR::Runtime::NoViableAltException->new({
                    grammar_decision_description => "",
                    decision_number => 5,
                    state_number => 0,
                    input => $self->input,
                });

            croak $nvae;

        }
    }

    switch ($alt5) {
        case 1 {
            # ../examples/id/IDLexer.g:1:10: ID
            {
            $self->m_ID(); 

            }
        }
        case 2 {
            # ../examples/id/IDLexer.g:1:13: INT
            {
            $self->m_INT(); 

            }
        }
        case 3 {
            # ../examples/id/IDLexer.g:1:17: NEWLINE
            {
            $self->m_NEWLINE(); 

            }
        }
        case 4 {
            # ../examples/id/IDLexer.g:1:25: WS
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
