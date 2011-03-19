# $ANTLR 3.2 Aug 03, 2010 13:12:17 grammars/t017parser.g 2011-02-04 04:50:48
package t017parserParser;

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
    "<invalid>", "<EOR>", "<DOWN>", "<UP>", "ID", "INT", "WS", "';'", "'('", "','", "')'", "'int'", "'char'", "'void'", "'{'", "'}'", "'for'", "'='", "'=='", "'<'", "'+'"
] );
use constant {
	T__12 => 12,
	T__20 => 20,
	WS => 6,
	T__13 => 13,
	T__19 => 19,
	T__9 => 9,
	T__14 => 14,
	T__11 => 11,
	T__7 => 7,
	T__17 => 17,
	INT => 5,
	T__8 => 8,
	EOF => -1,
	T__16 => 16,
	T__10 => 10,
	T__18 => 18,
	T__15 => 15,
	ID => 4,
};

dlock( my $FOLLOW_declaration_in_program32 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000003812' ] }) );
dlock( my $FOLLOW_variable_in_declaration52 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_functionHeader_in_declaration62 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000080' ] }) );
dlock( my $FOLLOW_7_in_declaration64 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_functionHeader_in_declaration74 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000004000' ] }) );
dlock( my $FOLLOW_block_in_declaration76 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_type_in_variable95 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000010' ] }) );
dlock( my $FOLLOW_declarator_in_variable97 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000080' ] }) );
dlock( my $FOLLOW_7_in_variable99 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_ID_in_declarator118 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_type_in_functionHeader139 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000010' ] }) );
dlock( my $FOLLOW_ID_in_functionHeader141 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000100' ] }) );
dlock( my $FOLLOW_8_in_functionHeader143 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000003C10' ] }) );
dlock( my $FOLLOW_formalParameter_in_functionHeader147 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000600' ] }) );
dlock( my $FOLLOW_9_in_functionHeader151 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000003810' ] }) );
dlock( my $FOLLOW_formalParameter_in_functionHeader153 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000600' ] }) );
dlock( my $FOLLOW_10_in_functionHeader161 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_type_in_formalParameter182 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000010' ] }) );
dlock( my $FOLLOW_declarator_in_formalParameter184 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_11_in_type203 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_12_in_type215 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_13_in_type227 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_ID_in_type239 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_14_in_block260 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x000000000001F9B0' ] }) );
dlock( my $FOLLOW_variable_in_block274 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x000000000001F9B0' ] }) );
dlock( my $FOLLOW_stat_in_block289 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x000000000001C1B0' ] }) );
dlock( my $FOLLOW_15_in_block300 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_forStat_in_stat312 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_expr_in_stat320 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000080' ] }) );
dlock( my $FOLLOW_7_in_stat322 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_block_in_stat336 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_assignStat_in_stat344 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000080' ] }) );
dlock( my $FOLLOW_7_in_stat346 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_7_in_stat354 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_16_in_forStat373 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000100' ] }) );
dlock( my $FOLLOW_8_in_forStat375 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000010' ] }) );
dlock( my $FOLLOW_assignStat_in_forStat377 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000080' ] }) );
dlock( my $FOLLOW_7_in_forStat379 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000130' ] }) );
dlock( my $FOLLOW_expr_in_forStat381 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000080' ] }) );
dlock( my $FOLLOW_7_in_forStat383 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000010' ] }) );
dlock( my $FOLLOW_assignStat_in_forStat385 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000400' ] }) );
dlock( my $FOLLOW_10_in_forStat387 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000004000' ] }) );
dlock( my $FOLLOW_block_in_forStat389 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_ID_in_assignStat410 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000020000' ] }) );
dlock( my $FOLLOW_17_in_assignStat412 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000130' ] }) );
dlock( my $FOLLOW_expr_in_assignStat414 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_condExpr_in_expr430 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_aexpr_in_condExpr449 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x00000000000C0002' ] }) );
dlock( my $FOLLOW_set_in_condExpr453 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000130' ] }) );
dlock( my $FOLLOW_aexpr_in_condExpr461 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_atom_in_aexpr483 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000100002' ] }) );
dlock( my $FOLLOW_20_in_aexpr487 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000130' ] }) );
dlock( my $FOLLOW_atom_in_aexpr489 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000100002' ] }) );
dlock( my $FOLLOW_ID_in_atom509 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_INT_in_atom519 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_8_in_atom529 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000130' ] }) );
dlock( my $FOLLOW_expr_in_atom531 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000400' ] }) );
dlock( my $FOLLOW_10_in_atom533 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );



sub BUILD {
    my ($self, $arg_ref) = @_;

    $self->init_dfas();

	return;
}

sub get_token_names {
    return $token_names;
}

sub get_grammar_file_name {
    return 'grammars/t017parser.g';
}



# $ANTLR start "program"
# grammars/t017parser.g:7:1: program : ( declaration )+ ;
sub program {
    my ($self) = @_;
    try {
        # grammars/t017parser.g:8:5: ( ( declaration )+ )
        # grammars/t017parser.g:8:9: ( declaration )+
        {
         # grammars/t017parser.g:8:9: ( declaration )+
         my $cnt1 = 0;
         LOOP1:
         while (1) {
             my $alt1 = 2;
             my $LA1_0 = $self->input->LA(1);

             if ( ($LA1_0 eq ID || ($LA1_0 ge 11 && $LA1_0 le 13)) ) {
                 $alt1 = 1;
             }


             given ($alt1) {
         	    when (1) {
         	        # grammars/t017parser.g:8:9: declaration
         	        {
         	         $self->push_follow($FOLLOW_declaration_in_program32);
         	         $self->declaration();

         	         $self->state->_fsp($self->state->_fsp - 1);


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
# $ANTLR end "program"


# $ANTLR start "declaration"
# grammars/t017parser.g:11:1: declaration : ( variable | functionHeader ';' | functionHeader block );
sub declaration {
    my ($self) = @_;
    try {
        # grammars/t017parser.g:12:5: ( variable | functionHeader ';' | functionHeader block )
        my $alt2 = 3;
        $alt2 = $self->dfa2->predict($self->input);
        given ($alt2) {
            when (1) {
                # grammars/t017parser.g:12:9: variable
                {
                 $self->push_follow($FOLLOW_variable_in_declaration52);
                 $self->variable();

                 $self->state->_fsp($self->state->_fsp - 1);


                }
            }
            when (2) {
                # grammars/t017parser.g:13:9: functionHeader ';'
                {
                 $self->push_follow($FOLLOW_functionHeader_in_declaration62);
                 $self->functionHeader();

                 $self->state->_fsp($self->state->_fsp - 1);

                  $self->match($self->input, 7, $FOLLOW_7_in_declaration64);


                }
            }
            when (3) {
                # grammars/t017parser.g:14:9: functionHeader block
                {
                 $self->push_follow($FOLLOW_functionHeader_in_declaration74);
                 $self->functionHeader();

                 $self->state->_fsp($self->state->_fsp - 1);

                 $self->push_follow($FOLLOW_block_in_declaration76);
                 $self->block();

                 $self->state->_fsp($self->state->_fsp - 1);


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
    return ;
}
# $ANTLR end "declaration"


# $ANTLR start "variable"
# grammars/t017parser.g:17:1: variable : type declarator ';' ;
sub variable {
    my ($self) = @_;
    try {
        # grammars/t017parser.g:18:5: ( type declarator ';' )
        # grammars/t017parser.g:18:9: type declarator ';'
        {
         $self->push_follow($FOLLOW_type_in_variable95);
         $self->type();

         $self->state->_fsp($self->state->_fsp - 1);

         $self->push_follow($FOLLOW_declarator_in_variable97);
         $self->declarator();

         $self->state->_fsp($self->state->_fsp - 1);

          $self->match($self->input, 7, $FOLLOW_7_in_variable99);


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
# $ANTLR end "variable"


# $ANTLR start "declarator"
# grammars/t017parser.g:21:1: declarator : ID ;
sub declarator {
    my ($self) = @_;
    my $ID1 = undef;

    try {
        # grammars/t017parser.g:22:5: ( ID )
        # grammars/t017parser.g:22:9: ID
        {
         $ID1 = $self->match($self->input, ID, $FOLLOW_ID_in_declarator118);

         print "Declarator: ",$ID1->get_text(),"\n";

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
# $ANTLR end "declarator"


# $ANTLR start "functionHeader"
# grammars/t017parser.g:25:1: functionHeader : type ID '(' ( formalParameter ( ',' formalParameter )* )? ')' ;
sub functionHeader {
    my ($self) = @_;
    my $ID2 = undef;

    try {
        # grammars/t017parser.g:26:5: ( type ID '(' ( formalParameter ( ',' formalParameter )* )? ')' )
        # grammars/t017parser.g:26:9: type ID '(' ( formalParameter ( ',' formalParameter )* )? ')'
        {
         $self->push_follow($FOLLOW_type_in_functionHeader139);
         $self->type();

         $self->state->_fsp($self->state->_fsp - 1);

         $ID2 = $self->match($self->input, ID, $FOLLOW_ID_in_functionHeader141);

          $self->match($self->input, 8, $FOLLOW_8_in_functionHeader143);

         # grammars/t017parser.g:26:21: ( formalParameter ( ',' formalParameter )* )?
         my $alt4 = 2;
         my $LA4_0 = $self->input->LA(1);

         if ( ($LA4_0 eq ID || ($LA4_0 ge 11 && $LA4_0 le 13)) ) {
             $alt4 = 1;
         }
         given ($alt4) {
             when (1) {
                 # grammars/t017parser.g:26:23: formalParameter ( ',' formalParameter )*
                 {
                  $self->push_follow($FOLLOW_formalParameter_in_functionHeader147);
                  $self->formalParameter();

                  $self->state->_fsp($self->state->_fsp - 1);

                  # grammars/t017parser.g:26:39: ( ',' formalParameter )*
                  LOOP3:
                  while (1) {
                      my $alt3 = 2;
                      my $LA3_0 = $self->input->LA(1);

                      if ( ($LA3_0 eq 9) ) {
                          $alt3 = 1;
                      }


                      given ($alt3) {
                  	    when (1) {
                  	        # grammars/t017parser.g:26:41: ',' formalParameter
                  	        {
                  	          $self->match($self->input, 9, $FOLLOW_9_in_functionHeader151);

                  	         $self->push_follow($FOLLOW_formalParameter_in_functionHeader153);
                  	         $self->formalParameter();

                  	         $self->state->_fsp($self->state->_fsp - 1);


                  	        }
                  	    }

                  	    default { last LOOP3; }
                      }
                  }


                 }
             }

         }

          $self->match($self->input, 10, $FOLLOW_10_in_functionHeader161);

         print "Function Header: ",$ID2->get_text(),"\n";

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
# $ANTLR end "functionHeader"


# $ANTLR start "formalParameter"
# grammars/t017parser.g:29:1: formalParameter : type declarator ;
sub formalParameter {
    my ($self) = @_;
    try {
        # grammars/t017parser.g:30:5: ( type declarator )
        # grammars/t017parser.g:30:9: type declarator
        {
         $self->push_follow($FOLLOW_type_in_formalParameter182);
         $self->type();

         $self->state->_fsp($self->state->_fsp - 1);

         $self->push_follow($FOLLOW_declarator_in_formalParameter184);
         $self->declarator();

         $self->state->_fsp($self->state->_fsp - 1);


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
# $ANTLR end "formalParameter"


# $ANTLR start "type"
# grammars/t017parser.g:33:1: type : ( 'int' | 'char' | 'void' | ID );
sub type {
    my ($self) = @_;
    my $ID3 = undef;

    try {
        # grammars/t017parser.g:34:5: ( 'int' | 'char' | 'void' | ID )
        my $alt5 = 4;
        given ( $self->input->LA(1) ) {
            when ([11]) {
            	$alt5 = 1;
            }
            when ([12]) {
            	$alt5 = 2;
            }
            when ([13]) {
            	$alt5 = 3;
            }
            when ([ID]) {
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
                # grammars/t017parser.g:34:9: 'int'
                {
                  $self->match($self->input, 11, $FOLLOW_11_in_type203);

                 print "Type: int\n";

                }
            }
            when (2) {
                # grammars/t017parser.g:35:9: 'char'
                {
                  $self->match($self->input, 12, $FOLLOW_12_in_type215);

                 print "Type: char\n";

                }
            }
            when (3) {
                # grammars/t017parser.g:36:9: 'void'
                {
                  $self->match($self->input, 13, $FOLLOW_13_in_type227);

                 print "Type: void\n";

                }
            }
            when (4) {
                # grammars/t017parser.g:37:9: ID
                {
                 $ID3 = $self->match($self->input, ID, $FOLLOW_ID_in_type239);

                 print "Type: ",$ID3->get_text(),"\n";

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
    return ;
}
# $ANTLR end "type"


# $ANTLR start "block"
# grammars/t017parser.g:40:1: block : '{' ( variable )* ( stat )* '}' ;
sub block {
    my ($self) = @_;
    try {
        # grammars/t017parser.g:41:5: ( '{' ( variable )* ( stat )* '}' )
        # grammars/t017parser.g:41:9: '{' ( variable )* ( stat )* '}'
        {
          $self->match($self->input, 14, $FOLLOW_14_in_block260);

         # grammars/t017parser.g:42:13: ( variable )*
         LOOP6:
         while (1) {
             my $alt6 = 2;
             my $LA6_0 = $self->input->LA(1);

             if ( ($LA6_0 eq ID) ) {
                 my $LA6_2 = $self->input->LA(2);

                 if ( ($LA6_2 eq ID) ) {
                     $alt6 = 1;
                 }


             }
             elsif ( (($LA6_0 ge 11 && $LA6_0 le 13)) ) {
                 $alt6 = 1;
             }


             given ($alt6) {
         	    when (1) {
         	        # grammars/t017parser.g:42:13: variable
         	        {
         	         $self->push_follow($FOLLOW_variable_in_block274);
         	         $self->variable();

         	         $self->state->_fsp($self->state->_fsp - 1);


         	        }
         	    }

         	    default { last LOOP6; }
             }
         }

         # grammars/t017parser.g:43:13: ( stat )*
         LOOP7:
         while (1) {
             my $alt7 = 2;
             my $LA7_0 = $self->input->LA(1);

             if ( (($LA7_0 ge ID && $LA7_0 le INT) || ($LA7_0 ge 7 && $LA7_0 le 8) || $LA7_0 eq 14 || $LA7_0 eq 16) ) {
                 $alt7 = 1;
             }


             given ($alt7) {
         	    when (1) {
         	        # grammars/t017parser.g:43:13: stat
         	        {
         	         $self->push_follow($FOLLOW_stat_in_block289);
         	         $self->stat();

         	         $self->state->_fsp($self->state->_fsp - 1);


         	        }
         	    }

         	    default { last LOOP7; }
             }
         }

          $self->match($self->input, 15, $FOLLOW_15_in_block300);


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
# $ANTLR end "block"


# $ANTLR start "stat"
# grammars/t017parser.g:47:1: stat : ( forStat | expr ';' | block | assignStat ';' | ';' );
sub stat {
    my ($self) = @_;
    try {
        # grammars/t017parser.g:47:5: ( forStat | expr ';' | block | assignStat ';' | ';' )
        my $alt8 = 5;
        given ( $self->input->LA(1) ) {
            when ([16]) {
            	$alt8 = 1;
            }
            when ([ID]) {
            	my $LA8_2 = $self->input->LA(2);

            	if ( ($LA8_2 eq 17) ) {
            	    $alt8 = 4;
            	}
            	elsif ( ($LA8_2 eq 7 || ($LA8_2 ge 18 && $LA8_2 le 20)) ) {
            	    $alt8 = 2;
            	}
            	else {
            	    my $nvae =
            			ANTLR::Runtime::NoViableAltException->new({
            	            grammar_decision_description => "",
            	            decision_number => 8,
            	            state_number => 2,
            	            input => $self->input,
            	        });

            	    $nvae->throw();
            	}
            }
            when ([INT, 8]) {
            	$alt8 = 2;
            }
            when ([14]) {
            	$alt8 = 3;
            }
            when ([7]) {
            	$alt8 = 5;
            }
            default {
                my $nvae =
        			ANTLR::Runtime::NoViableAltException->new({
                        grammar_decision_description => "",
                        decision_number => 8,
                        state_number => 0,
                        input => $self->input,
                    });

                $nvae->throw();

            }
        }

        given ($alt8) {
            when (1) {
                # grammars/t017parser.g:47:7: forStat
                {
                 $self->push_follow($FOLLOW_forStat_in_stat312);
                 $self->forStat();

                 $self->state->_fsp($self->state->_fsp - 1);


                }
            }
            when (2) {
                # grammars/t017parser.g:48:7: expr ';'
                {
                 $self->push_follow($FOLLOW_expr_in_stat320);
                 $self->expr();

                 $self->state->_fsp($self->state->_fsp - 1);

                  $self->match($self->input, 7, $FOLLOW_7_in_stat322);


                }
            }
            when (3) {
                # grammars/t017parser.g:49:7: block
                {
                 $self->push_follow($FOLLOW_block_in_stat336);
                 $self->block();

                 $self->state->_fsp($self->state->_fsp - 1);


                }
            }
            when (4) {
                # grammars/t017parser.g:50:7: assignStat ';'
                {
                 $self->push_follow($FOLLOW_assignStat_in_stat344);
                 $self->assignStat();

                 $self->state->_fsp($self->state->_fsp - 1);

                  $self->match($self->input, 7, $FOLLOW_7_in_stat346);


                }
            }
            when (5) {
                # grammars/t017parser.g:51:7: ';'
                {
                  $self->match($self->input, 7, $FOLLOW_7_in_stat354);


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
    return ;
}
# $ANTLR end "stat"


# $ANTLR start "forStat"
# grammars/t017parser.g:54:1: forStat : 'for' '(' assignStat ';' expr ';' assignStat ')' block ;
sub forStat {
    my ($self) = @_;
    try {
        # grammars/t017parser.g:55:5: ( 'for' '(' assignStat ';' expr ';' assignStat ')' block )
        # grammars/t017parser.g:55:9: 'for' '(' assignStat ';' expr ';' assignStat ')' block
        {
          $self->match($self->input, 16, $FOLLOW_16_in_forStat373);

          $self->match($self->input, 8, $FOLLOW_8_in_forStat375);

         $self->push_follow($FOLLOW_assignStat_in_forStat377);
         $self->assignStat();

         $self->state->_fsp($self->state->_fsp - 1);

          $self->match($self->input, 7, $FOLLOW_7_in_forStat379);

         $self->push_follow($FOLLOW_expr_in_forStat381);
         $self->expr();

         $self->state->_fsp($self->state->_fsp - 1);

          $self->match($self->input, 7, $FOLLOW_7_in_forStat383);

         $self->push_follow($FOLLOW_assignStat_in_forStat385);
         $self->assignStat();

         $self->state->_fsp($self->state->_fsp - 1);

          $self->match($self->input, 10, $FOLLOW_10_in_forStat387);

         $self->push_follow($FOLLOW_block_in_forStat389);
         $self->block();

         $self->state->_fsp($self->state->_fsp - 1);

         print "For Loop\n";

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
# $ANTLR end "forStat"


# $ANTLR start "assignStat"
# grammars/t017parser.g:58:1: assignStat : ID '=' expr ;
sub assignStat {
    my ($self) = @_;
    my $ID4 = undef;

    try {
        # grammars/t017parser.g:59:5: ( ID '=' expr )
        # grammars/t017parser.g:59:9: ID '=' expr
        {
         $ID4 = $self->match($self->input, ID, $FOLLOW_ID_in_assignStat410);

          $self->match($self->input, 17, $FOLLOW_17_in_assignStat412);

         $self->push_follow($FOLLOW_expr_in_assignStat414);
         $self->expr();

         $self->state->_fsp($self->state->_fsp - 1);

         print "Variable: ",$ID4->get_text(),"\n";

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
# $ANTLR end "assignStat"


# $ANTLR start "expr"
# grammars/t017parser.g:62:1: expr : condExpr ;
sub expr {
    my ($self) = @_;
    try {
        # grammars/t017parser.g:62:5: ( condExpr )
        # grammars/t017parser.g:62:9: condExpr
        {
         $self->push_follow($FOLLOW_condExpr_in_expr430);
         $self->condExpr();

         $self->state->_fsp($self->state->_fsp - 1);


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
# $ANTLR end "expr"


# $ANTLR start "condExpr"
# grammars/t017parser.g:65:1: condExpr : aexpr ( ( '==' | '<' ) aexpr )? ;
sub condExpr {
    my ($self) = @_;
    try {
        # grammars/t017parser.g:66:5: ( aexpr ( ( '==' | '<' ) aexpr )? )
        # grammars/t017parser.g:66:9: aexpr ( ( '==' | '<' ) aexpr )?
        {
         $self->push_follow($FOLLOW_aexpr_in_condExpr449);
         $self->aexpr();

         $self->state->_fsp($self->state->_fsp - 1);

         # grammars/t017parser.g:66:15: ( ( '==' | '<' ) aexpr )?
         my $alt9 = 2;
         my $LA9_0 = $self->input->LA(1);

         if ( (($LA9_0 ge 18 && $LA9_0 le 19)) ) {
             $alt9 = 1;
         }
         given ($alt9) {
             when (1) {
                 # grammars/t017parser.g:66:17: ( '==' | '<' ) aexpr
                 {
                  if ( ($self->input->LA(1) ge 18 && $self->input->LA(1) le 19) ) {
                      $self->input->consume();
                      $self->state->error_recovery(0);
                  }
                  else {
                      my $mse =
                  		ANTLR::Runtime::MismatchedSetException->new({
                  			expecting => undef,
                  			input => $self->input,
                  		});
                      $mse->throw();
                  }

                  $self->push_follow($FOLLOW_aexpr_in_condExpr461);
                  $self->aexpr();

                  $self->state->_fsp($self->state->_fsp - 1);


                 }
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
    return ;
}
# $ANTLR end "condExpr"


# $ANTLR start "aexpr"
# grammars/t017parser.g:69:1: aexpr : atom ( '+' atom )* ;
sub aexpr {
    my ($self) = @_;
    try {
        # grammars/t017parser.g:70:5: ( atom ( '+' atom )* )
        # grammars/t017parser.g:70:9: atom ( '+' atom )*
        {
         $self->push_follow($FOLLOW_atom_in_aexpr483);
         $self->atom();

         $self->state->_fsp($self->state->_fsp - 1);

         # grammars/t017parser.g:70:14: ( '+' atom )*
         LOOP10:
         while (1) {
             my $alt10 = 2;
             my $LA10_0 = $self->input->LA(1);

             if ( ($LA10_0 eq 20) ) {
                 $alt10 = 1;
             }


             given ($alt10) {
         	    when (1) {
         	        # grammars/t017parser.g:70:16: '+' atom
         	        {
         	          $self->match($self->input, 20, $FOLLOW_20_in_aexpr487);

         	         $self->push_follow($FOLLOW_atom_in_aexpr489);
         	         $self->atom();

         	         $self->state->_fsp($self->state->_fsp - 1);


         	        }
         	    }

         	    default { last LOOP10; }
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
    return ;
}
# $ANTLR end "aexpr"


# $ANTLR start "atom"
# grammars/t017parser.g:73:1: atom : ( ID | INT | '(' expr ')' );
sub atom {
    my ($self) = @_;
    my $ID5 = undef;
    my $INT6 = undef;

    try {
        # grammars/t017parser.g:74:5: ( ID | INT | '(' expr ')' )
        my $alt11 = 3;
        given ( $self->input->LA(1) ) {
            when ([ID]) {
            	$alt11 = 1;
            }
            when ([INT]) {
            	$alt11 = 2;
            }
            when ([8]) {
            	$alt11 = 3;
            }
            default {
                my $nvae =
        			ANTLR::Runtime::NoViableAltException->new({
                        grammar_decision_description => "",
                        decision_number => 11,
                        state_number => 0,
                        input => $self->input,
                    });

                $nvae->throw();

            }
        }

        given ($alt11) {
            when (1) {
                # grammars/t017parser.g:74:7: ID
                {
                 $ID5 = $self->match($self->input, ID, $FOLLOW_ID_in_atom509);

                 print 'ID: ',$ID5->get_text(),"\n";

                }
            }
            when (2) {
                # grammars/t017parser.g:75:7: INT
                {
                 $INT6 = $self->match($self->input, INT, $FOLLOW_INT_in_atom519);

                 print 'INT: ',$INT6->get_text(),"\n";

                }
            }
            when (3) {
                # grammars/t017parser.g:76:7: '(' expr ')'
                {
                  $self->match($self->input, 8, $FOLLOW_8_in_atom529);

                 $self->push_follow($FOLLOW_expr_in_atom531);
                 $self->expr();

                 $self->state->_fsp($self->state->_fsp - 1);

                  $self->match($self->input, 10, $FOLLOW_10_in_atom533);


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
    return ;
}
# $ANTLR end "atom"


has 'dfa2' => ( is => 'rw' );

sub init_dfas {
    my ($self) = @_;

    $self->dfa2(t017parserParser::DFA2->new( recognizer => $self ));

    return;
}


dlock( my $DFA2_eot = ANTLR::Runtime::DFA->unpack_encoded_string('\u{22}'.
    '\u{65535}') );
dlock( my $DFA2_eof = ANTLR::Runtime::DFA->unpack_encoded_string('\u{22}'.
    '\u{65535}') );
dlock( my $DFA2_min = ANTLR::Runtime::DFA->unpack_encoded_string_to_unsigned_chars(''.
    '\u{5}\u{4}\u{1}\u{7}\u{1}\u{4}\u{1}\u{65535}\u{4}\u{4}\u{1}\u{7}\u{1}'.
    '\u{9}\u{2}\u{65535}\u{5}\u{4}\u{1}\u{9}') );
dlock( my $DFA2_max = ANTLR::Runtime::DFA->unpack_encoded_string_to_unsigned_chars(''.
    '\u{1}\u{13}\u{4}\u{4}\u{1}\u{8}\u{1}\u{13}\u{1}\u{65535}\u{4}\u{4}\u{1}'.
    '\u{14}\u{1}\u{10}\u{2}\u{65535}\u{1}\u{13}\u{4}\u{4}\u{1}\u{10}') );
dlock( my $DFA2_accept = ANTLR::Runtime::DFA->unpack_encoded_string('\u{7}'.
    '\u{65535}\u{1}\u{1}\u{6}\u{65535}\u{1}\u{3}\u{1}\u{2}\u{6}\u{65535}') );
dlock( my $DFA2_special = ANTLR::Runtime::DFA->unpack_encoded_string('\u{22}'.
    '\u{65535}') );
dlock( my $DFA2_transition = [
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{4}\u{6}\u{65535}\u{1}'.
	'\u{1}\u{1}\u{2}\u{1}\u{3}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{5}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{5}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{5}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{5}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{7}\u{1}\u{6}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{11}\u{5}\u{65535}\u{1}'.
	'\u{12}\u{1}\u{8}\u{1}\u{9}\u{1}\u{10}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{13}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{13}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{13}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{13}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{15}\u{6}\u{65535}\u{1}'.
	'\u{14}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{16}\u{1}\u{12}'),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string(''),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{20}\u{6}\u{65535}\u{1}'.
	'\u{17}\u{1}\u{18}\u{1}\u{19}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{21}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{21}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{21}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{21}'),
	ANTLR::Runtime::DFA->unpack_encoded_string('\u{1}\u{16}\u{1}\u{12}')
] );

{
package t017parserParser::DFA2;
# use ANTLR::Runtime::Class;

use Moose;

extends 'ANTLR::Runtime::DFA';

sub BUILD {
    my ($self,$param_ref) = @_;

    $self->recognizer($param_ref->{recognizer});
    $self->decision_number(2);
    $self->eot($DFA2_eot);
    $self->eof($DFA2_eof);
    $self->min($DFA2_min);
    $self->max($DFA2_max);
    $self->accept($DFA2_accept);
    $self->special($DFA2_special);
    $self->transition($DFA2_transition);

	return;
}

sub get_description {
    return "11:1: declaration : ( variable | functionHeader ';' | functionHeader block );";
}


}
 


no Moose;
__PACKAGE__->meta->make_immutable();
1;