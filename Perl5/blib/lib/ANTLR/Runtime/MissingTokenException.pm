package ANTLR::Runtime::MissingTokenException;

use Moose;

use overload
    '""' => \&to_string;

extends 'ANTLR::Runtime::MismatchedTokenException';

has 'inserted' => (
    is  => 'ro',
    isa => 'Any',
);

sub get_missing_type {
    my ($self) = @_;
    return $self->expecting;
}

sub to_string {
    my ($self) = @_;

    if (defined (my $inserted = $self->inserted) && defined (my $token = $self->token)) {
		# trick to call to_string for Tokens
		if ( ref $inserted eq 'ANTLR::Runtime::CommonToken' ) {
			return "MissingTokenException(inserted " . $inserted->to_string() . " at " . $token->get_text() . ")";
		}
		else {
			return "MissingTokenException(inserted $inserted at " . $token->get_text() . ")";
		}
    }
    if (defined $self->token) {
        return "MissingTokenException(at " . $self->token->get_text() . ")";
    }

    return "MissingTokenException";
}

no Moose;
__PACKAGE__->meta->make_immutable();
1;
__END__

=head1 NAME

ANTLR::Runtime::MissingTokenException

=head1 DESCRIPTION

We were expecting a token but it's not found.  The current token
is actually what we wanted next.  Used for tree node errors too.