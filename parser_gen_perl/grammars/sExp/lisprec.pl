#! /usr/bin/perl

use strict;
use warnings;
use Parse::RecDescent;
use Data::Dumper;

my $lexer = new Parse::RecDescent q
{
 lisp: sExp
        { $return = $item[1] }

 sExp: (/\d+/)
        { $return = $item[1] }
     | (/[A-Za-z]+/)
        { $return = $item[1] }
     | '(' sExp(s?) ')'
        { $return = $item[2] }

};

my $res = Run();

sub Run{
	local $/;
	undef $/;
	my $text = <>;
	print Dumper $lexer->lisp(\$text);
}