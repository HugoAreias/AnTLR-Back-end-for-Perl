#! /usr/bin/perl

use strict;
use warnings;
use Parse::RecDescent;
 
$Parse::RecDescent::skip = '';

my $lexer = new Parse::RecDescent q
{
 { my $niw = 0; my $i_seen = 0; open OUT, ">parserchefrec"; }
 
 chef: token(s) /\z/

 token: /[.?!]+/ /\s+/
         { $niw = 0; $i_seen = 0; print OUT $item[1] . $item[2] . "Bork Bork Bork!\n" }
      | <reject: $niw> /([Bb]ork)/ ...NW
         { print OUT "$1" }
      | /an/
         { $niw = 1; print OUT 'un' }
      | /An/
         { $niw = 1; print OUT 'Un' }
      | /au/
         { $niw = 1; print OUT 'oo' }
      | /Au/
         { $niw = 1; print OUT 'Oo' }
      | /a/ ...WC
         { $niw = 1; print OUT "e" }
      | /A/ ...WC
         { $niw = 1; print OUT "E" }
      | /en/ ...NW
         { $niw = 1; print OUT "ee" }
      | <reject: !$niw> /ew/
         { $niw = 1; print OUT "oo" }
      | <reject: !$niw> /e/ ...NW
         { $niw = 1; print OUT "e-a" }
      | <reject: $niw> /e/
         { $niw = 1; print OUT "i" }
      | <reject: $niw> /E/
         { $niw = 1; print OUT "I" }
      | <reject: !$niw> /f/
         { $niw = 1; print OUT "ff" }
      | <reject: !$niw> /ir/
         { $niw = 1; print OUT "ur" }
      | <reject: !$niw> <reject: $i_seen> /i/
         { $niw=1; $i_seen=1; print OUT "ee" }
      | <reject: $niw> /ow/
         { $niw = 1; print OUT "oo" }
      | <reject: $niw> /o/
         { $niw = 1; print OUT "oo" }
      | <reject: $niw> /O/
         { $niw = 1; print OUT "Oo" }
      | <reject: !$niw> /o/
         { $niw = 1; print OUT "u" }
      | /the/
         { $niw = 1; print OUT 'zee' }
      | /The/
         { $niw = 1; print OUT 'Zee' }
      | /th/ ...NW
         { $niw = 1; print OUT "t" }
      | <reject: !$niw> /tion/
         { $niw = 1; print OUT "shun" }
      | <reject: !$niw> /u/
         { $niw = 1; print OUT "oo" }
      | <reject: !$niw> /U/
         { $niw = 1; print OUT "Oo" }
      | /v/
         { $niw = 1; print OUT 'f' }
      | /V/
         { $niw = 1; print OUT 'F' }
      | /w/
         { $niw = 1; print OUT 'v' }
      | /W/
         { $niw = 1; print OUT 'V' }
      | NW
         { $niw = 0; $i_seen = 0; print OUT $item[1] }
      | WC
         { $niw = 1; print OUT $item[1] }
      | /\n/
         { $niw = 0; $i_seen = 0; print OUT $item[1] }

 WC: /[A-Za-z']/
 NW: /[^A-Za-z']/

};

local $/;
undef $/;
while (<>)
{
 $lexer->chef(\$_);
}
