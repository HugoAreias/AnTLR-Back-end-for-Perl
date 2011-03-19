#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

use ANTLR::Runtime::ANTLRStringStream;
use ANTLR::Runtime::CommonTokenStream;
use t015calcLexer;
use t015calcParser;

my $input = <>;

my $inputstream = ANTLR::Runtime::ANTLRStringStream->new({ input => $input });

my $lexer = t015calcLexer->new({ input => $inputstream });

my $tokens = ANTLR::Runtime::CommonTokenStream->new({ token_source => $lexer });

my $parser = t015calcParser->new({ input => $tokens });

print $parser->evaluate(), "\n";