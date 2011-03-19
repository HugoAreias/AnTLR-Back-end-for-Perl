#!/usr/bin/perl

use strict;
use warnings;
use Regexp::Grammars;
use Data::Dumper;

my $parser = qr{
    <Lavanda>

    <rule: Lavanda>    <Cabec> <Sacos> (?{ $MATCH = { Cabec => $MATCH{Cabec}, Sacos => $MATCH{Sacos} } })

    <rule: Cabec>      <date> <IdPR> (?{ $MATCH = { Data => $MATCH{date}, IdPR => $MATCH{IdPR} } })

    <rule: Sacos>      (?: <[MATCH=Saco]> ( \. ))+

    <rule: Saco>       <num> <IdCli> \( <Lotes> \) (?{ $MATCH = { Num => $MATCH{num}, IdCli => $MATCH{IdCli}, Lotes => $MATCH{Lotes} } })

    <rule: Lotes>      <[MATCH=Lote]> ** ( , )

	<rule: Lote>       <Tipo> <Qt> (?{ $MATCH = { Tipo => $MATCH{Tipo}, Qt => $MATCH{Qt} } })
	
	<rule: Tipo>       <Classe> - <Tinto> - <Fio> (?{ $MATCH = { Classe => $MATCH{Classe}, Tinto => $MATCH{Tinto}, Fio => $MATCH{Fio} } })

    <rule: IdPR>       <MATCH=id>

    <rule: IdCli>      <MATCH=id>

    <rule: Qt>         <MATCH=num>

	<rule: Classe>     ([Cc][Oo][Rr][Pp][Oo] | [Cc][Aa][Ss][Aa]) (?{ $MATCH = $CAPTURE })

	<rule: Tinto>      ([Bb][Rr] | [Cc][Oo][Rr]) (?{ $MATCH = $CAPTURE })

	<rule: Fio>        ([Aa][Ll][Gg] | [Ll][Aa] | [Ff][Ii][Bb]) (?{ $MATCH = $CAPTURE })

    <token: num>       (\d+) (?{ $MATCH = $CAPTURE })

    <token: date>      (\d{2}-\d{2}-\d{4}) (?{ $MATCH = $CAPTURE })

    <token: id>        ([A-Za-z]+) (?{ $MATCH = $CAPTURE })

}x;

my $res = Run();

sub Run {
	local $/;
	undef $/;
	my $text = <>;

	if ($text =~ $parser) {
		open OUT, ">parserlavandaregexp";
		print OUT Dumper $/{Lavanda};
		close OUT;
	}
}