#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

use ANTLR::Runtime::ANTLRStringStream;
use ANTLR::Runtime::CommonTokenStream;
use t011lexer;

my $input = <>;

my $inputstream = ANTLR::Runtime::ANTLRStringStream->new({ input => $input });

my $lexer = t011lexer->new({ input => $inputstream });

$lexer->m_tokens();