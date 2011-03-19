####################################################################
#
#    This file was generated using Parse::Yapp version 1.05.
#
#        Don't edit this file, use source file instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
####################################################################
package chef;
use vars qw ( @ISA );
use strict;

@ISA= qw ( Parse::Yapp::Driver );
use Parse::Yapp::Driver;

#line 3 "chef.yp"

open OUT, ">parserchef";


sub new {
        my($class)=shift;
        ref($class)
    and $class=ref($class);

    my($self)=$class->SUPER::new( yyversion => '1.05',
                                  yystates =>
[
	{#State 0
		ACTIONS => {
			'the' => 1,
			'ax' => 2,
			'Au' => 4,
			'NL' => 3,
			'u' => 5,
			'An' => 6,
			'th' => 7,
			'W' => 8,
			'Bbork' => 9,
			'v' => 10,
			'Ax' => 11,
			'en' => 12,
			'tion' => 13,
			'ir' => 14,
			'ow' => 18,
			'U' => 16,
			'The' => 17,
			'edone' => 19,
			'w' => 20,
			'V' => 21,
			'au' => 22,
			'ew' => 23,
			'Ex' => 24,
			'f' => 26,
			'WC' => 27,
			'i' => 28,
			'O' => 29,
			'NW' => 30,
			'ex' => 31,
			'xo' => 32,
			'EOS' => 33,
			'o' => 35,
			'an' => 34
		},
		GOTOS => {
			'chef' => 15,
			'token' => 25
		}
	},
	{#State 1
		DEFAULT => -23
	},
	{#State 2
		DEFAULT => -9
	},
	{#State 3
		DEFAULT => -35
	},
	{#State 4
		DEFAULT => -8
	},
	{#State 5
		DEFAULT => -27
	},
	{#State 6
		DEFAULT => -6
	},
	{#State 7
		DEFAULT => -25
	},
	{#State 8
		DEFAULT => -32
	},
	{#State 9
		DEFAULT => -4
	},
	{#State 10
		DEFAULT => -29
	},
	{#State 11
		DEFAULT => -10
	},
	{#State 12
		DEFAULT => -11
	},
	{#State 13
		DEFAULT => -26
	},
	{#State 14
		DEFAULT => -17
	},
	{#State 15
		ACTIONS => {
			'' => 36,
			'the' => 1,
			'ax' => 2,
			'Au' => 4,
			'NL' => 3,
			'u' => 5,
			'An' => 6,
			'th' => 7,
			'W' => 8,
			'Bbork' => 9,
			'v' => 10,
			'Ax' => 11,
			'en' => 12,
			'tion' => 13,
			'ir' => 14,
			'ow' => 18,
			'The' => 17,
			'U' => 16,
			'w' => 20,
			'edone' => 19,
			'V' => 21,
			'Ex' => 24,
			'ew' => 23,
			'au' => 22,
			'f' => 26,
			'WC' => 27,
			'i' => 28,
			'O' => 29,
			'NW' => 30,
			'ex' => 31,
			'xo' => 32,
			'EOS' => 33,
			'an' => 34,
			'o' => 35
		},
		GOTOS => {
			'token' => 37
		}
	},
	{#State 16
		DEFAULT => -28
	},
	{#State 17
		DEFAULT => -24
	},
	{#State 18
		DEFAULT => -19
	},
	{#State 19
		DEFAULT => -13
	},
	{#State 20
		DEFAULT => -31
	},
	{#State 21
		DEFAULT => -30
	},
	{#State 22
		DEFAULT => -7
	},
	{#State 23
		DEFAULT => -12
	},
	{#State 24
		DEFAULT => -15
	},
	{#State 25
		DEFAULT => -1
	},
	{#State 26
		DEFAULT => -16
	},
	{#State 27
		DEFAULT => -34
	},
	{#State 28
		DEFAULT => -18
	},
	{#State 29
		DEFAULT => -21
	},
	{#State 30
		DEFAULT => -33
	},
	{#State 31
		DEFAULT => -14
	},
	{#State 32
		DEFAULT => -22
	},
	{#State 33
		DEFAULT => -3
	},
	{#State 34
		DEFAULT => -5
	},
	{#State 35
		DEFAULT => -20
	},
	{#State 36
		DEFAULT => 0
	},
	{#State 37
		DEFAULT => -2
	}
],
                                  yyrules  =>
[
	[#Rule 0
		 '$start', 2, undef
	],
	[#Rule 1
		 'chef', 1, undef
	],
	[#Rule 2
		 'chef', 2, undef
	],
	[#Rule 3
		 'token', 1,
sub
#line 14 "chef.yp"
{ print OUT $_[1] . "Bork Bork Bork!\n" }
	],
	[#Rule 4
		 'token', 1,
sub
#line 16 "chef.yp"
{ print OUT $_[1] }
	],
	[#Rule 5
		 'token', 1,
sub
#line 18 "chef.yp"
{ print OUT 'un' }
	],
	[#Rule 6
		 'token', 1,
sub
#line 20 "chef.yp"
{ print OUT 'Un' }
	],
	[#Rule 7
		 'token', 1,
sub
#line 22 "chef.yp"
{ print OUT 'oo' }
	],
	[#Rule 8
		 'token', 1,
sub
#line 24 "chef.yp"
{ print OUT 'Oo' }
	],
	[#Rule 9
		 'token', 1,
sub
#line 26 "chef.yp"
{ print OUT 'e' }
	],
	[#Rule 10
		 'token', 1,
sub
#line 28 "chef.yp"
{ print OUT 'E' }
	],
	[#Rule 11
		 'token', 1,
sub
#line 30 "chef.yp"
{ print OUT 'ee' }
	],
	[#Rule 12
		 'token', 1,
sub
#line 32 "chef.yp"
{ print OUT 'oo' }
	],
	[#Rule 13
		 'token', 1,
sub
#line 34 "chef.yp"
{ print OUT 'e-a' }
	],
	[#Rule 14
		 'token', 1,
sub
#line 36 "chef.yp"
{ print OUT 'i' }
	],
	[#Rule 15
		 'token', 1,
sub
#line 38 "chef.yp"
{ print OUT 'I' }
	],
	[#Rule 16
		 'token', 1,
sub
#line 40 "chef.yp"
{ print OUT 'ff' }
	],
	[#Rule 17
		 'token', 1,
sub
#line 42 "chef.yp"
{ print OUT 'ur' }
	],
	[#Rule 18
		 'token', 1,
sub
#line 44 "chef.yp"
{ print OUT 'ee' }
	],
	[#Rule 19
		 'token', 1,
sub
#line 46 "chef.yp"
{ print OUT 'oo' }
	],
	[#Rule 20
		 'token', 1,
sub
#line 48 "chef.yp"
{ print OUT 'oo' }
	],
	[#Rule 21
		 'token', 1,
sub
#line 50 "chef.yp"
{ print OUT 'Oo' }
	],
	[#Rule 22
		 'token', 1,
sub
#line 52 "chef.yp"
{ print OUT 'u' }
	],
	[#Rule 23
		 'token', 1,
sub
#line 54 "chef.yp"
{ print OUT 'zee' }
	],
	[#Rule 24
		 'token', 1,
sub
#line 56 "chef.yp"
{ print OUT 'Zee' }
	],
	[#Rule 25
		 'token', 1,
sub
#line 58 "chef.yp"
{ print OUT 't' }
	],
	[#Rule 26
		 'token', 1,
sub
#line 60 "chef.yp"
{ print OUT 'shun' }
	],
	[#Rule 27
		 'token', 1,
sub
#line 62 "chef.yp"
{ print OUT 'oo' }
	],
	[#Rule 28
		 'token', 1,
sub
#line 64 "chef.yp"
{ print OUT 'Oo' }
	],
	[#Rule 29
		 'token', 1,
sub
#line 66 "chef.yp"
{ print OUT 'f' }
	],
	[#Rule 30
		 'token', 1,
sub
#line 68 "chef.yp"
{ print OUT 'F' }
	],
	[#Rule 31
		 'token', 1,
sub
#line 70 "chef.yp"
{ print OUT 'v' }
	],
	[#Rule 32
		 'token', 1,
sub
#line 72 "chef.yp"
{ print OUT 'V' }
	],
	[#Rule 33
		 'token', 1,
sub
#line 74 "chef.yp"
{ print OUT $_[1] }
	],
	[#Rule 34
		 'token', 1,
sub
#line 76 "chef.yp"
{ print OUT $_[1] }
	],
	[#Rule 35
		 'token', 1,
sub
#line 78 "chef.yp"
{ print OUT $_[1] }
	]
],
                                  @_);
    bless($self,$class);
}

