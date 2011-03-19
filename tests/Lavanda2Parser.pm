# $ANTLR 3.2 Aug 03, 2010 13:12:17 grammars/Lavanda2.g 2011-02-02 00:05:47
package Lavanda2Parser;

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
    "<invalid>", "<EOR>", "<DOWN>", "<UP>", "DATA", "ID", "NUM", "LETTER", "DIGIT", "WS", "'('", "')'", "','", "'-'", "'corpo'", "'casa'", "'br'", "'cor'", "'alg'", "'la'", "'fib'"
] );
use constant {
	LETTER => 7,
	T__12 => 12,
	T__20 => 20,
	WS => 9,
	T__13 => 13,
	T__19 => 19,
	DATA => 4,
	T__14 => 14,
	T__11 => 11,
	T__17 => 17,
	EOF => -1,
	T__16 => 16,
	NUM => 6,
	T__10 => 10,
	DIGIT => 8,
	T__18 => 18,
	T__15 => 15,
	ID => 5,
};

dlock( my $FOLLOW_cabec_in_lavanda30 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000040' ] }) );
dlock( my $FOLLOW_sacos_in_lavanda32 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_DATA_in_cabec52 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000020' ] }) );
dlock( my $FOLLOW_ID_in_cabec54 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_saco_in_sacos77 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000042' ] }) );
dlock( my $FOLLOW_NUM_in_saco102 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000020' ] }) );
dlock( my $FOLLOW_ID_in_saco110 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000400' ] }) );
dlock( my $FOLLOW_10_in_saco119 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x000000000000C000' ] }) );
dlock( my $FOLLOW_lotes_in_saco121 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000800' ] }) );
dlock( my $FOLLOW_11_in_saco124 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_lote_in_lotes146 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000001002' ] }) );
dlock( my $FOLLOW_12_in_lotes156 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x000000000000C000' ] }) );
dlock( my $FOLLOW_lote_in_lotes160 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000001002' ] }) );
dlock( my $FOLLOW_tipo_in_lote184 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000040' ] }) );
dlock( my $FOLLOW_NUM_in_lote186 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_classe_in_tipo204 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000002000' ] }) );
dlock( my $FOLLOW_13_in_tipo206 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000030000' ] }) );
dlock( my $FOLLOW_tinto_in_tipo208 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000002000' ] }) );
dlock( my $FOLLOW_13_in_tipo210 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x00000000001C0000' ] }) );
dlock( my $FOLLOW_fio_in_tipo212 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_14_in_classe230 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_15_in_classe237 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_16_in_tinto255 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_17_in_tinto264 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_18_in_fio283 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_19_in_fio291 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_20_in_fio300 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );



sub BUILD {
    my ($self, $arg_ref) = @_;

    $self->init_dfas();

	return;
}

sub get_token_names {
    return $token_names;
}

sub get_grammar_file_name {
    return 'grammars/Lavanda2.g';
}


my $inTable = {};



# $ANTLR start "lavanda"
# grammars/Lavanda2.g:10:1: lavanda : cabec sacos ;
sub lavanda {
    my ($self) = @_;
    my $sacos1 = undef;


    try {
        # grammars/Lavanda2.g:11:2: ( cabec sacos )
        # grammars/Lavanda2.g:11:4: cabec sacos
        {
         $self->push_follow($FOLLOW_cabec_in_lavanda30);
         $self->cabec();

         $self->state->_fsp($self->state->_fsp - 1);

         $self->push_follow($FOLLOW_sacos_in_lavanda32);
         $sacos1 = $self->sacos();

         $self->state->_fsp($self->state->_fsp - 1);


         # print 'Total sacos: ' . $sacos1->{nSacos} . "\n";
         # foreach ( keys %{$sacos1->{outEnv}} ) {
         # 	print "$_\t" . $sacos1->{outEnv}->{$_} . "\n";
         # }
                 

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
    return ;
}
# $ANTLR end "lavanda"


# $ANTLR start "cabec"
# grammars/Lavanda2.g:20:1: cabec : DATA ID ;
sub cabec {
    my ($self) = @_;
    try {
        # grammars/Lavanda2.g:21:2: ( DATA ID )
        # grammars/Lavanda2.g:21:4: DATA ID
        {
          $self->match($self->input, DATA, $FOLLOW_DATA_in_cabec52);

          $self->match($self->input, ID, $FOLLOW_ID_in_cabec54);


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
    return ;
}
# $ANTLR end "cabec"

{
    package sacos_return;
    # use ANTLR::Runtime::Class;
	use Moose;

    extends 'ANTLR::Runtime::ParserRuleReturnScope';

	my $nSacos = 0;
	my $outEnv = {};

}

# $ANTLR start "sacos"
# grammars/Lavanda2.g:24:1: sacos returns [ $nSacos = 0, $outEnv = {} ] : ( saco[\\$inEnv, \\$clientIds, \\$bagIds] )+ ;
sub sacos {
    my ($self) = @_;
    my $retval = sacos_return->new();
    $retval->start($self->input->LT(1));

    my $saco2 = undef;



    my $clientIds = {};
    my $bagIds    = {};
    my $inEnv     = {};            
    try {
        # grammars/Lavanda2.g:29:2: ( ( saco[\\$inEnv, \\$clientIds, \\$bagIds] )+ )
        # grammars/Lavanda2.g:29:4: ( saco[\\$inEnv, \\$clientIds, \\$bagIds] )+
        {
         # grammars/Lavanda2.g:29:4: ( saco[\\$inEnv, \\$clientIds, \\$bagIds] )+
         my $cnt1 = 0;
         LOOP1:
         while (1) {
             my $alt1 = 2;
             my $LA1_0 = $self->input->LA(1);

             if ( ($LA1_0 eq NUM) ) {
                 $alt1 = 1;
             }


             given ($alt1) {
         	    when (1) {
         	        # grammars/Lavanda2.g:29:6: saco[\\$inEnv, \\$clientIds, \\$bagIds]
         	        {
         	         $self->push_follow($FOLLOW_saco_in_sacos77);
         	         $saco2 = $self->saco($inEnv, $clientIds, $bagIds);

         	         $self->state->_fsp($self->state->_fsp - 1);

         	          $retval->{nSacos}++; $retval->{outEnv} = $saco2; 

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

        $retval->stop($self->input->LT(-1));

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
    return $retval;
}
# $ANTLR end "sacos"


# $ANTLR start "saco"
# grammars/Lavanda2.g:32:1: saco[ $inEnv, $clientIds, $bagIds ] returns [ $outEnv ] : NUM ID '(' lotes[\\$inEnv] ')' ;
sub saco {
    my ($self, $inEnv, $clientIds, $bagIds) = @_;
    my $outEnv = undef;

    my $NUM3 = undef;
    my $ID4 = undef;
    my $lotes5 = undef;


    try {
        # grammars/Lavanda2.g:33:2: ( NUM ID '(' lotes[\\$inEnv] ')' )
        # grammars/Lavanda2.g:33:5: NUM ID '(' lotes[\\$inEnv] ')'
        {
         $NUM3 = $self->match($self->input, NUM, $FOLLOW_NUM_in_saco102);


         # if(defined $bagIds->{$NUM3->get_text()}) { print "Bag ID already exists!\n" }
         $bagIds->{$NUM3->get_text()} = 1; 
         $ID4 = $self->match($self->input, ID, $FOLLOW_ID_in_saco110);


         # if(defined $clientIds->{$ID4->get_text()}) { print "Client ID already exists!\n" }
         $clientIds->{$ID4->get_text()} = 1; 
          $self->match($self->input, 10, $FOLLOW_10_in_saco119);

         $self->push_follow($FOLLOW_lotes_in_saco121);
         $lotes5 = $self->lotes($inEnv);

         $self->state->_fsp($self->state->_fsp - 1);

          $self->match($self->input, 11, $FOLLOW_11_in_saco124);


         # print 'Numero de lotes para o ID ' . $ID4->get_text() . ': ' . $lotes5->{nLotes} . "\n";
         # print ' Custo: ' . $lotes5->{custoTotal} . "\n";
         $outEnv = $lotes5->{outEnv}; 

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
    return $outEnv;
}
# $ANTLR end "saco"

{
    package lotes_return;
    # use ANTLR::Runtime::Class;
	use Moose;

    extends 'ANTLR::Runtime::ParserRuleReturnScope';

	my $outEnv;
	my $nLotes = 0;
	my $custoTotal = 0;

}

# $ANTLR start "lotes"
# grammars/Lavanda2.g:45:1: lotes[ $inEnv ] returns [ $outEnv, $nLotes = 0, $custoTotal = 0 ] : l1= lote[$inEnv] ( ',' l2= lote[$outEnv] )* ;
sub lotes {
    my ($self, $inEnv) = @_;
    my $retval = lotes_return->new();
    $retval->start($self->input->LT(1));

    my $l1 = undef;

    my $l2 = undef;


    try {
        # grammars/Lavanda2.g:46:2: (l1= lote[$inEnv] ( ',' l2= lote[$outEnv] )* )
        # grammars/Lavanda2.g:46:4: l1= lote[$inEnv] ( ',' l2= lote[$outEnv] )*
        {
         $self->push_follow($FOLLOW_lote_in_lotes146);
         $l1 = $self->lote($inEnv);

         $self->state->_fsp($self->state->_fsp - 1);

          $retval->{nLotes}++; $retval->{custoTotal} += $l1->{custoTotal}; $retval->{outEnv} = $l1->{outEnv}; 
         # grammars/Lavanda2.g:47:4: ( ',' l2= lote[$outEnv] )*
         LOOP2:
         while (1) {
             my $alt2 = 2;
             my $LA2_0 = $self->input->LA(1);

             if ( ($LA2_0 eq 12) ) {
                 $alt2 = 1;
             }


             given ($alt2) {
         	    when (1) {
         	        # grammars/Lavanda2.g:47:5: ',' l2= lote[$outEnv]
         	        {
         	          $self->match($self->input, 12, $FOLLOW_12_in_lotes156);

         	         $self->push_follow($FOLLOW_lote_in_lotes160);
         	         $l2 = $self->lote($retval->{outEnv});

         	         $self->state->_fsp($self->state->_fsp - 1);

         	          $retval->{nLotes}++; $retval->{custoTotal} += $l2->{custoTotal}; $retval->{outEnv} = $l2->{outEnv}; 

         	        }
         	    }

         	    default { last LOOP2; }
             }
         }


        }

        $retval->stop($self->input->LT(-1));

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
    return $retval;
}
# $ANTLR end "lotes"

{
    package lote_return;
    # use ANTLR::Runtime::Class;
	use Moose;

    extends 'ANTLR::Runtime::ParserRuleReturnScope';

	my $custoTotal;
	my $outEnv;

}

# $ANTLR start "lote"
# grammars/Lavanda2.g:50:1: lote[ $inEnv ] returns [ $custoTotal, $outEnv ] : tipo NUM ;
sub lote {
    my ($self, $inEnv) = @_;
    my $retval = lote_return->new();
    $retval->start($self->input->LT(1));

    my $NUM6 = undef;
    my $tipo7 = undef;


    try {
        # grammars/Lavanda2.g:51:2: ( tipo NUM )
        # grammars/Lavanda2.g:51:4: tipo NUM
        {
         $self->push_follow($FOLLOW_tipo_in_lote184);
         $tipo7 = $self->tipo();

         $self->state->_fsp($self->state->_fsp - 1);

         $NUM6 = $self->match($self->input, NUM, $FOLLOW_NUM_in_lote186);


         $retval->{custoTotal} = $NUM6->get_text();
         if(!defined $inEnv->{$tipo7}) { $inEnv->{$tipo7} = 0 }
         $inEnv->{$tipo7}++;
         $retval->{outEnv} = $inEnv; 

        }

        $retval->stop($self->input->LT(-1));

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
    return $retval;
}
# $ANTLR end "lote"


# $ANTLR start "tipo"
# grammars/Lavanda2.g:58:1: tipo returns [ $name ] : classe '-' tinto '-' fio ;
sub tipo {
    my ($self) = @_;
    my $name = undef;

    my $classe8 = undef;

    my $tinto9 = undef;

    my $fio10 = undef;


    try {
        # grammars/Lavanda2.g:59:2: ( classe '-' tinto '-' fio )
        # grammars/Lavanda2.g:59:4: classe '-' tinto '-' fio
        {
         $self->push_follow($FOLLOW_classe_in_tipo204);
         $classe8 = $self->classe();

         $self->state->_fsp($self->state->_fsp - 1);

          $self->match($self->input, 13, $FOLLOW_13_in_tipo206);

         $self->push_follow($FOLLOW_tinto_in_tipo208);
         $tinto9 = $self->tinto();

         $self->state->_fsp($self->state->_fsp - 1);

          $self->match($self->input, 13, $FOLLOW_13_in_tipo210);

         $self->push_follow($FOLLOW_fio_in_tipo212);
         $fio10 = $self->fio();

         $self->state->_fsp($self->state->_fsp - 1);

          $name = $classe8 . '-' . $tinto9 . '-' . $fio10; 

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
    return $name;
}
# $ANTLR end "tipo"


# $ANTLR start "classe"
# grammars/Lavanda2.g:62:1: classe returns [ $name ] : ( 'corpo' | 'casa' );
sub classe {
    my ($self) = @_;
    my $name = undef;

    try {
        # grammars/Lavanda2.g:63:2: ( 'corpo' | 'casa' )
        my $alt3 = 2;
        my $LA3_0 = $self->input->LA(1);

        if ( ($LA3_0 eq 14) ) {
            $alt3 = 1;
        }
        elsif ( ($LA3_0 eq 15) ) {
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
                # grammars/Lavanda2.g:63:4: 'corpo'
                {
                  $self->match($self->input, 14, $FOLLOW_14_in_classe230);

                  $name = 'corpo'; 

                }
            }
            when (2) {
                # grammars/Lavanda2.g:64:4: 'casa'
                {
                  $self->match($self->input, 15, $FOLLOW_15_in_classe237);

                  $name = 'casa';  

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
    return $name;
}
# $ANTLR end "classe"


# $ANTLR start "tinto"
# grammars/Lavanda2.g:67:1: tinto returns [ $name ] : ( 'br' | 'cor' );
sub tinto {
    my ($self) = @_;
    my $name = undef;

    try {
        # grammars/Lavanda2.g:68:2: ( 'br' | 'cor' )
        my $alt4 = 2;
        my $LA4_0 = $self->input->LA(1);

        if ( ($LA4_0 eq 16) ) {
            $alt4 = 1;
        }
        elsif ( ($LA4_0 eq 17) ) {
            $alt4 = 2;
        }
        else {
            my $nvae =
        		ANTLR::Runtime::NoViableAltException->new({
                    grammar_decision_description => "",
                    decision_number => 4,
                    state_number => 0,
                    input => $self->input,
                });

            $nvae->throw();
        }
        given ($alt4) {
            when (1) {
                # grammars/Lavanda2.g:68:4: 'br'
                {
                  $self->match($self->input, 16, $FOLLOW_16_in_tinto255);

                  $name = 'br';  

                }
            }
            when (2) {
                # grammars/Lavanda2.g:69:4: 'cor'
                {
                  $self->match($self->input, 17, $FOLLOW_17_in_tinto264);

                  $name = 'cor'; 

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
    return $name;
}
# $ANTLR end "tinto"


# $ANTLR start "fio"
# grammars/Lavanda2.g:72:1: fio returns [ $name ] : ( 'alg' | 'la' | 'fib' );
sub fio {
    my ($self) = @_;
    my $name = undef;

    try {
        # grammars/Lavanda2.g:73:2: ( 'alg' | 'la' | 'fib' )
        my $alt5 = 3;
        given ( $self->input->LA(1) ) {
            when ([18]) {
            	$alt5 = 1;
            }
            when ([19]) {
            	$alt5 = 2;
            }
            when ([20]) {
            	$alt5 = 3;
            }
            dafault {
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
                # grammars/Lavanda2.g:73:4: 'alg'
                {
                  $self->match($self->input, 18, $FOLLOW_18_in_fio283);

                  $name = 'alg'; 

                }
            }
            when (2) {
                # grammars/Lavanda2.g:74:4: 'la'
                {
                  $self->match($self->input, 19, $FOLLOW_19_in_fio291);

                  $name = 'la';  

                }
            }
            when (3) {
                # grammars/Lavanda2.g:75:4: 'fib'
                {
                  $self->match($self->input, 20, $FOLLOW_20_in_fio300);

                  $name = 'fib'; 

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
    return $name;
}
# $ANTLR end "fio"



sub init_dfas {
    my ($self) = @_;


    return;
}

 


no Moose;
__PACKAGE__->meta->make_immutable();
1;