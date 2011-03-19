package ANTLR::Runtime::DFA;

# use Data::Lock qw( dlock );
use Try::Tiny;

use Moose;

has 'eot' => (
    is  => 'rw',
    isa => 'ArrayRef[Int]',
);

has 'eof' => (
    is  => 'rw',
    isa => 'ArrayRef[Int]',
);

has 'min' => (
    is  => 'rw',
    isa => 'ArrayRef[Str]',
);

has 'max' => (
    is  => 'rw',
    isa => 'ArrayRef[Str]',
);

has 'accept' => (
    is  => 'rw',
    isa => 'ArrayRef[Int]',
);

has 'special' => (
    is  => 'rw',
    isa => 'ArrayRef[Int]',
);

has 'transition' => (
    is  => 'rw',
    isa => 'ArrayRef[ArrayRef[Int]]',
);

has 'decision_number' => (
    is  => 'rw',
    isa => 'Int',
);


# Which recognizer encloses this DFA?  Needed to check backtracking
has 'recognizer' => (
    is  => 'rw',
    isa => 'ANTLR::Runtime::BaseRecognizer',
);

# dlock( my $debug = 0 );
# sub debug { return $debug }

sub get_description {
    return "n/a";
}

# From the input stream, predict what alternative will succeed
# using this DFA (representing the covering regular approximation
# to the underlying CFL).  Return an alternative number 1..n.  Throw
# an exception upon error.
sub predict {
    my ($self, $input) = @_;

	# if ( debug ) {
	# 	System.err.println("Enter DFA.predict for decision "+decisionNumber);
	# }

    my $mark = $input->mark();  # remember where decision started in input
    my $s = 0; # we always start at s0
	my $rv = 0; # holds the return value, since Try::Tiny does not support return inside try block

    try {
        while (1) {
			# if ( debug ) System.err.println("DFA "+decisionNumber+" state "+s+" LA(1)="+(char)input.LA(1)+"("+input.LA(1)+
			# 								"), index="+input.index());
            my $special_state = $self->special->[$s];
            if ($special_state >= 0) {
				# if ( debug ) {
				# 	System.err.println("DFA "+decisionNumber+
				# 		" state "+s+" is special state "+specialState);
				# }
                $s = $self->special_state_transition($special_state, $input);
				# if ( debug ) {
				# 	System.err.println("DFA "+decisionNumber+
				# 		" returns from special state "+specialState+" to "+s);
				# }
                if ($s == -1) {
                    $self->no_viable_alt($s, $input);
                    last;
                    # return 0;
                }
                $input->consume();
                next;
            }

            if ($self->accept->[$s] >= 1) {
				# if ( debug ) System.err.println("accept; predict "+accept[s]+" from state "+s);
				$rv = $self->accept->[$s];
				last;
                # return $self->accept->[$s];
            }

	    	# look for a normal char transition
            my $c = $input->LA(1);  # -1 == \uFFFF, all tokens fit in 65000 space

			# differentiate InputStream from CharStream
			$c = ord($c) if ($input->isa('ANTLR::Runtime::ANTLRStringStream'));

            if ($c >= $self->min->[$s] && $c <= $self->max->[$s]) {
                my $next_s = $self->transition->[$s][$c - $self->min->[$s]];  # move to next state
                if ($next_s < 0) {
                    # was in range but not a normal transition
                    # must check EOT, which is like the else clause.
                    # eot[s]>=0 indicates that an EOT edge goes to another
                    # state.
                    if ($self->eot->[$s] >= 0) {  # EOT Transition to accept state?
						# if ( debug ) System.err.println("EOT transition");
                        $s = $self->eot->[$s];
                        $input->consume();
                        # TODO: I had this as return accept[eot[s]]
                        # which assumed here that the EOT edge always
                        #went to an accept...faster to do this, but
                        # what about predicated edges coming from EOT
                        # target?
                        next;
                    }

                    $self->no_viable_alt($s, $input);
                    last;
                    # return 0;
                }

                $s = $next_s;
                $input->consume();
                next;
            }

	    	if ($self->eot->[$s] >= 0) {  # EOT Transition?
				# if ( debug ) System.err.println("EOT transition");
				$s = $self->eot->[$s];
				$input->consume();
				next;
	    	}

	    	if ($c eq ANTLR::Runtime::Token->EOF && $self->eof->[$s] >= 0) {  # EOF Transition to accept state?
				# if ( debug ) System.err.println("accept via EOF; predict "+accept[eof[s]]+" from "+eof[s]);
				$rv = $self->accept->[$self->eof->[$s]];
				last;
				# return $self->accept->[$self->eof->[$s]];
	    	}

	    	# not in range and not EOF/EOT, must be invalid symbol
			# if ( debug ) {
			# 	System.err.println("min["+s+"]="+min[s]);
			# 	System.err.println("max["+s+"]="+max[s]);
			# 	System.err.println("eot["+s+"]="+eot[s]);
			# 	System.err.println("eof["+s+"]="+eof[s]);
			# 	for (int p=0; p<transition[s].length; p++) {
			# 		System.err.print(transition[s][p]+" ");
			# 	}
			# 	System.err.println();
			# }
	    	$self->no_viable_alt($s, $input);
	    	last;
	    	# return 0;
        }
    }
    finally {
		$input->rewind($mark);
    };

    return $rv;
}

