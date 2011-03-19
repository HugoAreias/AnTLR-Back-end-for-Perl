####################################################################
#
#    This file was generated using Parse::Yapp version 1.05.
#
#        Don't edit this file, use source file instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
####################################################################
package lisp;
use vars qw ( @ISA );
use strict;

@ISA= qw ( Parse::Yapp::Driver );
use Parse::Yapp::Driver;



sub new {
        my($class)=shift;
        ref($class)
    and $class=ref($class);

    my($self)=$class->SUPER::new( yyversion => '1.05',
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
		DEFAULT => -2
	},
	{#State 2
		ACTIONS => {
			'NUM' => 1,
			"(" => 2,
			'PAL' => 4
		},
		DEFAULT => -6,
		GOTOS => {
			'sExplist' => 6,
			'sExp' => 7
		}
	},
	{#State 3
		DEFAULT => -1
	},
	{#State 4
		DEFAULT => -3
	},
	{#State 5
		ACTIONS => {
			'' => 8
		}
	},
	{#State 6
		ACTIONS => {
			")" => 9
		}
	},
	{#State 7
		ACTIONS => {
			'NUM' => 1,
			"(" => 2,
			'PAL' => 4
		},
		DEFAULT => -6,
		GOTOS => {
			'sExplist' => 10,
			'sExp' => 7
		}
	},
	{#State 8
		DEFAULT => 0
	},
	{#State 9
		DEFAULT => -4
	},
	{#State 10
		DEFAULT => -5
	}
],
                                  yyrules  =>
[
	[#Rule 0
		 '$start', 2, undef
	],
	[#Rule 1
		 'lisp', 1,
sub
#line 7 "lisp.yp"
{ return $_[1][0] }
	],
	[#Rule 2
		 'sExp', 1,
sub
#line 11 "lisp.yp"
{ return [ $_[1] ] }
	],
	[#Rule 3
		 'sExp', 1,
sub
#line 13 "lisp.yp"
{ return [ $_[1] ] }
	],
	[#Rule 4
		 'sExp', 3,
sub
#line 15 "lisp.yp"
{ return [ $_[2] ] }
	],
	[#Rule 5
		 'sExplist', 2,
sub
#line 19 "lisp.yp"
{ push @{$_[1]},@{$_[2]}; return $_[1] }
	],
	[#Rule 6
		 'sExplist', 0,
sub
#line 21 "lisp.yp"
{ return [] }
	]
],
                                  @_);
    bless($self,$class);
}

#line 24 "lisp.yp"


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
	my $parser = new lisp();
	init_lex();
	my $value = $parser->YYParse( yylex => \&lexical_analyse, yyerror => \&yyerror );
	print Dumper $value;
}

sub init_lex{
	local $/;
    undef $/;
	$File = <>;
}
1;
