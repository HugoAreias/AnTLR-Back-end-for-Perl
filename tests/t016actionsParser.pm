# $ANTLR 3.2 Aug 03, 2010 13:12:17 grammars/t016actions.g 2011-02-04 03:49:35
package t016actionsParser;

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
    "<invalid>", "<EOR>", "<DOWN>", "<UP>", "ID", "WS", "';'", "'int'", "'char'", "'void'"
] );
use constant {
	T__7 => 7,
	T__8 => 8,
	WS => 5,
	EOF => -1,
	T__9 => 9,
	T__6 => 6,
	ID => 4,
};

dlock( my $FOLLOW_functionHeader_in_declaration35 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000040' ] }) );
dlock( my $FOLLOW_6_in_declaration37 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000382' ] }) );
dlock( my $FOLLOW_type_in_functionHeader64 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000010' ] }) );
dlock( my $FOLLOW_ID_in_functionHeader66 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );
dlock( my $FOLLOW_set_in_type0 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );



sub BUILD {
    my ($self, $arg_ref) = @_;

    $self->init_dfas();

	return;
}

sub get_token_names {
    return $token_names;
}

sub get_grammar_file_name {
    return 'grammars/t016actions.g';
}



# $ANTLR start "declaration"
# grammars/t016actions.g:6:1: declaration returns [$name =[]] : ( functionHeader ';' )+ ;
sub declaration {
    my ($self) = @_;
    my $name = [];

    my $functionHeader1 = undef;


    try {
        # grammars/t016actions.g:7:5: ( ( functionHeader ';' )+ )
        # grammars/t016actions.g:7:9: ( functionHeader ';' )+
        {
         # grammars/t016actions.g:7:9: ( functionHeader ';' )+
         my $cnt1 = 0;
         LOOP1:
         while (1) {
             my $alt1 = 2;
             my $LA1_0 = $self->input->LA(1);

             if ( (($LA1_0 ge 7 && $LA1_0 le 9)) ) {
                 $alt1 = 1;
             }


             given ($alt1) {
         	    when (1) {
         	        # grammars/t016actions.g:7:11: functionHeader ';'
         	        {
         	         $self->push_follow($FOLLOW_functionHeader_in_declaration35);
         	         $functionHeader1 = $self->functionHeader();

         	         $self->state->_fsp($self->state->_fsp - 1);

         	          $self->match($self->input, 6, $FOLLOW_6_in_declaration37);

         	         push @{$name},$functionHeader1;

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
    return $name;
}
# $ANTLR end "declaration"


# $ANTLR start "functionHeader"
# grammars/t016actions.g:10:1: functionHeader returns [$name] : type ID ;
sub functionHeader {
    my ($self) = @_;
    my $name = undef;

    my $ID2 = undef;

    try {
        # grammars/t016actions.g:11:5: ( type ID )
        # grammars/t016actions.g:11:9: type ID
        {
         $self->push_follow($FOLLOW_type_in_functionHeader64);
         $self->type();

         $self->state->_fsp($self->state->_fsp - 1);

         $ID2 = $self->match($self->input, ID, $FOLLOW_ID_in_functionHeader66);

         $name = $ID2->get_text();

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
# $ANTLR end "functionHeader"


# $ANTLR start "type"
# grammars/t016actions.g:15:1: type : ( 'int' | 'char' | 'void' );
sub type {
    my ($self) = @_;
    try {
        # grammars/t016actions.g:16:5: ( 'int' | 'char' | 'void' )
        # grammars/t016actions.g:
        {
         if ( ($self->input->LA(1) ge 7 && $self->input->LA(1) le 9) ) {
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



sub init_dfas {
    my ($self) = @_;


    return;
}

 


no Moose;
__PACKAGE__->meta->make_immutable();
1;