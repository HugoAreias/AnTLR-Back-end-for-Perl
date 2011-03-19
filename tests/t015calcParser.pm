# $ANTLR 3.2 Aug 03, 2010 13:12:17 grammars/t015calc.g 2011-02-04 03:31:40
package t015calcParser;

use Math::Trig;


# use ANTLR::Runtime::Class;

use Moose;
use Carp;
use English qw( -no_match_vars );
use Data::Lock qw( dlock );
use Try::Tiny;
use Exception::Class;
use feature qw( switch );

use ANTLR::Runtime::BitSet;
use ANTLR::Runtime::MismatchedSetException;
use ANTLR::Runtime::EarlyExitException;
use ANTLR::Runtime::NoViableAltException;

extends 'ANTLR::Runtime::Parser';

dlock ( my $token_names = [
    "<invalid>", "<EOR>", "<DOWN>", "<UP>", "INTEGER", "DECIMAL", "DIGIT", "WS", "'+'", "'-'", "'*'", "'/'", "'ln'", "'^'", "'('", "')'", "'PI'"
] );
use constant {
	INTEGER => 4,
	T__12 => 12,
	T__8 => 8,
	WS => 7,
	EOF => -1,
	T__13 => 13,
	T__16 => 16,
	T__10 => 10,
	DIGIT => 6,
	T__14 => 14,
	T__9 => 9,
	T__11 => 11,
	DECIMAL => 5,
	T__15 => 15,
};

