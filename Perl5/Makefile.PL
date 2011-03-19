use ExtUtils::MakeMaker;

sub MY::postamble {
    my $postamble = <<'MAKE_FRAG';
.PHONY: tags

tags:
	ctags -f tags --recurse --totals \
		--exclude=blib \
		--exclude='*~' \
		--languages=Perl --langmap=Perl:+.t \
MAKE_FRAG
}

WriteMakefile(
    NAME          => 'ANTLR::Runtime',
    VERSION_FROM  => 'lib/ANTLR/Runtime.pm',
    LICENSE       => 'perl',
    ABSTRACT_FROM => 'lib/ANTLR/Runtime.pm',
    AUTHOR        => 'Ronald Blaschke <ron@rblasch.org> and Hugo Areias <hugomsareias@gmail.com>',
    PREREQ_PM     => {
                      'Carp'              => '1.04',
                      'Moose'             => '1.12',
                      'Test::Class'       => '0.35',
                      'Test::More'        => '0.94',
                      'Try::Tiny'         => '0.06',
                      'Data::Lock'        => '0.02',
                      'Exception::Class'  => '1.32',
                     },
    # test          => { TESTS => 't/*.t t/examples/*.t' },
    test          => { TESTS => 'classes_tests/perl_tests/*.t' },
);
