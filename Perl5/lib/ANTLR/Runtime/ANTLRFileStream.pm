package ANTLR::Runtime::ANTLRFileStream;

use Carp;
use Try::Tiny;

use Moose;

extends 'ANTLR::Runtime::ANTLRStringStream';

has 'file_name' => (
    is  => 'ro',
    isa => 'Str',
    required => 1,
);

sub BUILDARGS {
    my ($class, @args) = @_;
    my $args = $class->SUPER::BUILDARGS(@args);

    my $file_name = $args->{file_name};
    if (!defined $file_name) {
        return;
    }

    my $fh;
    my $encoding = $args->{encoding};
    if (defined $encoding) {
        open $fh, "<:encoding($encoding)", $file_name
            or croak "Can't open $file_name: $!";
    }
    else {
        open $fh, '<', $file_name
            or croak "Can't open $file_name: $!";
    }

	my $content;
	try {
		 {
	         local $/;
	         $content = <$fh>;
	     }
	}
	finally {
		close $fh or carp "Can't close $fh: $!";
	};

	croak "File $file_name is empty!" if ( !defined $content );
	
	my @chararray = ();
	@chararray = split //, $content;
	$args->{input} = \@chararray;
    # $args->{input} = $content;

    return $args;
}

sub load {
    my ($self, $file_name, $encoding) = @_;

    if (!defined $file_name) {
        return;
    }

    my $fh;
    if (defined $encoding) {
        open $fh, "<:encoding($encoding)", $file_name
            or croak "Can't open $file_name: $!";
    }
    else {
        open $fh, '<', $file_name
            or croak "Can't open $file_name: $!";
    }

    my $content;
	try {
		{
	        local $/;
	        $content = <$fh>;
	    }
	}
	finally {
		close $fh or carp "Can't close $fh: $!";
	}

    $self->input($content);
    return;
}

sub get_source_name {
    my ($self) = @_;
    return $self->file_name;
}

no Moose;
__PACKAGE__->meta->make_immutable();
1;
__END__

=head1 NAME

ANTLR::Runtime::ANTLRFileStream

=head1 DESCRIPTION

This is a char buffer stream that is loaded from a file
all at once when you construct the object.  This looks very
much like an ANTLReader or ANTLRInputStream, but it's a special case
since we know the exact size of the object to load.  We can avoid lots
of data copying.