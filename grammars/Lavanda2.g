grammar Lavanda2;
options {
  language = Perl5;
}

@members {
my \$inTable = {};
}

lavanda
	: cabec sacos 
	    {
print 'Total sacos: ' . $sacos.nSacos . "\n";
foreach ( keys \%{$sacos.outEnv} ) {
	print "\$_\t" . $sacos.outEnv->{\$_} . "\n";
}
        }
	;
	
cabec
	: DATA ID
	;
	
sacos returns [ $nSacos = 0, $outEnv = {} ]
@init {
my \$clientIds = {};
my \$bagIds    = {};
my \$inEnv     = {};            }
	: ( saco[\$inEnv, \$clientIds, \$bagIds] { $nSacos++; $outEnv = $saco.outEnv; } )+
	;
	
saco [ $inEnv, $clientIds, $bagIds ] returns [ $outEnv ]
	:  NUM {
if(defined $bagIds->{$NUM.text}) { print "Bag ID already exists!\n" }
$bagIds->{$NUM.text} = 1; }
	   ID  {
if(defined $clientIds->{$ID.text}) { print "Client ID already exists!\n" }
$clientIds->{$ID.text} = 1; }
	   '(' lotes[$inEnv] ')' {
print 'Numero de lotes para o ID ' . $ID.text . ': ' . $lotes.nLotes . "\n";
print ' Custo: ' . $lotes.custoTotal . "\n";
$outEnv = $lotes.outEnv; }
	;
	
lotes [ $inEnv ] returns [ $outEnv, $nLotes = 0, $custoTotal = 0 ]
	: l1=lote[$inEnv]  { $nLotes++; $custoTotal += $l1.custoTotal; $outEnv = $l1.outEnv; }
	  (',' l2=lote[$outEnv] { $nLotes++; $custoTotal += $l2.custoTotal; $outEnv = $l2.outEnv; } )*
	;
	
lote [ $inEnv ] returns [ $custoTotal, $outEnv ]
	: tipo NUM {
$custoTotal = $NUM.text;
if(!defined $inEnv->{$tipo.name}) { $inEnv->{$tipo.name} = 0 }
$inEnv->{$tipo.name}++;
$outEnv = $inEnv; }
	;
	
tipo returns [ $name ]
	: classe '-' tinto '-' fio { $name = $classe.name . '-' . $tinto.name . '-' . $fio.name; }
	;
	
classe returns [ $name ]
	: 'corpo' { $name = 'corpo'; }
	| 'casa'  { $name = 'casa';  }
	;

tinto returns [ $name ]
	: 'br'   { $name = 'br';  }
	| 'cor'  { $name = 'cor'; }
	;
	
fio returns [ $name ]
	: 'alg'  { $name = 'alg'; }
	| 'la'   { $name = 'la';  }
	| 'fib'  { $name = 'fib'; }
	;
	
fragment
LETTER  : 'a'..'z'|'A'..'Z' ;
fragment
DIGIT   : '0'..'9' ;	
	
ID    : LETTER+;
NUM   : DIGIT+;
DATA  : DIGIT DIGIT '-' DIGIT DIGIT '-' DIGIT DIGIT DIGIT DIGIT ;
WS    : ('\r'|'\n'|' '|'\t')+ {$self->skip();} ;
