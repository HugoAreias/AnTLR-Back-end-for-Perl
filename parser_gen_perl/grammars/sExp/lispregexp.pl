#!/usr/bin/perl

use strict;
use warnings;
use Regexp::Grammars;
use Data::Dumper;

my $parser = qr{
    <lisp>

    <rule: lisp>    <MATCH=sExp>

    <rule: sExp>    (\d+) (?{ $MATCH = $CAPTURE }) | ([A-Za-z]+) (?{ $MATCH = $CAPTURE }) | \( <[MATCH=sExp]>* \)

}x;

my $res = Run();

sub Run {
	local $/;
	undef $/;
	my $text = <>;
	if ($text =~ $parser) { print Dumper $/{lisp} }
}