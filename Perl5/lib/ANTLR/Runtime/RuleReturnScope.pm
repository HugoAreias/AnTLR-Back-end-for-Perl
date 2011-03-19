package ANTLR::Runtime::RuleReturnScope;

use Moose;

# Return the start token or tree
sub get_start {
    return;
}

# Return the stop token or tree
sub get_stop {
    return;
}

# Has a value potentially if output=AST;
sub get_tree {
    return;
}

# Has a value potentially if output=template; Don't use StringTemplate
# type as it then causes a dependency with ST lib.
sub get_template {
    return;
}

no Moose;
__PACKAGE__->meta->make_immutable();
1;
__END__

=head1 NAME

ANTLR::Runtime::RuleReturnScope

=head1 DESCRIPTION

Rules can return start/stop info as well as possible trees and templates