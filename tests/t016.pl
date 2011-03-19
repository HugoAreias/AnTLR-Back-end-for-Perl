#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

use ANTLR::Runtime::ANTLRStringStream;
use ANTLR::Runtime::CommonTokenStream;
use t016actionsLexer;
use t016actionsParser;

my $input = <>;

my $inputstream = ANTLR::Runtime::ANTLRStringStream->new({ input => $input });

my $lexer = t016actionsLexer->new({ input => $inputstream });

my $tokens = ANTLR::Runtime::CommonTokenStream->new({ token_source => $lexer });

my $parser = t016actionsParser->new({ input => $tokens });

print Dumper $parser->declaration(), "\n";