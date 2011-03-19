####################################################################
#
#    This file was generated using Parse::Yapp version 1.05.
#
#        Don't edit this file, use source file instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
####################################################################
package lavanda;
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
			'date' => 1
		},
		GOTOS => {
			'Lavanda' => 3,
			'Cabec' => 2
		}
	},
	{#State 1
		ACTIONS => {
			'id' => 5
		},
		GOTOS => {
			'IdPR' => 4
		}
	},
	{#State 2
		ACTIONS => {
			'num' => 8
		},
		GOTOS => {
			'Saco' => 6,
			'Sacos' => 7
		}
	},
	{#State 3
		ACTIONS => {
			'' => 9
		}
	},
	{#State 4
		DEFAULT => -2
	},
	{#State 5
		DEFAULT => -10
	},
	{#State 6
		ACTIONS => {
			"." => 10
		}
	},
	{#State 7
		ACTIONS => {
			'num' => 8
		},
		DEFAULT => -1,
		GOTOS => {
			'Saco' => 11
		}
	},
	{#State 8
		ACTIONS => {
			'id' => 13
		},
		GOTOS => {
			'IdCli' => 12
		}
	},
	{#State 9
		DEFAULT => 0
	},
	{#State 10
		DEFAULT => -3
	},
	{#State 11
		ACTIONS => {
			"." => 14
		}
	},
	{#State 12
		ACTIONS => {
			"(" => 15
		}
	},
	{#State 13
		DEFAULT => -11
	},
	{#State 14
		DEFAULT => -4
	},
	{#State 15
		ACTIONS => {
			'casa' => 17,
			'corpo' => 18
		},
		GOTOS => {
			'Classe' => 16,
			'Lotes' => 21,
			'Lote' => 20,
			'Tipo' => 19
		}
	},
	{#State 16
		ACTIONS => {
			"-" => 22
		}
	},
	{#State 17
		DEFAULT => -14
	},
	{#State 18
		DEFAULT => -13
	},
	{#State 19
		ACTIONS => {
			'num' => 23
		},
		GOTOS => {
			'Qt' => 24
		}
	},
	{#State 20
		DEFAULT => -6
	},
	{#State 21
		ACTIONS => {
			"," => 25,
			")" => 26
		}
	},
	{#State 22
		ACTIONS => {
			'br' => 27,
			'cor' => 28
		},
		GOTOS => {
			'Tinto' => 29
		}
	},
	{#State 23
		DEFAULT => -12
	},
	{#State 24
		DEFAULT => -8
	},
	{#State 25
		ACTIONS => {
			'casa' => 17,
			'corpo' => 18
		},
		GOTOS => {
			'Classe' => 16,
			'Lote' => 30,
			'Tipo' => 19
		}
	},
	{#State 26
		DEFAULT => -5
	},
	{#State 27
		DEFAULT => -15
	},
	{#State 28
		DEFAULT => -16
	},
	{#State 29
		ACTIONS => {
			"-" => 31
		}
	},
	{#State 30
		DEFAULT => -7
	},
	{#State 31
		ACTIONS => {
			'la' => 33,
			'alg' => 34,
			'fib' => 35
		},
		GOTOS => {
			'Fio' => 32
		}
	},
	{#State 32
		DEFAULT => -9
	},
	{#State 33
		DEFAULT => -18
	},
	{#State 34
		DEFAULT => -17
	},
	{#State 35
		DEFAULT => -19
	}
],
                                  yyrules  =>
[
	[#Rule 0
		 '$start', 2, undef
	],
	[#Rule 1
		 'Lavanda', 2,
sub
#line 7 "lavanda.yp"
{ return { 'Cabec' => $_[1], 'Sacos' => $_[2] } }
	],
	[#Rule 2
		 'Cabec', 2,
sub
#line 11 "lavanda.yp"
{ return { 'Data' => $_[1], 'IdPR' => $_[2] } }
	],
	[#Rule 3
		 'Sacos', 2,
sub
#line 15 "lavanda.yp"
{ return $_[1] }
	],
	[#Rule 4
		 'Sacos', 3,
sub
#line 17 "lavanda.yp"
{ push @{$_[1]},@{$_[2]}; return $_[1] }
	],
	[#Rule 5
		 'Saco', 5,
sub
#line 21 "lavanda.yp"
{ return [ { 'Num' => $_[1], 'IdCli' => $_[2], 'Lotes' => $_[4] } ] }
	],
	[#Rule 6
		 'Lotes', 1,
sub
#line 25 "lavanda.yp"
{ return $_[1] }
	],
	[#Rule 7
		 'Lotes', 3,
sub
#line 27 "lavanda.yp"
{ push @{$_[1]},@{$_[3]}; return $_[1] }
	],
	[#Rule 8
		 'Lote', 2,
sub
#line 31 "lavanda.yp"
{ return [ { 'Tipo' => $_[1], 'Qt' => $_[2] } ] }
	],
	[#Rule 9
		 'Tipo', 5,
sub
#line 35 "lavanda.yp"
{ return { 'Classe' => $_[1], 'Tinto' => $_[3], 'Fio' => $_[5] } }
	],
	[#Rule 10
		 'IdPR', 1,
sub
#line 39 "lavanda.yp"
{ return $_[1] }
	],
	[#Rule 11
		 'IdCli', 1,
sub
#line 43 "lavanda.yp"
{ return $_[1] }
	],
	[#Rule 12
		 'Qt', 1,
sub
#line 47 "lavanda.yp"
{ return $_[1] }
	],
	[#Rule 13
		 'Classe', 1,
sub
#line 51 "lavanda.yp"
{ return $_[1] }
	],
	[#Rule 14
		 'Classe', 1,
sub
#line 53 "lavanda.yp"
{ return $_[1] }
	],
	[#Rule 15
		 'Tinto', 1,
sub
#line 57 "lavanda.yp"
{ return $_[1] }
	],
	[#Rule 16
		 'Tinto', 1,
sub
#line 59 "lavanda.yp"
{ return $_[1] }
	],
	[#Rule 17
		 'Fio', 1,
sub
#line 63 "lavanda.yp"
{ return $_[1] }
	],
	[#Rule 18
		 'Fio', 1,
sub
#line 65 "lavanda.yp"
{ return $_[1] }
	],
	[#Rule 19
		 'Fio', 1,
sub
#line 67 "lavanda.yp"
{ return $_[1] }
	]
],
                                  @_);
    bless($self,$class);
}

#line 71 "lavanda.yp"


package main;
use Data::Dumper;
my $File;
my $t = Run();

sub lexical_analyse {
	my $date = qr/\d{2}-\d{2}-\d{4}/;
	my $num = qr/\d+/;
	my $id = qr/[A-Za-z]+/;
	for ($File) {
		s/^\s+//;
		s/^corpo//i        and return ('corpo','corpo');
		s/^casa//i         and return ('casa','casa');
		s/^br//i           and return ('br','br');
		s/^cor//i          and return ('cor','cor');
		s/^alg//i          and return ('alg','alg');
		s/^la//i           and return ('la','la');
		s/^fib//i          and return ('fib','fib');
		s/^($id)//         and return ('id',$1);
		s/^($date)//       and return ('date',$1);
		s/^($num)//        and return ('num',$1);
		s/^([,.\(\)-])//   and return ($1,$1);
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
	my $parser = new lavanda();
	init_lex();
	my $value = $parser->YYParse( yylex => \&lexical_analyse, yyerror => \&yyerror );
	open OUT, ">parserlavanda";
	print OUT Dumper $value;
	close OUT;
}

sub init_lex{
	local $/;
    undef $/;
	$File = <>;
}
1;
