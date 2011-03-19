package ANTLR::Runtime::Parser;

use Moose;

extends 'ANTLR::Runtime::BaseRecognizer';

has 'input' => (
    is   => 'rw',
    does => 'Maybe[ANTLR::Runtime::TokenStream]',
    required => 1
);

sub BUILD {
	my ($self,$args) = @_;
	$self->set_token_stream($args->{input}) if (exists $args->{input});
	return;
}

sub reset {
    my ($self) = @_;

    $self->SUPER::reset();  #  reset all recognizer state variables
    if (defined $self->input) {
        $self->input->seek(0);  # rewind the input
    }
	return;
}

sub get_current_input_symbol {
    my ($self, $input) = @_;
    return $self->input->LT(1);
}

sub get_missing_symbol {
    my ($self, $arg_ref) = @_;
    my $input = $arg_ref->{input};
    my $exception = $arg_ref->{exception};
    my $expected_token_type = $arg_ref->{expected_token_type};
    my $follow = $arg_ref->{follow};

    my $token_text;
    if ($expected_token_type == ANTLR::Runtime::Token->EOF) {
        $token_text = '<missing EOF>';
    }
    else {
        $token_text = '<missing ' . $self->get_token_names()->[$expected_token_type] . '>';
    }

    my $t = ANTLR::Runtime::CommonToken->new({
        type => $expected_token_type,
        text => $token_text
    });
    my $current = $input->LT(1);
    if ($current->get_type() == ANTLR::Runtime::Token->EOF) {
        $current = $input->LT(-1);
    }
    $t->set_line($current->get_line());
    $t->set_char_position_in_line($current->get_char_position_in_line());
    $t->set_channel($self->DEFAULT_TOKEN_CHANNEL);

    return $t;
}

# Set the token stream and reset the parser
sub set_token_stream {
    my ($self, $input) = @_;
    $self->input(undef);
    $self->reset();
    $self->input($input);
	return;
}

sub get_token_stream {
    my ($self) = @_;
    return $self->input;
}

sub get_source_name {
    my ($self) = @_;
    return $self->input->get_source_name();
}

sub trace_in {
    my ($self, $rule_name, $rule_index) = @_;
    $self->SUPER::trace_in($rule_name, $rule_index, $self->input->LT(1));
	return;
}

sub trace_out {
    my ($self, $rule_name, $rule_index) = @_;
    $self->SUPER::trace_out($rule_name, $rule_index, $self->input->LT(1));
	return;
}

no Moose;
__PACKAGE__->meta->make_immutable();
1;
__END__

=head1 NAME

ANTLR::Runtime::Parser

=head1 DESCRIPTION

A parser for TokenStreams.  "parser grammars" result in a subclass of this.