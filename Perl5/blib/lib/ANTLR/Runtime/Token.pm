package ANTLR::Runtime::Token;

use Data::Lock qw( dlock );

use feature qw( state );

use ANTLR::Runtime::CharStream;
# use ANTLR::Runtime::CommonToken;

use Moose::Role;

dlock( my $EOR_TOKEN_TYPE = '1' );
sub EOR_TOKEN_TYPE { return $EOR_TOKEN_TYPE }

# imaginary tree navigation type; traverse "get child" link
dlock( my $DOWN = '2' );
sub DOWN { return $DOWN }

# imaginary tree navigation type; finish with a child list
dlock( my $UP = '3' );
sub UP { return $UP }

dlock( my $MIN_TOKEN_TYPE = $UP + 1 );
sub MIN_TOKEN_TYPE { return $MIN_TOKEN_TYPE }

# All tokens go to the parser (unless skip() is called in that rule)
# on a particular "channel".  The parser tunes to a particular channel
# so that whitespace etc... can go to the parser on a "hidden" channel.
dlock( my $DEFAULT_CHANNEL = '0' );
sub DEFAULT_CHANNEL { return $DEFAULT_CHANNEL }

# Anything on different channel than DEFAULT_CHANNEL is not parsed
# by parser.
dlock( my $HIDDEN_CHANNEL = '99' );
sub HIDDEN_CHANNEL { return $HIDDEN_CHANNEL }

sub EOF { return ANTLR::Runtime::CharStream->EOF }

#Readonly my $EOF_TOKEN => ANTLR::Runtime::CommonToken->new({ type => EOF });
sub EOF_TOKEN {
    require ANTLR::Runtime::CommonToken;
    state $EOF_TOKEN = ANTLR::Runtime::CommonToken->new({ type => EOF() });
    return $EOF_TOKEN;
}

dlock( my $INVALID_TOKEN_TYPE = '0' );
sub INVALID_TOKEN_TYPE { return $INVALID_TOKEN_TYPE }

#Readonly my $INVALID_TOKEN => ANTLR::Runtime::CommonToken->new({ type => INVALID_TOKEN_TYPE });
sub INVALID_TOKEN {
    require ANTLR::Runtime::CommonToken;
    state $INVALID_TOKEN = ANTLR::Runtime::CommonToken->new({ type => INVALID_TOKEN_TYPE() });
    return $INVALID_TOKEN;
}

# In an action, a lexer rule can set token to this SKIP_TOKEN and ANTLR
# will avoid creating a token for this symbol and try to fetch another.
#Readonly my $SKIP_TOKEN => ANTLR::Runtime::CommonToken->new({ type => INVALID_TOKEN_TYPE });
sub SKIP_TOKEN {
    require ANTLR::Runtime::CommonToken;
    state $SKIP_TOKEN = ANTLR::Runtime::CommonToken->new({ type => INVALID_TOKEN_TYPE() });
    return $SKIP_TOKEN;
}

# Get the text of the token
requires 'get_text', 'set_text';

requires 'get_type', 'set_type';

# The line number on which this token was matched; line=1..n
requires 'get_line', 'set_line';

# The index of the first character relative to the beginning of the line 0..n-1
requires 'get_char_position_in_line', 'set_char_position_in_line';

requires 'get_channel', 'set_channel';

# An index from 0..n-1 of the token object in the input stream.
# This must be valid in order to use the ANTLRWorks debugger.
requires 'get_token_index', 'set_token_index';

# From what character stream was this token created?  You don't have to
# implement but it's nice to know where a Token comes from if you have
# include files etc... on the input.
requires 'get_input_stream', 'set_input_stream';

no Moose::Role;
1;
__END__

=head1 NAME

ANTLR::Runtime::Token

=head1 DESCRIPTION