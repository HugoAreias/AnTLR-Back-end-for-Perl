#!/usr/bin/perl

use strict;
use warnings;

my $lisp;

open OUT, ">lisp";

$lisp .= devolve_sexp().' ';

print OUT $lisp;
close OUT;

sub escolhe_prod {
	my $path = int(rand 3);
	return (devolve_int().' ')    if (0 == $path);
	return (devolve_string().' ') if (1 == $path);
	return (devolve_sexp().' ')   if (2 == $path);
}

sub devolve_sexp {
	my $rec = int(rand 5);
	return '( )' if (0 == $rec);
	my $sexp = '(';
	foreach (1..$rec) { $sexp .= escolhe_prod() }
	return $sexp.') ';
}

sub devolve_int { return int(rand 100) }

sub devolve_string {
	my @chars = ('a'..'z','A'..'Z');
	my $size = int(rand 2) + 3;
	my $new_str;
	foreach (1..$size) {
		$new_str .= $chars[int(rand @chars)];
	}
	return $new_str;
}