dlock( my $FOLLOW_expression_in_evaluate52 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_mult_in_expression67 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000302' ] }) );
dlock( my $FOLLOW_8_in_expression75 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000015030' ] }) );
dlock( my $FOLLOW_mult_in_expression79 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000302' ] }) );
dlock( my $FOLLOW_9_in_expression87 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000015030' ] }) );
dlock( my $FOLLOW_mult_in_expression91 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000302' ] }) );
dlock( my $FOLLOW_log_in_mult113 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000C02' ] }) );
dlock( my $FOLLOW_10_in_mult121 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000015030' ] }) );
dlock( my $FOLLOW_log_in_mult125 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000C02' ] }) );
dlock( my $FOLLOW_11_in_mult133 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000015030' ] }) );
dlock( my $FOLLOW_log_in_mult137 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000C02' ] }) );
dlock( my $FOLLOW_12_in_log158 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000015030' ] }) );
dlock( my $FOLLOW_exp_in_log162 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_exp_in_log174 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_atom_in_exp194 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000002002' ] }) );
dlock( my $FOLLOW_13_in_exp197 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000015030' ] }) );
dlock( my $FOLLOW_atom_in_exp201 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_INTEGER_in_atom230 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_DECIMAL_in_atom240 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_14_in_atom249 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000015030' ] }) );
dlock( my $FOLLOW_expression_in_atom253 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000008000' ] }) );
dlock( my $FOLLOW_15_in_atom257 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_16_in_atom263 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );



sub BUILD {
    my ($self, $arg_ref) = @_;

    $self->init_dfas();

	return;
}

sub get_token_names {
    return $token_names;
}

sub get_grammar_file_name {
    return 'grammars/t015calc.g';
}


sub emit_error_message {
	my ($self,$msg) = @_;
    push @{$self->reported_errors},$msg;
	return;
}



# $ANTLR start "evaluate"
# grammars/t015calc.g:22:1: evaluate returns [$result] : r= expression ;
sub evaluate {
    my ($self) = @_;
    my $result = undef;

    my $r = undef;


    try {
        # grammars/t015calc.g:22:27: (r= expression )
        # grammars/t015calc.g:22:29: r= expression
        {
         $self->push_follow($FOLLOW_expression_in_evaluate52);
         $r = $self->expression();

         $self->state->_fsp($self->state->_fsp - 1);

         $result = $r;

        }

    }
	catch {
		my $re;
		$EVAL_ERROR = $_;
	    if ( $re = Exception::Class->caught('ANTLR::Runtime::RecognitionException') ) {
	        $self->report_error($re);
	        $self->recover($self->input, $re);
	    }
	}
	finally {
	};
    return $result;
}
# $ANTLR end "evaluate"


# $ANTLR start "expression"
# grammars/t015calc.g:24:1: expression returns [$result] : r= mult ( '+' r2= mult | '-' r2= mult )* ;
sub expression {
    my ($self) = @_;
    my $result = undef;

    my $r = undef;

    my $r2 = undef;


    try {
        # grammars/t015calc.g:24:29: (r= mult ( '+' r2= mult | '-' r2= mult )* )
        # grammars/t015calc.g:24:31: r= mult ( '+' r2= mult | '-' r2= mult )*
        {
         $self->push_follow($FOLLOW_mult_in_expression67);
         $r = $self->mult();

         $self->state->_fsp($self->state->_fsp - 1);

         # grammars/t015calc.g:24:38: ( '+' r2= mult | '-' r2= mult )*
         LOOP1:
         while (1) {
             my $alt1 = 3;
             my $LA1_0 = $self->input->LA(1);

             if ( ($LA1_0 eq 8) ) {
                 $alt1 = 1;
             }
             elsif ( ($LA1_0 eq 9) ) {
                 $alt1 = 2;
             }


             given ($alt1) {
         	    when (1) {
         	        # grammars/t015calc.g:25:5: '+' r2= mult
         	        {
         	          $self->match($self->input, 8, $FOLLOW_8_in_expression75);

         	         $self->push_follow($FOLLOW_mult_in_expression79);
         	         $r2 = $self->mult();

         	         $self->state->_fsp($self->state->_fsp - 1);

         	         $r += $r2;

         	        }
         	    }
         	    when (2) {
         	        # grammars/t015calc.g:26:5: '-' r2= mult
         	        {
         	          $self->match($self->input, 9, $FOLLOW_9_in_expression87);

         	         $self->push_follow($FOLLOW_mult_in_expression91);
         	         $r2 = $self->mult();

         	         $self->state->_fsp($self->state->_fsp - 1);

         	         $r -= $r2;

         	        }
         	    }

         	    default { last LOOP1; }
             }
         }

         $result = $r;

        }

    }
	catch {
		my $re;
		$EVAL_ERROR = $_;
	    if ( $re = Exception::Class->caught('ANTLR::Runtime::RecognitionException') ) {
	        $self->report_error($re);
	        $self->recover($self->input, $re);
	    }
	}
	finally {
	};
    return $result;
}
# $ANTLR end "expression"


# $ANTLR start "mult"
# grammars/t015calc.g:29:1: mult returns [$result] : r= log ( '*' r2= log | '/' r2= log )* ;
sub mult {
    my ($self) = @_;
    my $result = undef;

    my $r = undef;

    my $r2 = undef;


    try {
        # grammars/t015calc.g:29:23: (r= log ( '*' r2= log | '/' r2= log )* )
        # grammars/t015calc.g:29:25: r= log ( '*' r2= log | '/' r2= log )*
        {
         $self->push_follow($FOLLOW_log_in_mult113);
         $r = $self->log();

         $self->state->_fsp($self->state->_fsp - 1);

         # grammars/t015calc.g:29:31: ( '*' r2= log | '/' r2= log )*
         LOOP2:
         while (1) {
             my $alt2 = 3;
             my $LA2_0 = $self->input->LA(1);

             if ( ($LA2_0 eq 10) ) {
                 $alt2 = 1;
             }
             elsif ( ($LA2_0 eq 11) ) {
                 $alt2 = 2;
             }


             given ($alt2) {
         	    when (1) {
         	        # grammars/t015calc.g:30:5: '*' r2= log
         	        {
         	          $self->match($self->input, 10, $FOLLOW_10_in_mult121);

         	         $self->push_follow($FOLLOW_log_in_mult125);
         	         $r2 = $self->log();

         	         $self->state->_fsp($self->state->_fsp - 1);

         	         $r *= $r2;

         	        }
         	    }
         	    when (2) {
         	        # grammars/t015calc.g:31:5: '/' r2= log
         	        {
         	          $self->match($self->input, 11, $FOLLOW_11_in_mult133);

         	         $self->push_follow($FOLLOW_log_in_mult137);
         	         $r2 = $self->log();

         	         $self->state->_fsp($self->state->_fsp - 1);

         	         $r /= $r2;

         	        }
         	    }

         	    default { last LOOP2; }
             }
         }

         $result = $r;

        }

    }
	catch {
		my $re;
		$EVAL_ERROR = $_;
	    if ( $re = Exception::Class->caught('ANTLR::Runtime::RecognitionException') ) {
	        $self->report_error($re);
	        $self->recover($self->input, $re);
	    }
	}
	finally {
	};
    return $result;
}
# $ANTLR end "mult"


# $ANTLR start "log"
# grammars/t015calc.g:35:1: log returns [$result] : ( 'ln' r= exp | r= exp );
sub log {
    my ($self) = @_;
    my $result = undef;

    my $r = undef;


    try {
        # grammars/t015calc.g:35:22: ( 'ln' r= exp | r= exp )
        my $alt3 = 2;
        my $LA3_0 = $self->input->LA(1);

        if ( ($LA3_0 eq 12) ) {
            $alt3 = 1;
        }
        elsif ( (($LA3_0 ge INTEGER && $LA3_0 le DECIMAL) || $LA3_0 eq 14 || $LA3_0 eq 16) ) {
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
                # grammars/t015calc.g:35:24: 'ln' r= exp
                {
                  $self->match($self->input, 12, $FOLLOW_12_in_log158);

                 $self->push_follow($FOLLOW_exp_in_log162);
                 $r = $self->exp();

                 $self->state->_fsp($self->state->_fsp - 1);

                 $result = log($r);

                }
            }
            when (2) {
                # grammars/t015calc.g:36:7: r= exp
                {
                 $self->push_follow($FOLLOW_exp_in_log174);
                 $r = $self->exp();

                 $self->state->_fsp($self->state->_fsp - 1);

                 $result = $r;

                }
            }

        }
    }
	catch {
		my $re;
		$EVAL_ERROR = $_;
	    if ( $re = Exception::Class->caught('ANTLR::Runtime::RecognitionException') ) {
	        $self->report_error($re);
	        $self->recover($self->input, $re);
	    }
	}
	finally {
	};
    return $result;
}
# $ANTLR end "log"


# $ANTLR start "exp"
# grammars/t015calc.g:39:1: exp returns [$result] : r= atom ( '^' r2= atom )? ;
sub exp {
    my ($self) = @_;
    my $result = undef;

    my $r = undef;

    my $r2 = undef;


    try {
        # grammars/t015calc.g:39:22: (r= atom ( '^' r2= atom )? )
        # grammars/t015calc.g:39:24: r= atom ( '^' r2= atom )?
        {
         $self->push_follow($FOLLOW_atom_in_exp194);
         $r = $self->atom();

         $self->state->_fsp($self->state->_fsp - 1);

         # grammars/t015calc.g:39:31: ( '^' r2= atom )?
         my $alt4 = 2;
         my $LA4_0 = $self->input->LA(1);

         if ( ($LA4_0 eq 13) ) {
             $alt4 = 1;
         }
         given ($alt4) {
             when (1) {
                 # grammars/t015calc.g:39:32: '^' r2= atom
                 {
                   $self->match($self->input, 13, $FOLLOW_13_in_exp197);

                  $self->push_follow($FOLLOW_atom_in_exp201);
                  $r2 = $self->atom();

                  $self->state->_fsp($self->state->_fsp - 1);

                  $r = $r**$r2;

                 }
             }

         }

         $result = $r;

        }

    }
	catch {
		my $re;
		$EVAL_ERROR = $_;
	    if ( $re = Exception::Class->caught('ANTLR::Runtime::RecognitionException') ) {
	        $self->report_error($re);
	        $self->recover($self->input, $re);
	    }
	}
	finally {
	};
    return $result;
}
# $ANTLR end "exp"


# $ANTLR start "atom"
# grammars/t015calc.g:42:1: atom returns [$result] : (n= INTEGER | n= DECIMAL | '(' r= expression ')' | 'PI' );
sub atom {
    my ($self) = @_;
    my $result = undef;

    my $n = undef;
    my $r = undef;


    try {
        # grammars/t015calc.g:42:23: (n= INTEGER | n= DECIMAL | '(' r= expression ')' | 'PI' )
        my $alt5 = 4;
        given ( $self->input->LA(1) ) {
            when ([INTEGER]) {
            	$alt5 = 1;
            }
            when ([DECIMAL]) {
            	$alt5 = 2;
            }
            when ([14]) {
            	$alt5 = 3;
            }
            when ([16]) {
            	$alt5 = 4;
            }
            default {
                my $nvae =
        			ANTLR::Runtime::NoViableAltException->new({
                        grammar_decision_description => "",
                        decision_number => 5,
                        state_number => 0,
                        input => $self->input,
                    });

                $nvae->throw();

            }
        }

        given ($alt5) {
            when (1) {
                # grammars/t015calc.g:43:5: n= INTEGER
                {
                 $n = $self->match($self->input, INTEGER, $FOLLOW_INTEGER_in_atom230);

                 $result = $n->get_text();

                }
            }
            when (2) {
                # grammars/t015calc.g:44:5: n= DECIMAL
                {
                 $n = $self->match($self->input, DECIMAL, $FOLLOW_DECIMAL_in_atom240);

                 $result = $n->get_text();

                }
            }
            when (3) {
                # grammars/t015calc.g:45:5: '(' r= expression ')'
                {
                  $self->match($self->input, 14, $FOLLOW_14_in_atom249);

                 $self->push_follow($FOLLOW_expression_in_atom253);
                 $r = $self->expression();

                 $self->state->_fsp($self->state->_fsp - 1);

                 $result = $r;
                  $self->match($self->input, 15, $FOLLOW_15_in_atom257);


                }
            }
            when (4) {
                # grammars/t015calc.g:46:5: 'PI'
                {
                  $self->match($self->input, 16, $FOLLOW_16_in_atom263);

                 $result = pi;

                }
            }

        }
    }
	catch {
		my $re;
		$EVAL_ERROR = $_;
	    if ( $re = Exception::Class->caught('ANTLR::Runtime::RecognitionException') ) {
	        $self->report_error($re);
	        $self->recover($self->input, $re);
	    }
	}
	finally {
	};
    return $result;
}
# $ANTLR end "atom"



sub init_dfas {
    my ($self) = @_;


    return;
}

 


no Moose;
__PACKAGE__->meta->make_immutable();
1;