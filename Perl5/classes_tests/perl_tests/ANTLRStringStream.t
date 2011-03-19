#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 41;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::CharStreamState' );
	use_ok( 'ANTLR::Runtime::ANTLRStringStream');
}

# New Ok

my $strstream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'this is input text' ] );

# Accessors Ok
is_deeply( $strstream->input, ['t','h','i','s',' ','i','s',' ','i','n','p','u','t',' ','t','e','x','t'], "Input is 'this is input text'" );
is( $strstream->index(), 0, 'p is 0 (default)' );
is( $strstream->get_line(), 1, 'line is 1 (default)' );
is( $strstream->get_char_position_in_line(), 0, 'char position in line is 0 (default)' );
is( $strstream->mark_depth, 0, 'mark depth is 0 (default)' );
is_deeply( $strstream->markers, [undef], 'markers is an undefined list (default)' );
is( $strstream->last_marker, 0, 'last marker is 0 (default)');
is( $strstream->get_source_name(), '', 'name is empty (default)');

# New Ok

my $stream = new_ok( 'ANTLR::Runtime::CharStreamState' );

# Mutators

$strstream->p(2);
$strstream->set_line(10);
$strstream->set_char_position_in_line(15);
$strstream->mark_depth(1);
$strstream->markers([$stream]);
$strstream->last_marker(1);
$strstream->name('charstream');

# Accessing Previous Mutations Ok

is( $strstream->index(), 2, 'p is 2' );
is( $strstream->get_line(), 10, 'line is 10' );
is( $strstream->get_char_position_in_line(), 15, 'char position in line is 15' );
is( $strstream->mark_depth, 1, 'mark depth is 1' );
is_deeply( $strstream->markers, [$stream], 'markers contains a char stream' );
is( $strstream->last_marker, 1, 'last marker is 1');
is( $strstream->get_source_name(), 'charstream', 'name is charstream');

# New Ok With New Construct

$strstream = new_ok( 'ANTLR::Runtime::ANTLRStringStream' => [ input => 'TEST' ] );

# Methods Ok

is_deeply( $strstream->input, ['T','E','S','T'], "Input is 'TEST'" );
is( $strstream->LA(0), undef, 'LA(0) == undefined' );
is( $strstream->LA(1), 'T', "LA(1) == 'T'" );
is( $strstream->consume(), undef, "Consumed 'T'" );
is( $strstream->LA(1), 'E', "LA(1) after consuming 'T' is 'E'" );
is( $strstream->LA(2), 'S', "LA(2) == 'S'" );
is( $strstream->LA(3), 'T', "LA(3) == 'T'" );
is( $strstream->LT(3), 'T', "LT(3) == 'T'" );
is( $strstream->reset(), undef, 'Reset input' );
is( $strstream->LA(3), 'S', "LA(3) after reset() is 'S'" );
is( $strstream->LA(4), 'T', "LA(4) == 'T'" );
is( $strstream->LA(5), ANTLR::Runtime::ANTLRStringStream->EOF, 'LA(5) == EOF' );

is( $strstream->size(), 4, "Input size is 4 ('TEST')" );
is( $strstream->substring(2,3), 'ST', "Substring(2,3) from 'TEST' is 'ST'" );
$strstream->p(0);
is( $strstream->seek(3), undef, "Seek(3) with p = 0, consumes 'TES'" );
is( $strstream->LA(1), 'T', "LA(1) after seek(3) is 'T'" );
$strstream->mark_depth(0);
is( $strstream->mark(), 1, 'mark depth is incremented to 1');
is( $strstream->rewind(), undef, "Rewind last marker (1 at this point)" );
is( $strstream->mark_depth, 0, 'mark depth after rewind() is 0' );
is( $strstream->release(3), undef, 'Release marker 3' );
is( $strstream->mark_depth, 2, 'mark depth after release(3) is 2' );