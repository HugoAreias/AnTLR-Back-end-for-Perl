#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

use ANTLR::Runtime::ANTLRStringStream;
use ANTLR::Runtime::CommonTokenStream;
use Lavanda2Lexer;
use Lavanda2Parser;

$/=undef;
$/='';

my $input = <>;
	
my $inputstream = ANTLR::Runtime::ANTLRStringStream->new({ input => $input });
	
my $lexer = Lavanda2Lexer->new({ input => $inputstream });
	
my $tokens = ANTLR::Runtime::CommonTokenStream->new({ token_source => $lexer });
	
my $parser = Lavanda2Parser->new({ input => $tokens });
	
print $parser->lavanda();


__END__