package ANTLR::Runtime::CharStream;

use Carp;
use Data::Lock qw( dlock );

use Moose::Role;
#extends 'ANTLR::Runtime::IntStream';

dlock( my $EOF = '-1' );
sub EOF { return $EOF }

# For infinite streams, you don't need this; primarily I'm providing
# a useful interface for action code.  Just make sure actions don't
# use this on streams that don't support it.
requires 'substring';

# Get the ith character of lookahead.  This is the same usually as
# LA(i).  This will be used for labels in the generated lexer code.
requires 'LT';

# ANTLR tracks the line information automatically
# &&
# Because this stream can rewind, we need to be able to reset the line
requires 'get_line', 'set_line';

# The index of the character relative to the beginning of the line 0..n-1
requires 'get_char_position_in_line', 'set_char_position_in_line';

no Moose::Role;
1;

__END__

=head1 NAME

ANTLR::Runtime::CharStream

=head1 DESCRIPTION

A source of characters for an ANTLR lexer