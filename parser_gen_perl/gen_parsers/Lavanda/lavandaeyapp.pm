########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.147.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'lavandaeyapp.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package lavandaeyapp;
use strict;

push @lavandaeyapp::ISA, 'Parse::Eyapp::Driver';


BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

#line 14 "lavandaeyapp.eyp"
use Data::Dumper;
#line 29 ./lavandaeyapp.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@lavandaeyapp::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.147',
    yyGRAMMAR  =>
[
  [ _SUPERSTART => '$start', [ 'Lavanda', '$end' ], 0 ],
  [ Lavanda_1 => 'Lavanda', [ 'Cabec', 'Sacos' ], 0 ],
  [ Cabec_2 => 'Cabec', [ 'date', 'IdPR' ], 0 ],
  [ _PAREN => 'PAREN-1', [ 'Saco', '.' ], 0 ],
  [ _PLUS_LIST => 'PLUS-2', [ 'PLUS-2', 'PAREN-1' ], 0 ],
  [ _PLUS_LIST => 'PLUS-2', [ 'PAREN-1' ], 0 ],
  [ Sacos_6 => 'Sacos', [ 'PLUS-2' ], 0 ],
  [ Saco_7 => 'Saco', [ 'num', 'IdCli', '(', 'Lotes', ')' ], 0 ],
  [ _PLUS_LIST => 'PLUS-3', [ 'PLUS-3', ',', 'Lote' ], 0 ],
  [ _PLUS_LIST => 'PLUS-3', [ 'Lote' ], 0 ],
  [ Lotes_10 => 'Lotes', [ 'PLUS-3' ], 0 ],
  [ Lote_11 => 'Lote', [ 'Tipo', 'Qt' ], 0 ],
  [ Tipo_12 => 'Tipo', [ 'Classe', '-', 'Tinto', '-', 'Fio' ], 0 ],
  [ IdPR_13 => 'IdPR', [ 'id' ], 0 ],
  [ IdCli_14 => 'IdCli', [ 'id' ], 0 ],
  [ Qt_15 => 'Qt', [ 'num' ], 0 ],
  [ Classe_16 => 'Classe', [ 'corpo' ], 0 ],
  [ Classe_17 => 'Classe', [ 'casa' ], 0 ],
  [ Tinto_18 => 'Tinto', [ 'br' ], 0 ],
  [ Tinto_19 => 'Tinto', [ 'cor' ], 0 ],
  [ Fio_20 => 'Fio', [ 'alg' ], 0 ],
  [ Fio_21 => 'Fio', [ 'la' ], 0 ],
  [ Fio_22 => 'Fio', [ 'fib' ], 0 ],
],
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'(' => { ISSEMANTIC => 0 },
	')' => { ISSEMANTIC => 0 },
	',' => { ISSEMANTIC => 0 },
	'-' => { ISSEMANTIC => 0 },
	'.' => { ISSEMANTIC => 0 },
	alg => { ISSEMANTIC => 1 },
	br => { ISSEMANTIC => 1 },
	casa => { ISSEMANTIC => 1 },
	cor => { ISSEMANTIC => 1 },
	corpo => { ISSEMANTIC => 1 },
	date => { ISSEMANTIC => 1 },
	fib => { ISSEMANTIC => 1 },
	id => { ISSEMANTIC => 1 },
	la => { ISSEMANTIC => 1 },
	num => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'lavandaeyapp.eyp',
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
			'Sacos' => 7,
			'PLUS-2' => 9,
			'PAREN-1' => 10
		}
	},
	{#State 3
		ACTIONS => {
			'' => 11
		}
	},
	{#State 4
		DEFAULT => -2
	},
	{#State 5
		DEFAULT => -13
	},
	{#State 6
		ACTIONS => {
			"." => 12
		}
	},
	{#State 7
		DEFAULT => -1
	},
	{#State 8
		ACTIONS => {
			'id' => 14
		},
		GOTOS => {
			'IdCli' => 13
		}
	},
	{#State 9
		ACTIONS => {
			'num' => 8
		},
		DEFAULT => -6,
		GOTOS => {
			'Saco' => 6,
			'PAREN-1' => 15
		}
	},
	{#State 10
		DEFAULT => -5
	},
	{#State 11
		DEFAULT => 0
	},
	{#State 12
		DEFAULT => -3
	},
	{#State 13
		ACTIONS => {
			"(" => 16
		}
	},
	{#State 14
		DEFAULT => -14
	},
	{#State 15
		DEFAULT => -4
	},
	{#State 16
		ACTIONS => {
			'casa' => 18,
			'corpo' => 20
		},
		GOTOS => {
			'Classe' => 17,
			'PLUS-3' => 19,
			'Lotes' => 23,
			'Lote' => 22,
			'Tipo' => 21
		}
	},
	{#State 17
		ACTIONS => {
			"-" => 24
		}
	},
	{#State 18
		DEFAULT => -17
	},
	{#State 19
		ACTIONS => {
			"," => 25
		},
		DEFAULT => -10
	},
	{#State 20
		DEFAULT => -16
	},
	{#State 21
		ACTIONS => {
			'num' => 26
		},
		GOTOS => {
			'Qt' => 27
		}
	},
	{#State 22
		DEFAULT => -9
	},
	{#State 23
		ACTIONS => {
			")" => 28
		}
	},
	{#State 24
		ACTIONS => {
			'br' => 29,
			'cor' => 30
		},
		GOTOS => {
			'Tinto' => 31
		}
	},
	{#State 25
		ACTIONS => {
			'casa' => 18,
			'corpo' => 20
		},
		GOTOS => {
			'Classe' => 17,
			'Lote' => 32,
			'Tipo' => 21
		}
	},
	{#State 26
		DEFAULT => -15
	},
	{#State 27
		DEFAULT => -11
	},
	{#State 28
		DEFAULT => -7
	},
	{#State 29
		DEFAULT => -18
	},
	{#State 30
		DEFAULT => -19
	},
	{#State 31
		ACTIONS => {
			"-" => 33
		}
	},
	{#State 32
		DEFAULT => -8
	},
	{#State 33
		ACTIONS => {
			'la' => 35,
			'alg' => 36,
			'fib' => 37
		},
		GOTOS => {
			'Fio' => 34
		}
	},
	{#State 34
		DEFAULT => -12
	},
	{#State 35
		DEFAULT => -21
	},
	{#State 36
		DEFAULT => -20
	},
	{#State 37
		DEFAULT => -22
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 291 ./lavandaeyapp.pm
	],
	[#Rule Lavanda_1
		 'Lavanda', 2,
sub {
#line 19 "lavandaeyapp.eyp"

           my @list = ();
           foreach (@{$_[2]}) {
            push @list, grep ref $_, @{$_};
           }
           return { 'Cabec' => $_[1], 'Sacos' => \@list }
          }
#line 304 ./lavandaeyapp.pm
	],
	[#Rule Cabec_2
		 'Cabec', 2,
sub {
#line 29 "lavandaeyapp.eyp"
 return { 'Data' => $_[1], 'IdPR' => $_[2] } }
#line 311 ./lavandaeyapp.pm
	],
	[#Rule _PAREN
		 'PAREN-1', 2,
sub {
#line 32 "lavandaeyapp.eyp"
 goto &Parse::Eyapp::Driver::YYActionforParenthesis}
#line 318 ./lavandaeyapp.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-2', 2,
sub {
#line 32 "lavandaeyapp.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 325 ./lavandaeyapp.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-2', 1,
sub {
#line 32 "lavandaeyapp.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 332 ./lavandaeyapp.pm
	],
	[#Rule Sacos_6
		 'Sacos', 1,
sub {
#line 33 "lavandaeyapp.eyp"
 return $_[1] }
#line 339 ./lavandaeyapp.pm
	],
	[#Rule Saco_7
		 'Saco', 5,
sub {
#line 37 "lavandaeyapp.eyp"

        my @list = grep ref $_, @{$_[4]};
        return { 'Num' => $_[1], 'IdCli' => $_[2], 'Lotes' => \@list };
       }
#line 349 ./lavandaeyapp.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-3', 3,
sub {
#line 43 "lavandaeyapp.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 356 ./lavandaeyapp.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-3', 1,
sub {
#line 43 "lavandaeyapp.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 363 ./lavandaeyapp.pm
	],
	[#Rule Lotes_10
		 'Lotes', 1,
sub {
#line 44 "lavandaeyapp.eyp"
 return $_[1] }
#line 370 ./lavandaeyapp.pm
	],
	[#Rule Lote_11
		 'Lote', 2,
sub {
#line 48 "lavandaeyapp.eyp"
 return { 'Tipo' => $_[1], 'Qt' => $_[2] } }
#line 377 ./lavandaeyapp.pm
	],
	[#Rule Tipo_12
		 'Tipo', 5,
sub {
#line 52 "lavandaeyapp.eyp"
 return { 'Classe' => $_[1], 'Tinto' => $_[3], 'Fio' => $_[5] } }
#line 384 ./lavandaeyapp.pm
	],
	[#Rule IdPR_13
		 'IdPR', 1,
sub {
#line 56 "lavandaeyapp.eyp"
 return $_[1] }
#line 391 ./lavandaeyapp.pm
	],
	[#Rule IdCli_14
		 'IdCli', 1,
sub {
#line 60 "lavandaeyapp.eyp"
 return $_[1] }
#line 398 ./lavandaeyapp.pm
	],
	[#Rule Qt_15
		 'Qt', 1,
sub {
#line 64 "lavandaeyapp.eyp"
 return $_[1] }
#line 405 ./lavandaeyapp.pm
	],
	[#Rule Classe_16
		 'Classe', 1,
sub {
#line 68 "lavandaeyapp.eyp"
 return $_[1] }
#line 412 ./lavandaeyapp.pm
	],
	[#Rule Classe_17
		 'Classe', 1,
sub {
#line 70 "lavandaeyapp.eyp"
 return $_[1] }
#line 419 ./lavandaeyapp.pm
	],
	[#Rule Tinto_18
		 'Tinto', 1,
sub {
#line 74 "lavandaeyapp.eyp"
 return $_[1] }
#line 426 ./lavandaeyapp.pm
	],
	[#Rule Tinto_19
		 'Tinto', 1,
sub {
#line 76 "lavandaeyapp.eyp"
 return $_[1] }
#line 433 ./lavandaeyapp.pm
	],
	[#Rule Fio_20
		 'Fio', 1,
sub {
#line 80 "lavandaeyapp.eyp"
 return $_[1] }
#line 440 ./lavandaeyapp.pm
	],
	[#Rule Fio_21
		 'Fio', 1,
sub {
#line 82 "lavandaeyapp.eyp"
 return $_[1] }
#line 447 ./lavandaeyapp.pm
	],
	[#Rule Fio_22
		 'Fio', 1,
sub {
#line 84 "lavandaeyapp.eyp"
 return $_[1] }
#line 454 ./lavandaeyapp.pm
	]
],
#line 457 ./lavandaeyapp.pm
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
         Lavanda_1
         Cabec_2
         _PAREN
         Sacos_6
         Saco_7
         Lotes_10
         Lote_11
         Tipo_12
         IdPR_13
         IdCli_14
         Qt_15
         Classe_16
         Classe_17
         Tinto_18
         Tinto_19
         Fio_20
         Fio_21
         Fio_22} );
  $self;
}

#line 88 "lavandaeyapp.eyp"


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
	my $parser = new lavandaeyapp();
	init_lex();
	my $value = $parser->YYParse( yylex => \&lexical_analyse, yyerror => \&yyerror );
	open OUT, ">parserlavandaEyapp";
	print OUT Dumper $value;
	close OUT;
}

sub init_lex{
	local $/;
    undef $/;
	$File = <>;
}

=for None

=cut



#line 547 ./lavandaeyapp.pm

1;
