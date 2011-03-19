#! /usr/bin/perl

use strict;
use warnings;
use Parse::RecDescent;
use Data::Dumper;

my $lexer = new Parse::RecDescent q
{
    Lavanda : Cabec Sacos
	         { $return = { 'Cabec' => $item{Cabec}, 'Sacos' => $item{Sacos} } }

	Cabec : date IdPR
	        { $return = { 'Data' => $item{date}, 'IdPR' => $item{IdPR} } }

	Sacos : Auxiliar(s)
	        { $return = $item[1] }

    Auxiliar : Saco '.'
            { $return = $item{Saco} }

	Saco : num IdCli '(' Lotes ')'
	       { $return = { 'Num' => $item{num}, 'IdCli' => $item{IdCli}, 'Lotes' => $item{Lotes} } }

	Lotes : Lote(s /,/)
	        { $return = $item[1] }

	Lote : Tipo Qt
	       { $return = { 'Tipo' => $item{Tipo}, 'Qt' => $item{Qt} } }

	Tipo : Classe '-' Tinto '-' Fio
	       { $return = { 'Classe' => $item{Classe}, 'Tinto' => $item{Tinto}, 'Fio' => $item{Fio} } }

	IdPR : id
	       { $return = $item{id} }

	IdCli : id
	        { $return = $item{id} }

	Qt : num
	     { $return = $item{num} }

	Classe : /corpo/i
	         { $return = $item[1] }
	       | /casa/i
	         { $return = $item[1] }

	Tinto : /br/i
	        { $return = $item[1] }
	      | /cor/i
	        { $return = $item[1] }

	Fio : /alg/i
	      { $return = $item[1] }
	    | /la/i
	      { $return = $item[1] }
	    | /fib/i
	      { $return = $item[1] }

    num : /\d+/
          { $return = $item[1] }

    date : /\d{2}-\d{2}-\d{4}/
           { $return = $item[1] }

    id : /[A-Za-z]+/
         { $return = $item[1] }
};

# my $grammar = q
# {
#     Lavanda : Cabec Sacos
# 	         { $return = { 'Cabec' => $item{Cabec}, 'Sacos' => $item{Sacos} } }
# 
# 	Cabec : date IdPR
# 	        { $return = { 'Data' => $item{date}, 'IdPR' => $item{IdPR} } }
# 
# 	Sacos : Auxiliar(s)
# 	        { $return = $item[1] }
# 
#     Auxiliar : Saco '.'
#             { $return = $item{Saco} }
# 
# 	Saco : num IdCli '(' Lotes ')'
# 	       { $return = { 'Num' => $item{num}, 'IdCli' => $item{IdCli}, 'Lotes' => $item{Lotes} } }
# 
# 	Lotes : Lote(s /,/)
# 	        { $return = $item[1] }
# 
# 	Lote : Tipo Qt
# 	       { $return = { 'Tipo' => $item{Tipo}, 'Qt' => $item{Qt} } }
# 
# 	Tipo : Classe '-' Tinto '-' Fio
# 	       { $return = { 'Classe' => $item{Classe}, 'Tinto' => $item{Tinto}, 'Fio' => $item{Fio} } }
# 
# 	IdPR : id
# 	       { $return = $item{id} }
# 
# 	IdCli : id
# 	        { $return = $item{id} }
# 
# 	Qt : num
# 	     { $return = $item{num} }
# 
# 	Classe : /corpo/i
# 	         { $return = $item[1] }
# 	       | /casa/i
# 	         { $return = $item[1] }
# 
# 	Tinto : /br/i
# 	        { $return = $item[1] }
# 	      | /cor/i
# 	        { $return = $item[1] }
# 
# 	Fio : /alg/i
# 	      { $return = $item[1] }
# 	    | /la/i
# 	      { $return = $item[1] }
# 	    | /fib/i
# 	      { $return = $item[1] }
# 
#     num : /\d+/
#           { $return = $item[1] }
# 
#     date : /\d{2}-\d{2}-\d{4}/
#            { $return = $item[1] }
# 
#     id : /[A-Za-z]+/
#          { $return = $item[1] }
# };
# 
# Parse::RecDescent->Precompile($grammar,"LavandaRecDescent");

my $res = Run();

sub Run{
	local $/;
	undef $/;
	open OUT, ">parserlavandarec";
	my $text = <>;
	print OUT Dumper $lexer->Lavanda(\$text);
	close OUT;
}