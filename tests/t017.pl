#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

use ANTLR::Runtime::ANTLRStringStream;
use ANTLR::Runtime::CommonTokenStream;
use t017parserLexer;
use t017parserParser;

my $input = <>;

my $inputstream = ANTLR::Runtime::ANTLRStringStream->new({ input => $input });

my $lexer = t017parserLexer->new({ input => $inputstream });

my $tokens = ANTLR::Runtime::CommonTokenStream->new({ token_source => $lexer });

my $parser = t017parserParser->new({ input => $tokens });

$parser->program();