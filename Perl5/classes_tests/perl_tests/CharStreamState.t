#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 8;

# Use Ok

BEGIN{ use_ok( 'ANTLR::Runtime::CharStreamState' ); }

# New Ok

my $stream = new_ok( 'ANTLR::Runtime::CharStreamState' );

# Accessors Ok

is( $stream->get_p(), 0, 'p is 0 (default)' );
is( $stream->get_line(), 0, 'line is 0 (default)' );
is( $stream->get_char_position_in_line(), 0, 'char position in line is 0 (default)' );

# Mutators

$stream->set_p(2);
$stream->set_line(10);
$stream->set_char_position_in_line(15);

# Accessing Previous Mutations Ok

is( $stream->get_p(), 2, 'p is 2' );
is( $stream->get_line(), 10, 'line is 10' );
is( $stream->get_char_position_in_line(), 15, 'char position in line is 15' );