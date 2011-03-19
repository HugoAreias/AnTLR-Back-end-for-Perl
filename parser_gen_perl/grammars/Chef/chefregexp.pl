#!/usr/bin/perl

use strict;
use warnings;
use Regexp::Grammars;
use Data::Dumper;

my $niw = 0;
my $i_seen = 0;
my $WC = qr/[A-Za-z']/;
my $NW = qr/[^A-Za-z']/;

my $parser = qr{
    <chef>

    <rule: chef>           <[MATCH=token]>+ ** (\z)

    <token: token>  ([.?!]+ \s+)                                           (?{ $niw = 0; $i_seen = 0; print OUT $CAPTURE,"Bork Bork Bork!\n" })
                  | ([Bb]ork)(?=[^A-Za-z'])  <require: (?{ !$niw })>       (?{ print OUT $CAPTURE })
	       		  | an                                                     (?{ $niw = 1; print OUT 'un' })
				  | An                                                     (?{ $niw = 1; print OUT 'Un' })
				  | au                                                     (?{ $niw = 1; print OUT 'oo' })
				  | Au                                                     (?{ $niw = 1; print OUT 'Oo' })
				  | a(?=[A-Za-z'])                                         (?{ $niw = 1; print OUT 'e' })
				  | A(?=[A-Za-z'])                                         (?{ $niw = 1; print OUT 'E' })
			      | en(?=[^A-Za-z'])                                       (?{ $niw = 1; print OUT 'ee' })
			      | ew                <require: (?{ $niw })>               (?{ $niw = 1; print OUT 'oo' })
				  | e(?=[^A-Za-z'])   <require: (?{ $niw })>               (?{ $niw = 1; print OUT 'e-a' })
			      | e                 <require: (?{ !$niw })>              (?{ $niw = 1; print OUT 'i' })
			      | E                 <require: (?{ !$niw })>              (?{ $niw = 1; print OUT 'I' })
				  | f                 <require: (?{ $niw })>               (?{ $niw = 1; print OUT 'ff' })
				  | ir                <require: (?{ $niw })>               (?{ $niw = 1; print OUT 'ur' })
				  | i                 <require: (?{ $niw and !$i_seen })>  (?{ $niw = 1; $i_seen = 1; print OUT 'ee' })
				  | ow                <require: (?{ !$niw })>              (?{ $niw = 1; print OUT 'oo' })
				  | o                 <require: (?{ !$niw })>              (?{ $niw = 1; print OUT 'oo' })
				  | O                 <require: (?{ !$niw })>              (?{ $niw = 1; print OUT 'Oo' })
				  | o                 <require: (?{ $niw })>               (?{ $niw = 1; print OUT 'u' })
				  | the                                                    (?{ $niw = 1; print OUT 'zee' })
				  | The                                                    (?{ $niw = 1; print OUT 'Zee' })
				  | th(?=[^A-Za-z'])                                       (?{ $niw = 1; print OUT 't' })
				  | tion              <require: (?{ $niw })>               (?{ $niw = 1; print OUT 'shun' })
				  | u                 <require: (?{ $niw })>               (?{ $niw = 1; print OUT 'oo' })
				  | U                 <require: (?{ $niw })>               (?{ $niw = 1; print OUT 'Oo' })
				  | v                                                      (?{ $niw = 1; print OUT 'f' })
				  | V                                                      (?{ $niw = 1; print OUT 'F' })
				  | w                                                      (?{ $niw = 1; print OUT 'v' })
				  | W                                                      (?{ $niw = 1; print OUT 'V' })
				  | ([A-Za-z'])                                            (?{ $niw = 1; print OUT $CAPTURE })
				  | ([^A-Za-z'])                                           (?{ $niw = 0; $i_seen = 0; print OUT $CAPTURE })
				  | (\n)                                                   (?{ $niw = 0; $i_seen = 0; print OUT $CAPTURE })
}x;

local $/;
undef $/;
my $File = <>;
my $res = Run();

sub Run {
	open OUT, ">parserchefregexp";
	if ($File =~ $parser) { return 1 }
	close OUT;
}