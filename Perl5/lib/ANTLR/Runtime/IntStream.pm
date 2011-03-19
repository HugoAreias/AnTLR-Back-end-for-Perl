package ANTLR::Runtime::IntStream;

use Moose::Role;

requires 'consume';

# Get int at current input pointer + i ahead where i=1 is next int.
# Negative indexes are allowed.  LA(-1) is previous token (token
# just matched).  LA(-i) where i is before first token should
# yield -1, invalid char / EOF.
requires 'LA';

# Tell the stream to start buffering if it hasn't already.  Return
# current input position, index(), or some other marker so that
# when passed to rewind() you get back to the same spot.
# rewind(mark()) should not affect the input cursor.  The Lexer
# track line/col info as well as input index so its markers are
# not pure input indexes.  Same for tree node streams.
requires 'mark';

# Return the current input symbol index 0..n where n indicates the
# last symbol has been read.  The index is the symbol about to be
# read not the most recently read symbol.
requires 'index';

# Reset the stream so that next call to index would return marker.
# The marker will usually be index() but it doesn't have to be.  It's
# just a marker to indicate what state the stream was in.  This is
# essentially calling release() and seek().  If there are markers
# created after this marker argument, this routine must unroll them
# like a stack.  Assume the state the stream was in when this marker
# was created.
# &&
# Rewind to the input position of the last marker.
# Used currently only after a cyclic DFA and just
# before starting a sem/syn predicate to get the
# input position back to the start of the decision.
# Do not "pop" the marker off the state.  mark(i)
# and rewind(i) should balance still. It is
# like invoking rewind(last marker) but it should not "pop"
# the marker off.  It's like seek(last marker's input position).
requires 'rewind';

# You may want to commit to a backtrack but don't want to force the
# stream to keep bookkeeping objects around for a marker that is
# no longer necessary.  This will have the same behavior as
# rewind() except it releases resources without the backward seek.
# This must throw away resources for all markers back to the marker
# argument.  So if you're nested 5 levels of mark(), and then release(2)
# you have to release resources for depths 2..5.
requires 'release';

# Set the input cursor to the position indicated by index.  This is
# normally used to seek ahead in the input stream.  No buffering is
# required to do this unless you know your stream will use seek to
# move backwards such as when backtracking.
# 
# This is different from rewind in its multi-directional
# requirement and in that its argument is strictly an input cursor (index).
# 
# For char streams, seeking forward must update the stream state such
# as line number.  For seeking backwards, you will be presumably
# backtracking using the mark/rewind mechanism that restores state and
# so this method does not need to update state when seeking backwards.
# 
# Currently, this method is only used for efficient backtracking using
# memoization, but in the future it may be used for incremental parsing.
# 
# The index is 0..n-1.  A seek to position i means that LA(1) will
# return the ith symbol.  So, seeking to 0 means LA(1) will return the
# first element in the stream.
requires 'seek';

# Only makes sense for streams that buffer everything up probably, but
# might be useful to display the entire stream or for testing.  This
# value includes a single EOF.
requires 'size';

# Where are you getting symbols from?  Normally, implementations will
# pass the buck all the way to the lexer who can ask its input stream
# for the file name or whatever.
requires 'get_source_name';

no Moose::Role;
1;
__END__

=head1 NAME

ANTLR::Runtime::IntStream

=head1 DESCRIPTION

A simple stream of integers used when all I care about is the char
or token type sequence (such as interpretation).