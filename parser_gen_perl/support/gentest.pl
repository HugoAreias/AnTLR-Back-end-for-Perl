#!/usr/bin/perl

use strict;
use warnings;

my @nome = qw/dani pedro celina ruben nuno hugo sergio/;
my @classe = qw/corpo casa/;
my @tinto = qw/br cor/;
my @tipo = qw/alg la fib/;
my @qt = qw/1 2 3 4 5/;

my $i = 1000000;
open OUT, ">lavanda$i";
print OUT "13-04-2007\nPstVVerde";
# print OUT "13-04-2007 PstVVerde";

foreach (1..$i) {
 print OUT "\n".$_.' '.$nome[int(rand(7))].'('.$classe[int(rand(2))].'-'.$tinto[int(rand(2))].'-'.$tipo[int(rand(3))].' '.$qt[int(rand(5))].', '.$classe[int(rand(2))].'-'.$tinto[int(rand(2))].'-'.$tipo[int(rand(3))].' '.$qt[int(rand(5))].', '.$classe[int(rand(2))].'-'.$tinto[int(rand(2))].'-'.$tipo[int(rand(3))].' '.$qt[int(rand(5))].')';
 # print OUT ' '.$_.' '.$nome[int(rand(7))].'('.$classe[int(rand(2))].'-'.$tinto[int(rand(2))].'-'.$tipo[int(rand(3))].' '.$qt[int(rand(5))].', '.$classe[int(rand(2))].'-'.$tinto[int(rand(2))].'-'.$tipo[int(rand(3))].' '.$qt[int(rand(5))].', '.$classe[int(rand(2))].'-'.$tinto[int(rand(2))].'-'.$tipo[int(rand(3))].' '.$qt[int(rand(5))].')';
}

close OUT;