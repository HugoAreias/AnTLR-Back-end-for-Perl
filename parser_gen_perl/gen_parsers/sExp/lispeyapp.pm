########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.147.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'lispeyapp.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package lispeyapp;
use strict;

push @lispeyapp::ISA, 'Parse::Eyapp::Driver';


BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  


#line 28 ./lispeyapp.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@lispeyapp::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.147',
    yyGRAMMAR  =>
[
  [ _SUPERSTART => '$start', [ 'lisp', '$end' ], 0 ],
  [ lisp_1 => 'lisp', [ 'sExp' ], 0 ],
  [ _STAR_LIST => 'STAR-1', [ 'STAR-1', 'sExp' ], 0 ],
  [ _STAR_LIST => 'STAR-1', [  ], 0 ],
  [ sExp_4 => 'sExp', [ 'NUM' ], 0 ],
  [ sExp_5 => 'sExp', [ 'PAL' ], 0 ],
  [ sExp_6 => 'sExp', [ '(', 'STAR-1', ')' ], 0 ],
],
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'(' => { ISSEMANTIC => 0 },
	')' => { ISSEMANTIC => 0 },
	NUM => { ISSEMANTIC => 1 },
	PAL => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'lispeyapp.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'NUM' => 1,
			"(" => 2,
			'PAL' => 4
		},
		GOTOS => {
			'sExp' => 3,
			'lisp' => 5
		}
	},
	{#State 1
		DEFAULT => -4
	},
	{#State 2
		DEFAULT => -3,
		GOTOS => {
			'STAR-1' => 6
		}
	},
	{#State 3
		DEFAULT => -1
	},
	{#State 4
		DEFAULT => -5
	},
	{#State 5
		ACTIONS => {
			'' => 7
		}
	},
	{#State 6
		ACTIONS => {
			'NUM' => 1,
			"(" => 2,
			")" => 9,
			'PAL' => 4
		},
		GOTOS => {
			'sExp' => 8
		}
	},
	{#State 7
		DEFAULT => 0
	},
	{#State 8
		DEFAULT => -2
	},
	{#State 9
		DEFAULT => -6
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 118 ./lispeyapp.pm
	],
	[#Rule lisp_1
		 'lisp', 1,
sub {
#line 10 "lispeyapp.eyp"
 return $_[1] }
#line 125 ./lispeyapp.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 2,
sub {
#line 17 "lispeyapp.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 132 ./lispeyapp.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 0,
sub {
#line 17 "lispeyapp.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 139 ./lispeyapp.pm
	],
	[#Rule sExp_4
		 'sExp', 1,
sub {
#line 14 "lispeyapp.eyp"
 return $_[1] }
#line 146 ./lispeyapp.pm
	],
	[#Rule sExp_5
		 'sExp', 1,
sub {
#line 16 "lispeyapp.eyp"
 return $_[1] }
#line 153 ./lispeyapp.pm
	],
	[#Rule sExp_6
		 'sExp', 3,
sub {
#line 18 "lispeyapp.eyp"
 return $_[2] }
#line 160 ./lispeyapp.pm
	]
],
#line 163 ./lispeyapp.pm
    yybypass       => 0,
    yybuildingtree => 0,
    yyprefix       => '',
    yyaccessors    => {
   },
    @_,
  );
  bless($self,$class);

  $self->make_node_classes( qw{TERMINAL _OPTIONAL _STAR_LIST _PLUS_LIST 
         _SUPERSTART
         lisp_1
         sExp_4
         sExp_5
         sExp_6} );
  $self;
}

#line 21 "lispeyapp.eyp"


package main;
use Data::Dumper;
my $File;
my $t = Run();

sub lexical_analyse {
	my $pal = qr/[A-Za-z]+/;
	my $num = qr/\d+/;
	my $par = qr/[\(\)]/;
	for ($File) {
		s/^\s+//;
		s/^($par)// and return ($1,$1);
		s/^($pal)// and return ('PAL',$1);
		s/^($num)// and return ('NUM',$1);
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
	my $parser = new lispeyapp();
	init_lex();
	my $value = $parser->YYParse( yylex => \&lexical_analyse, yyerror => \&yyerror );
	print Dumper $value;
}

sub init_lex{
	local $/;
    undef $/;
	$File = <>;
}

=for None

=cut



#line 229 ./lispeyapp.pm

1;
