package ANTLR::Runtime::TokenStream;

use Moose::Role;
#extends 'ANTLR::Runtime::IntStream';

# Get Token at current input pointer + i ahead where i=1 is next Token.
# i<0 indicates tokens in the past.  So -1 is previous token and -2 is
# two tokens ago. LT(0) is undefined.  For i>=n, return Token.EOFToken.
# Return null for LT(0) and any index that results in an absolute address
# that is negative.
requires 'LT';

# Get a token at an absolute index i; 0..n-1.  This is really only
# needed for profiling and debugging and token stream rewriting.
# If you don't want to buffer up tokens, then this method makes no
# sense for you.  Naturally you can't use the rewrite stream feature.
# I believe DebugTokenStream can easily be altered to not use
# this method, removing the dependency.
requires 'get';

# Where is this stream pulling tokens from?  This is not the name, but
# the object that provides Token objects.
requires 'get_token_source';

requires 'to_string';

no Moose::Role;
1;
__END__

=head1 NAME

ANTLR::Runtime::TokenStream

=head1 DESCRIPTION

A stream of tokens accessing tokens from a TokenSource