# $ANTLR 3.2 Aug 03, 2010 13:12:17 grammars/t013parser.g 2010-12-22 00:16:16
package t013parserParser;

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
    "<invalid>", "<EOR>", "<DOWN>", "<UP>", "IDENTIFIER"
] );
use constant {
	IDENTIFIER => 4,
	EOF => -1,
};

dlock( my $FOLLOW_IDENTIFIER_in_document41 = ANTLR::Runtime::BitSet->new({ words64 => [ '0x0000000000000002' ] }) );



sub BUILD {
    my ($self, $arg_ref) = @_;

}
sub get_token_names {
    return $token_names;
}

sub get_grammar_file_name {
    return 'grammars/t013parser.g';
}



# has 'identifier' => ( is => 'rw', isa => 'ArrayRef[Str]', default => sub{ [] } );
# has 'reported_errors' => ( is => 'rw', isa => 'ArrayRef[Str]', default => sub{ [] } );

my $identifier = [];
my $reported_errors = [];

sub found_identifier {
	my ($self,$name) = @_;
	push @{$identifier},$name;
	return;
}

sub emit_error_message {
	my ($self,$msg) = @_;
	push @{$reported_errors},$msg;
	return;
}

sub get_identifier {
	my ($self) = @_;
	return $identifier;
}

sub get_error_message {
	my ($self) = @_;
	return $reported_errors;
}




# $ANTLR start "document"
# grammars/t013parser.g:38:1: document : t= IDENTIFIER ;
sub document {
    my ($self) = @_;
    my $t = undef;

    try {
        # grammars/t013parser.g:38:9: (t= IDENTIFIER )
        # grammars/t013parser.g:39:9: t= IDENTIFIER
        {
         $t = $self->match($self->input, IDENTIFIER, $FOLLOW_IDENTIFIER_in_document41);

         $self->found_identifier($t->get_text())

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
# $ANTLR end "document"


 


no Moose;
__PACKAGE__->meta->make_immutable();
1;