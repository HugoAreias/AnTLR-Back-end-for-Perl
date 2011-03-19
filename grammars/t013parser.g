grammar t013parser;
options {
  language = Perl5;
}

@parser::members {

# has 'identifier' => ( is => 'rw', isa => 'ArrayRef[Str]', default => sub{ [] } );
# has 'reported_errors' => ( is => 'rw', isa => 'ArrayRef[Str]', default => sub{ [] } );

my \$identifier = [];
my \$reported_errors = [];

sub found_identifier {
	my (\$self,\$name) = @_;
	push @{\$identifier},\$name;
	return;
}

sub emit_error_message {
	my (\$self,\$msg) = @_;
	push @{\$reported_errors},\$msg;
	return;
}

sub get_identifier {
	my (\$self) = @_;
	return \$identifier;
}

sub get_error_message {
	my (\$self) = @_;
	return \$reported_errors;
}

}

document:
        t=IDENTIFIER {\$self->found_identifier($t.text)}
        ;

IDENTIFIER: ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*;
