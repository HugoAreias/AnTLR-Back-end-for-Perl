#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 42;

# Use Ok

BEGIN{
	use_ok( 'ANTLR::Runtime::BitSet' );
}

# New Ok

my $bitset = new_ok( 'ANTLR::Runtime::BitSet' );

# Static Values Ok

is( $bitset->BITS(), 64, 'Number of bits is 64' );
is( $bitset->LOG_BITS(), 6, 'Power is 6' );
is( $bitset->MOD_MASK(), 63, 'Mod mask is 63' );

# Accessors Ok

is( $bitset->bits, 0 x 64, 'bits is 0x'.0 x 16 );

# New Ok With New Constructor

$bitset = new_ok( 'ANTLR::Runtime::BitSet' => [ bits => '001' ] );

# Accessors Ok

is( $bitset->bits, '001', 'bits is 001' );

# New Ok With New Constructor

$bitset = new_ok( 'ANTLR::Runtime::BitSet' => [ number => 10 ] );

# Accessors Ok

is( $bitset->bits, '0101' . 0 x 28, 'bits is 0x5'.0 x 7 );

# New Ok With New Constructor

$bitset = new_ok( 'ANTLR::Runtime::BitSet' => [ size => 16 ] );

# Accessors Ok

is( $bitset->bits, 0 x 16, 'bits is 0x'.0 x 4 );

# New Ok With New Constructor

$bitset = new_ok( 'ANTLR::Runtime::BitSet' => [ words64 => [ '0x0000004000000001', '0x1000000000800000' ] ] );

# Accessors Ok

is( $bitset->bits, '0001' . 0 x 32 . '0100' . 0 x 24 . 0 x 20 . '1000' . 0 x 36 . '0001', 'bits is long but correct' );

# New Ok

my $a = new_ok( 'ANTLR::Runtime::BitSet' => [ bits => '0101010' ] );
my $b = new_ok( 'ANTLR::Runtime::BitSet' => [ bits => '1010110' ] );
my $packed = new_ok( 'ANTLR::Runtime::BitSet' => [ words64 => [ '0x0000004000000001', '0x1000000000800000' ] ] );

# Methods Ok

# or() uses or_in_place() and clone()
is( $a->or($b)->bits, '1111110', 'or(0101010,1010110) == 1111110' );

is( $bitset->of(3)->bits, '0001', 'of(3) == bits is 0001' );
is( $bitset->of(3,5)->bits, '000101', 'of(3,5) == bits is 000101' );
is( $bitset->of(3,2,5)->bits, '001101' . 0 x 58, 'of(3,2,5) == bits is 0x34'.0 x 14 );
is( $bitset->of(3,9,4,7)->bits, '0001100101' . 0 x 54, 'of(3,9,4,7) == bits is 0x194'.0 x 13 );

ok( $bitset->bits('101010'), 'bits changed to 101010' );
is( $bitset->add(4), undef, 'Added element 4 to the bitset' );
is( $bitset->bits, '101010', 'add(4) == 101010' );
is( $bitset->add(1), undef, 'Added element 1 to the bitset' );
is( $bitset->bits, '111010', 'add(1) == 111010' );

is( $bitset->grow_to_include(8), undef, 'Grow to include element 8' );
is( $bitset->bits, '111010000', 'grow_to_include(8) == 111010000' );

is( $a->size(), 3, 'size of bitset a is 3' );
ok( !$a->equals($b), '0101010 not equal to 1010110' );
ok( $a->member(3), '{3} is member of 0101010 ({3} == 1)' );
ok( !$a->member(2), '{2} is not member of 0101010 ({2} == 0)' );

is( $a->remove(3), undef, 'Removed element 3 from the bitset' );
is( $a->bits, '0100010', 'remove(3) == 0100010' );

ok ( !$a->is_nil(), '0100010 is not null' );

is( $a->num_bits(), 7, '0100010 has 7 bits');

is( $bitset->length_in_long_words(), 0, 'bitset has 0 long words (64 bits)');

is_deeply( $bitset->to_array(), [0,1,2,4], 'bitset to array == [0,1,2,4]' );
is_deeply( $bitset->to_packed_array(), [], 'bitset to packed array == [] (64 bits)' );
ok( $packed->to_packed_array(), 'bitset to packed array (sequence of 64 bits)' );

is( "$bitset", '{0,1,2,4}', 'to_String() == {0,1,2,4}' );