sub no_viable_alt {
    my ($self, $s, $input) = @_;

    if ($self->recognizer->state->backtracking > 0) {
		$self->recognizer->state->failed = 1;
		return;
    }
    my $nvae = ANTLR::Runtime::NoViableAltException->new({
		grammar_decision_description => $self->get_description(),
		decision_number => $self->decision_number,
		state_number => $s,
		input => $input
    });
    $self->error($nvae);
    $nvae->throw();
	return;
}

# A hook for debugging interface
sub error {
    my ($self, $nvae) = @_;
	return;
}

sub special_state_transition {
    my ($self, $s, $input) = @_;

    return -1;
}

# Given a String that has a run-length-encoding of some unsigned shorts
# like "\1\2\3\9", convert to short[] {2,9,9,9}.  We do this to avoid
# static short[] which generates so much init code that the class won't
# compile. :(
# sub unpack_encoded_string {
#     my ($self, $encoded_string) = @_;
# 
#     my $data = [];
#     while ($encoded_string =~ /(.)(.)/gxms) {
#         my ($n, $v) = ($1, $2);
# 		# add v n times to data
#         push @$data, $v x $n;
#     }
# 
#     return $data;
# }

sub unistr_to_signedXint {
    my ($self,$num,$bits) = @_;

    return $num >> $bits-1 ? $num - 2 ** $bits : $num;
}

sub unpack_encoded_string {
    my ($self,$encoded_string) = @_;
    my $data = [];
    while ($encoded_string =~ /\\u{(.+?)}\\u{(.+?)}/gxms) {
        my ($n, $v) = ($self->unistr_to_signedXint($1,16), $self->unistr_to_signedXint($2,16));
		# add v n times to data
		for (my $i = $n; $i > 0; $i--) {
			push @{$data}, "$v";
		}
    }
	return $data;
}

sub unpack_encoded_string_to_unsigned_chars {
    my ($self, $encoded_string) = @_;

    return $self->unpack_encoded_string($encoded_string);
}

no Moose;
__PACKAGE__->meta->make_immutable();
1;
__END__

=head1 NAME

ANTLR::Runtime::DFA

=head1 DESCRIPTION

A DFA implemented as a set of transition tables.

Any state that has a semantic predicate edge is special; those states
are generated with if-then-else structures in a specialStateTransition()
which is generated by cyclicDFA template.

There are at most 32767 states (16-bit signed short).
Could get away with byte sometimes but would have to generate different
types and the simulation code too.  For a point of reference, the Java
lexer's Tokens rule DFA has 326 states roughly.