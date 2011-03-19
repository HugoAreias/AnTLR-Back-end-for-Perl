#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

use ANTLR::Runtime::ANTLRStringStream;
use ANTLR::Runtime::CommonTokenStream;
use t013parserLexer;
use t013parserParser;

my $input = <>;

my $inputstream = ANTLR::Runtime::ANTLRStringStream->new({ input => $input });

my $lexer = t013parserLexer->new({ input => $inputstream });

my $tokens = ANTLR::Runtime::CommonTokenStream->new({ token_source => $lexer });

my $parser = t013parserParser->new({ input => $tokens });

$parser->document();
print Dumper $parser->get_identifier();