#line 81 "chef.yp"


package main;
my $niw = 0;
my $i_seen = 0;
my $File;
my $t = Run();
close OUT;

sub lexical_analyse {
	my $WC = qr/[A-Za-z']/;
	my $NW = qr/[^A-Za-z']/;
	for ($File) {
		!$niw and m{\G([Bb]ork)(?=$NW)}gc         and do { return ('Bbork',$1) };
		m{\G(an)}gc                               and do { $niw = 1; return ($1,$1) };
		m{\G(An)}gc                               and do { $niw = 1; return ($1,$1) };
		m{\G(au)}gc                               and do { $niw = 1; return ($1,$1) };
		m{\G(Au)}gc                               and do { $niw = 1; return ($1,$1) };
		m{\G(a)(?=$WC)}gc                         and do { $niw = 1; return ('ax',$1) };
		m{\G(A)(?=$WC)}gc                         and do { $niw = 1; return ('Ax',$1) };
		m{\G(en)(?=$NW)}gc                        and do { $niw = 1; return ($1,$1) };
	    $niw and m{\G(ew)}gc                      and do { $niw = 1; return ($1,$1) };
		$niw and m{\G(e)(?=$NW)}gc                and do { $niw = 1; return ('edone',$1) };
		!$niw and m{\G(e)}gc                      and do { $niw = 1; return ('ex',$1) };
		!$niw and m{\G(E)}gc                      and do { $niw = 1; return ('Ex',$1) };
		$niw and m{\G(f)}gc                       and do { $niw = 1; return ($1,$1) };
		$niw and m{\G(ir)}gc                      and do { $niw = 1; return ($1,$1) };
		($niw and !$i_seen) and m{\G(i)}gc        and do { $niw = 1; $i_seen = 1; return ($1,$1) };
		!$niw and m{\G(ow)}gc                     and do { $niw = 1; return ($1,$1) };
		!$niw and m{\G(o)}gc                      and do { $niw = 1; return ($1,$1) };
		!$niw and m{\G(O)}gc                      and do { $niw = 1; return ($1,$1) };
		$niw and m{\G(o)}gc                       and do { $niw = 1; return ('xo',$1) };
		m{\G(the)}gc                              and do { $niw = 1; return ($1,$1) };
		m{\G(The)}gc                              and do { $niw = 1; return ($1,$1) };
		m{\G(th)(?=$NW)}gc                        and do { $niw = 1; return ($1,$1) };
		$niw and m{\G(tion)}gc                    and do { $niw = 1; return ($1,$1) };
		$niw and m{\G(u)}gc                       and do { $niw = 1; return ($1,$1) };
		$niw and m{\G(U)}gc                       and do { $niw = 1; return ($1,$1) };
		m{\G(v)}gc                                and do { $niw = 1; return ($1,$1) };
		m{\G(V)}gc                                and do { $niw = 1; return ($1,$1) };
		m{\G(w)}gc                                and do { $niw = 1; return ($1,$1) };
		m{\G(W)}gc                                and do { $niw = 1; return ($1,$1) };
		m{\G([.?!]+\s+)}gc                        and do { $niw = 0; $i_seen = 0; return ('EOS',$1) };
		m{\G($WC)}gc                              and do { $niw = 1; return ('WC',$1) };
		m{\G($NW)}gc                              and do { $niw = 0; $i_seen = 0; return ('NW',$1) };
		m{\G(/\n/)}gc                             and do { $niw = 0; $i_seen = 0; return ('NL',$1) };
		return ('',undef);
	}
}

sub yyerror {
	my $parser = shift;
	my $expected = $parser->YYExpect;
	my $got = $parser->YYCurtok;
	die "Parse Error: Expected $expected, got $got\n";
}

sub Run {
	my $parser = new chef();
	local $/;
	undef $/;
	while (<>) {
		$File = $_;
		$parser->YYParse( yylex => \&lexical_analyse, yyerror => \&yyerror );
	}
}
1;
