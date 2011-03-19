#!/usr/bin/perl

use strict;
use warnings;
use GetOpt::Long;
use Pod::Usage;
use File::Slurp;
use Regexp::Common qw(balanced);
use Data::Dumper;

my $grammar = $ARGV[0];
my $text = read_file('Lavanda2.g');

# regular expression to grab sentences within ''
my $bpe = qr('(?:\\'|[^'])*');
# regular expression to grab sentences within ""
my $bas = qr("(?:\\"|[^"])*");
# variable to control the replacing order
my $n = 0;
# hash to store all the modified code
my %hash = ();

# appliance of the $bpe and $bas regular expressions
$text =~ s!($bpe|$bas)!$hash{$n}=$1; ' _Rep'.$n++.'_'!ge;
# replaces by the "Rep" tag the code blocks surrounded by curly brackets
$text =~ s/$RE{balanced}{-keep}{-parens => '{}'}/$hash{$n} = $1; ' _Rep'.$n++.'_';/ge;
# grabs the information of a production and starts the escaping process
while ( $text =~ m/([\w|\d]+)\s*(?=\[|returns|:)((?:[^:])*):(.+?);/gs ) {
	escape_dollar({
		name   => $1,
		args   => $2,
		sem    => $3
	});
}

$text =~ s/([\w|\d]+)(\s*)(?=\[|returns|:)((?:[^:])*)(:)(.+?)(;)/$1$2$3$4 _Rep$1\_$6/gs;
# escapes the Perl symbols found in the AnTLR special blocks
$text = escape_special_blocks($text);
# returns the modified code for the same blocks
$text = decrypt_special_blocks($text);
# returns all the code properly modified
$text = decrypt_text($text);

write_file('Lavanda2New.g',$text);

# escapes recursively the Perl symbols in the members, init, parserinit, etc., blocks
sub escape_special_blocks {
	my ($str) = shift;
	while ( $str =~ m/\@\w+\s*\s_Rep(\d+)_/gs ) {
		escape_recursive($1,$hash{$1},());
	}
	return $str;
}

# replaces the "Rep" tags found in the special blocks by the corresponding Perl code
sub decrypt_special_blocks {
	my ($str) = shift;
	while ( $str =~ s/(\@\w+\s*)(\s_Rep(\d+)_)/
		if ( defined $hash{$3} ) { $1.$hash{$3} }
		else {$1}/gsex ) {
			decrypt_special_blocks($str);
	}
	return $str;
}

# replaces the "Rep" tags found in the semantic rules for the corresponding Perl code
sub decrypt_text {
	my ($str) = shift;
	while ( $str =~ s/(\s_Rep([\w|\d]+)_)/
		if ( defined $hash{$2} ) { $hash{$2} }
		else {}/gsex ) {
			decrypt_text($str);
	}
	return $str;
}

# escapes the Perl symbols found in a production
sub escape_dollar {
	my ($prod) = @_;
	# stores the name of the production, its attributes and predicates
	my %notesc;
	$notesc{'$'.$prod->{name}} = 1;
	if ( defined $prod->{args} && defined $prod->{sem} ) {
		# grabs the production attributes
		my $tmpstr = $prod->{args};
		# replaces the attribute definitions found in the protype of the production in the AnTLR metalanguage notation
		$tmpstr =~ s/$RE{balanced}{-keep}{-parens => '[]'}/$hash{$n} = $1; ' _Rep'.$n++.'_';/ge;
		# loop responsible for grabbing the attributes associated with a given production
		while ( $tmpstr =~ m/_Rep(\d+)_/gs ) {
			my $rep = $hash{$1};
			$rep = trim($rep);
			if ( $rep =~ m/^\[(.+)\]$/gs ) {
				my @args = split /,/, $1;
				foreach (@args) {
					my @list = $_ =~ m/(?<!=)(\$\w+)/gs;
					@notesc{@list} = 1;
				}
			}
		}
		# grabs the predicates
		$tmpstr = $prod->{sem};
		$tmpstr =~ s/\$\w+|_Rep\d+_//gs;
		my @list = $tmpstr =~ m/(\w+)/gs;
		@list = map ( '$'.$_, @list );
		@notesc{@list} = 1;
	}
	# if the production has associated semantic actions
	if ( defined $prod->{sem} ) {
		# escapes attributes in production rules
		$prod->{sem} =~ s/(?<!\\)(\$\w+)/if (exists $notesc{$1}) { $1 }
			else { '\\'.$1 } /gsxe;
		$hash{$prod->{name}} = $prod->{sem};
		# recursively escapes attributes in semantic rules
		escape_recursive(-1,$prod->{sem},%notesc);
	}
	# returns the modified production
	return $prod;
}

# escapes the Perl symbols found in the semantic rules of a production
sub escape_recursive {
	my ($index,$semrules,%notesc) = @_;
	while ( $semrules =~ m/_Rep(\d+)_/gs ) {
		escape_recursive($1,$hash{$1},%notesc);
	}
	# condition to skip the first iteration of this function
	if ( $index > -1 ) {
		$hash{$index} =~ s/(?<!\\)(\$\w+)/if (exists $notesc{$1}) { $1 }
			else { '\\'.$1 } /gsxe;
	}
	return;
}

# removes all the spaces of a given string
sub trim {
	my ($str) = shift;
	$str =~ s/\s+//g;
	return $str;
}

__END__

my $man = 0;
my $help = 0;

GetOptions('help|?' => \$help, man => \$man) or pod2usage(2);
pod2usage(1) if $help;
pod2usage(-exitstatus => 0, -verbose => 2) if $man;

=head1 NAME

sample - Using Getopt::Long and Pod::Usage

=head1 SYNOPSIS

sample [options] [file ...]

 Options:
   -help            brief help message
   -man             full documentation
   -input           input source
   -grammar         grammar path
   -main            generate main
   -tgz             create tgz
   -output          output path

=head1 OPTIONS

=over 8

=item B<-help>

Print a brief help message and exits.

=item B<-man>

Prints the manual page and exits.

=back

=head1 DESCRIPTION

B<This program> will read the given input file(s) and do something
useful with the contents thereof.

=cut