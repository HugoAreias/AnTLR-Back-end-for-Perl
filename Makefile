.ONESHELL .SILENT:
lavanda :
	java org/antlr/Tool ./grammars/Lavanda2.g
	cp ./grammars/Lavanda2*.pm ./
	perl tests/lavanda.pl tests/lavanda10
	mv ./Lavanda2*.pm ./tests/

t011 :
	java org/antlr/Tool ./grammars/t011lexer.g
	cp ./grammars/t011lexer*.pm ./
	perl tests/t011.pl tests/t011input
	mv ./t011lexer*.pm ./tests/

t013 :
	java org/antlr/Tool ./grammars/t013parser.g
	cp ./grammars/t013parser*.pm ./
	perl tests/t013.pl tests/t013input
	mv ./t013parser*.pm ./tests/

t015 :
	java org/antlr/Tool ./grammars/t015calc.g
	cp ./grammars/t015calc*.pm ./
	perl tests/t015.pl tests/t015input
	mv ./t015calc*.pm ./tests/

t016 :
	java org/antlr/Tool ./grammars/t016actions.g
	cp ./grammars/t016actions*.pm ./
	perl tests/t016.pl tests/t016input
	mv ./t016actions*.pm ./tests/

t017 :
	java org/antlr/Tool ./grammars/t017parser.g
	cp ./grammars/t017parser*.pm ./
	perl tests/t017.pl tests/t017input
	mv ./t017parser*.pm ./tests/

edif :
	#java org/antlr/Tool ./EDIF.g
	perl edif.pl input

.PHONY: cleanall clean

cleanall : clean
	-rm *Parser.pm *Lexer.pm

clean :
	-rm *.tokens