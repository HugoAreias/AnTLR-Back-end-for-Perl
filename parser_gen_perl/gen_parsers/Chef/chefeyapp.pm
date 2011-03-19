########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.154.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'chefeyapp.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package chefeyapp;
use strict;

push @chefeyapp::ISA, 'Parse::Eyapp::Driver';


BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

#line 37 "chefeyapp.eyp"

open OUT, ">parserchefeyapp";

#line 31 ./chefeyapp.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@chefeyapp::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.154',
    yyGRAMMAR  =>
[
  [ '_SUPERSTART' => '$start', [ 'chef', '$end' ], 0 ],
  [ '_PLUS_LIST' => 'PLUS-1', [ 'PLUS-1', 'token' ], 0 ],
  [ '_PLUS_LIST' => 'PLUS-1', [ 'token' ], 0 ],
  [ 'chef_3' => 'chef', [ 'PLUS-1' ], 0 ],
  [ 'token_4' => 'token', [ 'EOS' ], 0 ],
  [ 'token_5' => 'token', [ 'Bbork' ], 0 ],
  [ 'token_6' => 'token', [ 'an' ], 0 ],
  [ 'token_7' => 'token', [ 'An' ], 0 ],
  [ 'token_8' => 'token', [ 'au' ], 0 ],
  [ 'token_9' => 'token', [ 'Au' ], 0 ],
  [ 'token_10' => 'token', [ 'ax' ], 0 ],
  [ 'token_11' => 'token', [ 'Ax' ], 0 ],
  [ 'token_12' => 'token', [ 'en' ], 0 ],
  [ 'token_13' => 'token', [ 'ew' ], 0 ],
  [ 'token_14' => 'token', [ 'edone' ], 0 ],
  [ 'token_15' => 'token', [ 'ex' ], 0 ],
  [ 'token_16' => 'token', [ 'Ex' ], 0 ],
  [ 'token_17' => 'token', [ 'f' ], 0 ],
  [ 'token_18' => 'token', [ 'ir' ], 0 ],
  [ 'token_19' => 'token', [ 'i' ], 0 ],
  [ 'token_20' => 'token', [ 'ow' ], 0 ],
  [ 'token_21' => 'token', [ 'o' ], 0 ],
  [ 'token_22' => 'token', [ 'O' ], 0 ],
  [ 'token_23' => 'token', [ 'xo' ], 0 ],
  [ 'token_24' => 'token', [ 'the' ], 0 ],
  [ 'token_25' => 'token', [ 'The' ], 0 ],
  [ 'token_26' => 'token', [ 'th' ], 0 ],
  [ 'token_27' => 'token', [ 'tion' ], 0 ],
  [ 'token_28' => 'token', [ 'u' ], 0 ],
  [ 'token_29' => 'token', [ 'U' ], 0 ],
  [ 'token_30' => 'token', [ 'v' ], 0 ],
  [ 'token_31' => 'token', [ 'V' ], 0 ],
  [ 'token_32' => 'token', [ 'w' ], 0 ],
  [ 'token_33' => 'token', [ 'W' ], 0 ],
  [ 'token_34' => 'token', [ 'NW' ], 0 ],
  [ 'token_35' => 'token', [ 'WC' ], 0 ],
  [ 'token_36' => 'token', [ 'NL' ], 0 ],
],
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	An => { ISSEMANTIC => 1 },
	Au => { ISSEMANTIC => 1 },
	Ax => { ISSEMANTIC => 1 },
	Bbork => { ISSEMANTIC => 1 },
	EOS => { ISSEMANTIC => 1 },
	Ex => { ISSEMANTIC => 1 },
	NL => { ISSEMANTIC => 1 },
	NW => { ISSEMANTIC => 1 },
	O => { ISSEMANTIC => 1 },
	The => { ISSEMANTIC => 1 },
	U => { ISSEMANTIC => 1 },
	V => { ISSEMANTIC => 1 },
	W => { ISSEMANTIC => 1 },
	WC => { ISSEMANTIC => 1 },
	an => { ISSEMANTIC => 1 },
	au => { ISSEMANTIC => 1 },
	ax => { ISSEMANTIC => 1 },
	edone => { ISSEMANTIC => 1 },
	en => { ISSEMANTIC => 1 },
	ew => { ISSEMANTIC => 1 },
	ex => { ISSEMANTIC => 1 },
	f => { ISSEMANTIC => 1 },
	i => { ISSEMANTIC => 1 },
	ir => { ISSEMANTIC => 1 },
	o => { ISSEMANTIC => 1 },
	ow => { ISSEMANTIC => 1 },
	th => { ISSEMANTIC => 1 },
	the => { ISSEMANTIC => 1 },
	tion => { ISSEMANTIC => 1 },
	u => { ISSEMANTIC => 1 },
	v => { ISSEMANTIC => 1 },
	w => { ISSEMANTIC => 1 },
	xo => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'chefeyapp.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'the' => 1,
			'ax' => 2,
			'Au' => 4,
			'NL' => 3,
			'u' => 6,
			'An' => 7,
			'th' => 8,
			'W' => 9,
			'Bbork' => 10,
			'v' => 11,
			'Ax' => 12,
			'en' => 13,
			'tion' => 14,
			'ir' => 15,
			'ow' => 19,
			'U' => 17,
			'The' => 18,
			'edone' => 20,
			'w' => 21,
			'V' => 22,
			'au' => 23,
			'ew' => 24,
			'Ex' => 25,
			'f' => 27,
			'WC' => 28,
			'i' => 29,
			'O' => 30,
			'NW' => 31,
			'ex' => 32,
			'xo' => 33,
			'EOS' => 34,
			'o' => 36,
			'an' => 35
		},
		GOTOS => {
			'chef' => 16,
			'token' => 26,
			'PLUS-1' => 5
		}
	},
	{#State 1
		DEFAULT => -24
	},
	{#State 2
		DEFAULT => -10
	},
	{#State 3
		DEFAULT => -36
	},
	{#State 4
		DEFAULT => -9
	},
	{#State 5
		ACTIONS => {
			'the' => 1,
			'ax' => 2,
			'Au' => 4,
			'NL' => 3,
			'u' => 6,
			'An' => 7,
			'th' => 8,
			'W' => 9,
			'Bbork' => 10,
			'v' => 11,
			'Ax' => 12,
			'en' => 13,
			'tion' => 14,
			'ir' => 15,
			'ow' => 19,
			'The' => 18,
			'U' => 17,
			'w' => 21,
			'edone' => 20,
			'V' => 22,
			'Ex' => 25,
			'ew' => 24,
			'au' => 23,
			'f' => 27,
			'WC' => 28,
			'i' => 29,
			'O' => 30,
			'NW' => 31,
			'ex' => 32,
			'xo' => 33,
			'EOS' => 34,
			'an' => 35,
			'o' => 36
		},
		DEFAULT => -3,
		GOTOS => {
			'token' => 37
		}
	},
	{#State 6
		DEFAULT => -28
	},
	{#State 7
		DEFAULT => -7
	},
	{#State 8
		DEFAULT => -26
	},
	{#State 9
		DEFAULT => -33
	},
	{#State 10
		DEFAULT => -5
	},
	{#State 11
		DEFAULT => -30
	},
	{#State 12
		DEFAULT => -11
	},
	{#State 13
		DEFAULT => -12
	},
	{#State 14
		DEFAULT => -27
	},
	{#State 15
		DEFAULT => -18
	},
	{#State 16
		ACTIONS => {
			'' => 38
		}
	},
	{#State 17
		DEFAULT => -29
	},
	{#State 18
		DEFAULT => -25
	},
	{#State 19
		DEFAULT => -20
	},
	{#State 20
		DEFAULT => -14
	},
	{#State 21
		DEFAULT => -32
	},
	{#State 22
		DEFAULT => -31
	},
	{#State 23
		DEFAULT => -8
	},
	{#State 24
		DEFAULT => -13
	},
	{#State 25
		DEFAULT => -16
	},
	{#State 26
		DEFAULT => -2
	},
	{#State 27
		DEFAULT => -17
	},
	{#State 28
		DEFAULT => -35
	},
	{#State 29
		DEFAULT => -19
	},
	{#State 30
		DEFAULT => -22
	},
	{#State 31
		DEFAULT => -34
	},
	{#State 32
		DEFAULT => -15
	},
	{#State 33
		DEFAULT => -23
	},
	{#State 34
		DEFAULT => -4
	},
	{#State 35
		DEFAULT => -6
	},
	{#State 36
		DEFAULT => -21
	},
	{#State 37
		DEFAULT => -1
	},
	{#State 38
		DEFAULT => 0
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 325 ./chefeyapp.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-1', 2,
sub {
#line 43 "chefeyapp.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 332 ./chefeyapp.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-1', 1,
sub {
#line 43 "chefeyapp.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 339 ./chefeyapp.pm
	],
	[#Rule chef_3
		 'chef', 1, undef
#line 343 ./chefeyapp.pm
	],
	[#Rule token_4
		 'token', 1,
sub {
#line 47 "chefeyapp.eyp"
 print OUT $_[1] . "Bork Bork Bork!\n" }
#line 350 ./chefeyapp.pm
	],
	[#Rule token_5
		 'token', 1,
sub {
#line 49 "chefeyapp.eyp"
 print OUT $_[1] }
#line 357 ./chefeyapp.pm
	],
	[#Rule token_6
		 'token', 1,
sub {
#line 51 "chefeyapp.eyp"
 print OUT 'un' }
#line 364 ./chefeyapp.pm
	],
	[#Rule token_7
		 'token', 1,
sub {
#line 53 "chefeyapp.eyp"
 print OUT 'Un' }
#line 371 ./chefeyapp.pm
	],
	[#Rule token_8
		 'token', 1,
sub {
#line 55 "chefeyapp.eyp"
 print OUT 'oo' }
#line 378 ./chefeyapp.pm
	],
	[#Rule token_9
		 'token', 1,
sub {
#line 57 "chefeyapp.eyp"
 print OUT 'Oo' }
#line 385 ./chefeyapp.pm
	],
	[#Rule token_10
		 'token', 1,
sub {
#line 59 "chefeyapp.eyp"
 print OUT 'e' }
#line 392 ./chefeyapp.pm
	],
	[#Rule token_11
		 'token', 1,
sub {
#line 61 "chefeyapp.eyp"
 print OUT 'E' }
#line 399 ./chefeyapp.pm
	],
	[#Rule token_12
		 'token', 1,
sub {
#line 63 "chefeyapp.eyp"
 print OUT 'ee' }
#line 406 ./chefeyapp.pm
	],
	[#Rule token_13
		 'token', 1,
sub {
#line 65 "chefeyapp.eyp"
 print OUT 'oo' }
#line 413 ./chefeyapp.pm
	],
	[#Rule token_14
		 'token', 1,
sub {
#line 67 "chefeyapp.eyp"
 print OUT 'e-a' }
#line 420 ./chefeyapp.pm
	],
	[#Rule token_15
		 'token', 1,
sub {
#line 69 "chefeyapp.eyp"
 print OUT 'i' }
#line 427 ./chefeyapp.pm
	],
	[#Rule token_16
		 'token', 1,
sub {
#line 71 "chefeyapp.eyp"
 print OUT 'I' }
#line 434 ./chefeyapp.pm
	],
	[#Rule token_17
		 'token', 1,
sub {
#line 73 "chefeyapp.eyp"
 print OUT 'ff' }
#line 441 ./chefeyapp.pm
	],
	[#Rule token_18
		 'token', 1,
sub {
#line 75 "chefeyapp.eyp"
 print OUT 'ur' }
#line 448 ./chefeyapp.pm
	],
	[#Rule token_19
		 'token', 1,
sub {
#line 77 "chefeyapp.eyp"
 print OUT 'ee' }
#line 455 ./chefeyapp.pm
	],
	[#Rule token_20
		 'token', 1,
sub {
#line 79 "chefeyapp.eyp"
 print OUT 'oo' }
#line 462 ./chefeyapp.pm
	],
	[#Rule token_21
		 'token', 1,
sub {
#line 81 "chefeyapp.eyp"
 print OUT 'oo' }
#line 469 ./chefeyapp.pm
	],
	[#Rule token_22
		 'token', 1,
sub {
#line 83 "chefeyapp.eyp"
 print OUT 'Oo' }
#line 476 ./chefeyapp.pm
	],
	[#Rule token_23
		 'token', 1,
sub {
#line 85 "chefeyapp.eyp"
 print OUT 'u' }
#line 483 ./chefeyapp.pm
	],
	[#Rule token_24
		 'token', 1,
sub {
#line 87 "chefeyapp.eyp"
 print OUT 'zee' }
#line 490 ./chefeyapp.pm
	],
	[#Rule token_25
		 'token', 1,
sub {
#line 89 "chefeyapp.eyp"
 print OUT 'Zee' }
#line 497 ./chefeyapp.pm
	],
	[#Rule token_26
		 'token', 1,
sub {
#line 91 "chefeyapp.eyp"
 print OUT 't' }
#line 504 ./chefeyapp.pm
	],
	[#Rule token_27
		 'token', 1,
sub {
#line 93 "chefeyapp.eyp"
 print OUT 'shun' }
#line 511 ./chefeyapp.pm
	],
	[#Rule token_28
		 'token', 1,
sub {
#line 95 "chefeyapp.eyp"
 print OUT 'oo' }
#line 518 ./chefeyapp.pm
	],
	[#Rule token_29
		 'token', 1,
sub {
#line 97 "chefeyapp.eyp"
 print OUT 'Oo' }
#line 525 ./chefeyapp.pm
	],
	[#Rule token_30
		 'token', 1,
sub {
#line 99 "chefeyapp.eyp"
 print OUT 'f' }
#line 532 ./chefeyapp.pm
	],
	[#Rule token_31
		 'token', 1,
sub {
#line 101 "chefeyapp.eyp"
 print OUT 'F' }
#line 539 ./chefeyapp.pm
	],
	[#Rule token_32
		 'token', 1,
sub {
#line 103 "chefeyapp.eyp"
 print OUT 'v' }
#line 546 ./chefeyapp.pm
	],
	[#Rule token_33
		 'token', 1,
sub {
#line 105 "chefeyapp.eyp"
 print OUT 'V' }
#line 553 ./chefeyapp.pm
	],
	[#Rule token_34
		 'token', 1,
sub {
#line 107 "chefeyapp.eyp"
 print OUT $_[1] }
#line 560 ./chefeyapp.pm
	],
	[#Rule token_35
		 'token', 1,
sub {
#line 109 "chefeyapp.eyp"
 print OUT $_[1] }
#line 567 ./chefeyapp.pm
	],
	[#Rule token_36
		 'token', 1,
sub {
#line 111 "chefeyapp.eyp"
 print OUT $_[1] }
#line 574 ./chefeyapp.pm
	]
],
#line 577 ./chefeyapp.pm
    yybypass       => 0,
    yybuildingtree => 0,
    yyprefix       => '',
    yyaccessors    => {
   },
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         '_PLUS_LIST', 
         '_PLUS_LIST', 
         'chef_3', 
         'token_4', 
         'token_5', 
         'token_6', 
         'token_7', 
         'token_8', 
         'token_9', 
         'token_10', 
         'token_11', 
         'token_12', 
         'token_13', 
         'token_14', 
         'token_15', 
         'token_16', 
         'token_17', 
         'token_18', 
         'token_19', 
         'token_20', 
         'token_21', 
         'token_22', 
         'token_23', 
         'token_24', 
         'token_25', 
         'token_26', 
         'token_27', 
         'token_28', 
         'token_29', 
         'token_30', 
         'token_31', 
         'token_32', 
         'token_33', 
         'token_34', 
         'token_35', 
         'token_36', );
  $self;
}

#line 114 "chefeyapp.eyp"


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
		# m{\G(/\Z/)}gc                             and do { return ('NS',$1) };
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
	my $parser = new chefeyapp();
	local $/;
	undef $/;
	while (<>) {
		$File = $_;
		$parser->YYParse( yylex => \&lexical_analyse, yyerror => \&yyerror );
	}
}

=for None

=cut



#line 703 ./chefeyapp.pm

1;
