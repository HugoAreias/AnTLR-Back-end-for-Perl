package ANTLR::Runtime::BaseRecognizer;

use Data::Lock qw( dlock );
use Carp;

use ANTLR::Runtime::RecognizerSharedState;
use ANTLR::Runtime::Token;
use ANTLR::Runtime::UnwantedTokenException;
use ANTLR::Runtime::MissingTokenException;
use ANTLR::Runtime::MismatchedTokenException;

use Moose;

dlock( my $MEMO_RULE_FAILED = '-2' );
sub MEMO_RULE_FAILED { $MEMO_RULE_FAILED }

dlock( my $MEMO_RULE_UNKNOWN = '-1' );
sub MEMO_RULE_UNKNOWN { $MEMO_RULE_UNKNOWN }

dlock( my $INITIAL_FOLLOW_STACK_SIZE = '100' );
sub INITIAL_FOLLOW_STACK_SIZE { $INITIAL_FOLLOW_STACK_SIZE }

# copies from Token object for convenience in actions
dlock( my $DEFAULT_TOKEN_CHANNEL = ANTLR::Runtime::Token->DEFAULT_CHANNEL );
sub DEFAULT_TOKEN_CHANNEL { $DEFAULT_TOKEN_CHANNEL }

dlock( my $HIDDEN = ANTLR::Runtime::Token->HIDDEN_CHANNEL );
sub HIDDEN { $HIDDEN }

dlock( my $NEXT_TOKEN_RULE_NAME = 'next_token' );
sub NEXT_TOKEN_RULE_NAME { $NEXT_TOKEN_RULE_NAME }

# State of a lexer, parser, or tree parser are collected into a state
# object so the state can be shared.  This sharing is needed to
# have one grammar import others and share same error variables
# and other state variables.  It's a kind of explicit multiple
# inheritance via delegation of methods and shared state.
has 'state' => (
    is  => 'rw',
    isa => 'ANTLR::Runtime::RecognizerSharedState',
    default => sub { ANTLR::Runtime::RecognizerSharedState->new() },
);

# reset the parser's state; subclasses must rewinds the input stream
sub reset {
    my ($self) = @_;

	# wack everything related to error recovery
    if (!defined $self->state) {
        return; # no shared state work to do
    }

    my $state = $self->state;
    $state->_fsp(-1);
    $state->error_recovery(0);
    $state->last_error_index(-1);
    $state->failed(0);
    $state->syntax_errors(0);
    # wack everything related to backtracking and memoization
    $state->backtracking(0);
    # wipe cache
    $state->rule_memo([]);
	return;
}

# Match current input symbol against ttype.  Attempt
# single token insertion or deletion error recovery.  If
# that fails, throw MismatchedTokenException.
# 
# To turn off single token insertion or deletion error
# recovery, override recoverFromMismatchedToken() and have it
# throw an exception. See TreeParser.recoverFromMismatchedToken().
# This way any error in a rule will cause an exception and
# immediate exit from rule.  Rule would recover by resynchronizing
# to the set of symbols that can follow rule ref.
sub match {
    dlock( my $usage = 'void match(IntStream input, int ttype, BitSet follow)' );
    croak $usage if @_ != 4;
    my ($self, $input, $ttype, $follow) = @_;

    my $matched_symbol = $self->get_current_input_symbol($input);
    if ($input->LA(1) == $ttype) {
        $input->consume();
        $self->state->error_recovery(0);
        $self->state->failed(0);
        return $matched_symbol;
    }

    if ($self->state->backtracking > 0) {
        $self->state->failed(1);
        return $matched_symbol;
    }

    return $self->recover_from_mismatched_token($input, $ttype, $follow);
}

# Match the wildcard: in a symbol
sub match_any {
    dlock( my $usage = 'void match_any(IntStream input)' );
    croak $usage if @_ != 2;
    my ($self, $input) = @_;

    $self->state->error_recovery(0);
    $self->state->failed(0);
    $input->consume();
	return;
}

sub mismatch_is_unwanted_token {
    my ($self, $input, $ttype) = @_;
    return $input->LA(2) == $ttype;
}

sub mismatch_is_missing_token {
    my ($self, $input, $follow) = @_;

    if (!defined $follow) {
		# we have no information about the follow; we can only consume
		# a single token and hope for the best
        return 0;
    }

	# compute what can follow this grammar element reference
    if ($follow->member(ANTLR::Runtime::Token->EOR_TOKEN_TYPE)) {
        my $viable_tokens_following_this_rule = $self->compute_context_sensitive_rule_FOLLOW();
        $follow = $follow->or($viable_tokens_following_this_rule);
        if ($self->state->_fsp >= 0) { # remove EOR if we're not the start symbol
            $follow->remove(ANTLR::Runtime::Token->EOR_TOKEN_TYPE);
        }
    }

	# BitSet cannot handle negative numbers like -1 (EOF) so I leave EOR
	# in follow set to indicate that the fall of the start symbol is
	# in the set (EOF can follow).
    if ($follow->member($input->LA(1)) || $follow->member(ANTLR::Runtime::Token->EOR_TOKEN_TYPE)) {
        return 1;
    }
    return 0;
}

# sub mismatch {
#     dlock( my $usage = 'void mismatch(IntStream input, int ttype, BitSet follow)' );
#     croak $usage if @_ != 4;
#     my ($self, $input, $ttype, $follow) = @_;
# 
#     if ($self->mismatch_is_unwanted_token($input, $ttype)) {
#         ANTLR::Runtime::UnwantedTokenException->new({
#             expecting => $ttype,
#             input => $input
#         })->throw();
#     }
#     elsif ($self->mismatch_is_missing_token($input, $follow)) {
#         ANTLR::Runtime::MissingTokenException->new({
#             expecting => $ttype,
#             input => $input
#         })->throw();
#     }
#     else {
#         ANTLR::Runtime::MismatchedTokenException->new({
#             expecting => $ttype,
#             input => $input
#         })->throw();
#     }
# }

sub report_error {
    dlock( my $usage = 'void report_error(RecognitionException e)' );
    croak $usage if @_ != 2;
    my ($self, $e) = @_;

	# if we've already reported an error and have not matched a token
	# yet successfully, don't report any errors.
    if ($self->state->error_recovery) {
        return;
    }
    $self->state->syntax_errors($self->state->syntax_errors + 1); # don't count spurious
    $self->state->error_recovery(1);

    $self->display_recognition_error($self->get_token_names(), $e);
    return;
}

sub display_recognition_error {
    dlock( my $usage = 'void display_recognition_error(String[] token_names, RecognitionException e)' );
    croak $usage if @_ != 3;
    my ($self, $token_names, $e) = @_;

    my $hdr = $self->get_error_header($e);
    my $msg = $self->get_error_message($e, $token_names);
    $self->emit_error_message("$hdr $msg");
	return;
}

# What error message should be generated for the various
# exception types?
# 
# Not very object-oriented code, but I like having all error message
# generation within one method rather than spread among all of the
# exception classes. This also makes it much easier for the exception
# handling because the exception classes do not have to have pointers back
# to this object to access utility routines and so on. Also, changing
# the message for an exception type would be difficult because you
# would have to subclassing exception, but then somehow get ANTLR
# to make those kinds of exception objects instead of the default.
# This looks weird, but trust me--it makes the most sense in terms
# of flexibility.
# 
# For grammar debugging, you will want to override this to add
# more information such as the stack frame with
# get_rule_invocation_stack($e, $self->get_class().get_name()) and,
# for no viable alts, the decision description and state etc...
# 
# Override this to change the message generated for one or more
# exception types.
sub get_error_message {
    dlock( my $usage = 'String get_error_message(RecognitionException e, String[] token_names)' );
    croak $usage if @_ != 3;
    my ($self, $e, $token_names) = @_;

    if ($e->isa('ANTLR::Runtime::UnwantedTokenException')) {
		my $token_name;
		if ($e->get_expecting() == ANTLR::Runtime::Token->EOF) {
			$token_name = 'EOF';
		}
		else {
			$token_name = $token_names->[$e->get_expecting()];
		}
		
		return 'extraneous input ' . $self->get_token_error_display($e->get_unexpected_token())
			. " expecting $token_name";
	}
	elsif ($e->isa('ANTLR::Runtime::MissingTokenException')) {
		my $token_name;
		if ($e->get_expecting() == ANTLR::Runtime::Token->EOF) {
			$token_name = 'EOF';
		}
		else {
			$token_name = $token_names->[$e->get_expecting()];
		}
		
		return "missing $token_name at " . $self->get_token_error_display($e->get_token());
	}
    elsif ($e->isa('ANTLR::Runtime::MismatchedTokenException')) {
        my $token_name;
        if ($e->get_expecting() == ANTLR::Runtime::Token->EOF) {
            $token_name = 'EOF';
        } else {
            $token_name = $token_names->[$e->get_expecting()];
        }

        return 'mismatched input ' . $self->get_token_error_display($e->get_token())
            . ' expecting ' . $token_name;
    }
	elsif ($e->isa('ANTLR::Runtime::MismatchedTreeNodeException')) {
        my $token_name;
        if ($e->get_expecting() == ANTLR::Runtime::Token->EOF) {
            $token_name = 'EOF';
        } else {
            $token_name = $token_names->[$e->get_expecting()];
        }

        return 'mismatched tree node: ' . $e->node
            . ' expecting ' . $token_name;
    }
	elsif ($e->isa('ANTLR::Runtime::NoViableAltException')) {
        return 'no viable alternative at input ' . $self->get_token_error_display($e->get_token());
    }
	elsif ($e->isa('ANTLR::Runtime::EarlyExitException')) {
        return 'required (...)+ loop did not match anything at input '
            . $self->get_token_error_display($e->get_token());
    }
	elsif ($e->isa('ANTLR::Runtime::MismatchedSetException')) {
        return 'mismatched input ' . $self->get_token_error_display($e->get_token())
            . ' expecting set ' . $e->get_expecting();
    }
	elsif ($e->isa('ANTLR::Runtime::MismatchedNotSetException')) {
        return 'mismatched input ' . $self->get_token_error_display($e->get_token())
            . ' expecting set ' . $e->get_expecting();
    }
	elsif ($e->isa('ANTLR::Runtime::FailedPredicateException')) {
        return 'rule ' . $e->get_rule_name() . ' failed predicate: {'
            . $e->get_predicate_text() . '}?';
    }
	else {
        return undef;
    }
}

# Get number of recognition errors (lexer, parser, tree parser).  Each
# recognizer tracks its own number.  So parser and lexer each have
# separate count.  Does not count the spurious errors found between
# an error and next valid token match
sub get_number_of_syntax_errors {
    my ($self) = @_;
    return $self->state->syntax_errors;
}

# What is the error header, normally line/character position information?
sub get_error_header {
    dlock( my $usage = 'String get_error_header(RecognitionException e)' );
    croak $usage if @_ != 2;
    my ($self, $e) = @_;

    my $line = $e->get_line();
    my $col = $e->get_char_position_in_line();

    return "line $line:$col";
}

# How should a token be displayed in an error message? The default
# is to display just the text, but during development you might
# want to have a lot of information spit out.  Override in that case
# to use $t->to_string() (which, for CommonToken, dumps everything about
# the token).
sub get_token_error_display {
    dlock( my $usage = 'String get_token_error_display(Token t)' );
    croak $usage if @_ != 2;
    my ($self, $t) = @_;

    my $s = $t->get_text();
    if (!defined $s) {
        if ($t->get_type() == ANTLR::Runtime::Token->EOF) {
            $s = '<EOF>';
        } else {
            my $ttype = $t->get_type();
            $s = "<$ttype>";
        }
    }

    $s =~ s/\n/\\\\n/g;
    $s =~ s/\r/\\\\r/g;
    $s =~ s/\t/\\\\t/g;

    return "'$s'";
}

# Override this method to change where error messages go
sub emit_error_message {
    dlock( my $usage = 'void emit_error_message(String msg)' );
    croak $usage if @_ != 2;
    my ($self, $msg) = @_;

    print STDERR $msg, "\n";
	return;
}

# Recover from an error found on the input stream.  This is
# for NoViableAlt and mismatched symbol exceptions.  If you enable
# single token insertion and deletion, this will usually not
# handle mismatched symbol exceptions but there could be a mismatched
# token that the match() routine could not recover from.
sub recover {
    dlock( my $usage = 'void recover(IntStream input, RecognitionException re)' );
    croak $usage if @_ != 3;
    my ($self, $input, $re) = @_;

    if ($self->state->last_error_index == $input->index()) {
	# uh oh, another error at same token index; must be a case
	# where LT(1) is in the recovery token set so nothing is
	# consumed; consume a single token so at least to prevent
	# an infinite loop; this is a failsafe.
        $input->consume();
    }

    $self->state->last_error_index($input->index());
    my $follow_set = $self->compute_error_recovery_set();
    $self->begin_resync();
    $self->consume_until({input => $input, follow => $follow_set});
    $self->end_resync();
	return;
}

# A hook to listen in on the token consumption during error recovery.
# The DebugParser subclasses this to fire events to the listenter.
sub begin_resync {
}

sub end_resync {
}

sub compute_error_recovery_set {
    dlock( my $usage = 'void compute_error_recovery_set()' );
    croak $usage if @_ != 1;
    my ($self) = @_;

    return $self->combine_follows(0);
}

sub compute_context_sensitive_rule_FOLLOW {
    dlock( my $usage = 'void compute_context_sensitive_rule_FOLLOW()' );
    croak $usage if @_ != 1;
    my ($self) = @_;

    return $self->combine_follows(1);
}

sub combine_follows {
    dlock( my $usage = 'BitSet combine_follows(boolean exact)' );
    croak $usage if @_ != 2;
    my ($self, $exact) = @_;

	my $top = $self->state->_fsp;
    my $follow_set = ANTLR::Runtime::BitSet->new();

    for ( my $i = $top; $i >= 0; $i-- ) {
		my $local_follow_set = $self->state->following->[$i];
        # $follow_set |= $local_follow_set; # failing sometimes
		$follow_set->or_in_place($local_follow_set);
        if ( $exact ) {
			if ( $local_follow_set->member(ANTLR::Runtime::Token->EOR_TOKEN_TYPE) ) {
				# Only leave EOR in set if at top (start rule); this lets
				# us know if have to include follow(start rule); i.e., EOF
				if ( $i > 0 ) {
					$follow_set->remove(ANTLR::Runtime::Token->EOR_TOKEN_TYPE);
				}
			}
			else {
				last; # can't see end of rule, quit
			}
        }
    }
    return $follow_set;
}

# Attempt to recover from a single missing or extra token.
sub recover_from_mismatched_token {
    dlock( my $usage = 'void recover_from_mismatched_token(IntStream input, int ttype, BitSet follow)' );
    croak $usage if @_ != 4;
    my ($self, $input, $ttype, $follow) = @_;

    if ($self->mismatch_is_unwanted_token($input, $ttype)) {
        my $e = ANTLR::Runtime::UnwantedTokenException->new({
            expecting => $ttype,
            input => $input
        });
        $self->begin_resync();
        $input->consume(); # simply delete extra token
        $self->end_resync();
        $self->report_error($e); # report after consuming so AW sees the token in the exception
		# we want to return the token we're actually matching
        my $matched_symbol = $self->get_current_input_symbol($input);
        $input->consume(); # move past ttype token as if all were ok
        return $matched_symbol;
    }
	# can't recover with single token deletion, try insertion
    if ($self->mismatch_is_missing_token($input, $follow)) {
        my $inserted = $self->get_missing_symbol({
                input => $input,
				# exception => undef
                expected_token_type => $ttype,
                follow => $follow,
        });
        my $e = ANTLR::Runtime::MissingTokenException->new({
            expecting => $ttype,
            input => $input,
            inserted => $inserted,
        });
        $self->report_error($e); # report after inserting so AW sees the token in the exception
        return $inserted;
    }
	# even that didn't work; must throw the exception
    ANTLR::Runtime::MismatchedTokenException->new({
        expecting => $ttype,
        input => $input,
    })->throw();
}

# Not currently used
sub recover_from_mismatched_set {
    dlock( my $usage = 'void recover_from_mismatched_set(IntStream input, RecognitionException e, BitSet follow)' );
    croak $usage if @_ != 4;
    my ($self, $input, $e, $follow) = @_;

    if ($self->mismatch_is_missing_token($input, $follow)) {
        $self->report_error($e);
		# we don't know how to conjure up a token for sets yet
        return $self->get_missing_symbol({
                input => $input,
                exception => $e,
                expected_token_type => ANTLR::Runtime::Token->INVALID_TOKEN_TYPE,
                follow => $follow,
            });
    }

    $e->throw();
}

# sub recover_from_mismatched_element {
#     dlock( my $usage = 'boolean recover_from_mismatched_element(IntStream input, RecognitionException e, BitSet follow)' );
#     croak $usage if @_ != 4;
#     my ($self, $input, $e, $follow) = @_;
# 
#     return 0 if (!defined $follow);
# 
#     if ($follow->member(ANTLR::Runtime::Token->EOR_TOKEN_TYPE)) {
#         my $viable_tokens_following_this_rule = $self->compute_context_sensitive_rule_FOLLOW();
#         $follow |= $viable_tokens_following_this_rule;
#         $follow->remove(ANTLR::Runtime::Token->EOR_TOKEN_TYPE);
#     }
# 
#     if ($follow->member($input->LA(1))) {
#         $self->report_error($e);
#         return 1;
#     }
# 
#     return 0;
# }

# Match needs to return the current input symbol, which gets put
# into the label for the associated token ref; e.g., x=ID.  Token
# and tree parsers need to return different objects. Rather than test
# for input stream type or change the IntStream interface, I use
# a simple method to ask the recognizer to tell me what the current
# input symbol is.
# 
# This is ignored for lexers.
sub get_current_input_symbol {
    my ($self, $input) = @_;
    return undef;
}

# Conjure up a missing token during error recovery.
# 
# The recognizer attempts to recover from single missing
# symbols. But, actions might refer to that missing symbol.
# For example, x=ID {f($x);}. The action clearly assumes
# that there has been an identifier matched previously and that
# $x points at that token. If that token is missing, but
# the next token in the stream is what we want we assume that
# this token is missing and we keep going. Because we
# have to return some token to replace the missing token,
# we have to conjure one up. This method gives the user control
# over the tokens returned for missing tokens. Mostly,
# you will want to create something special for identifier
# tokens. For literals such as '{' and ',', the default
# action in the parser or tree parser works. It simply creates
# a CommonToken of the appropriate type. The text will be the token.
# If you change what tokens must be created by the lexer,
# override this method to create the appropriate tokens.
sub get_missing_symbol {
    my ($self, $arg_ref) = @_;
    my $input = $arg_ref->{input};
    my $exception = $arg_ref->{exception};
    my $expected_token_type = $arg_ref->{expected_token_type};
    my $follow = $arg_ref->{follow};

    return undef;
}

sub consume_until {
    dlock( my $usage = 'void consume_until(IntStream input, (int token_type | BitSet set))' );
	my ($self, $arg_ref) = @_;
    croak $usage if ( !exists $arg_ref->{input} || (!exists $arg_ref->{ttype} && !exists $arg_ref->{follow}) );

    if (exists $arg_ref->{follow} && $arg_ref->{follow}->isa('ANTLR::Runtime::BitSet')) {
		# Consume tokens until one matches the given token set
        my $input = $arg_ref->{input};
        my $set = $arg_ref->{follow};

        my $ttype = $input->LA(1);
        while ($ttype != ANTLR::Runtime::Token->EOF && !$set->member($ttype)) {
            $input->consume();
            $ttype = $input->LA(1);
        }
    }
    if (exists $arg_ref->{ttype}) {
        my $input = $arg_ref->{input};
        my $token_type = $arg_ref->{ttype};

        my $ttype = $input->LA(1);
        while ($ttype != ANTLR::Runtime::Token->EOF && $ttype != $token_type) {
            $input->consume();
            $ttype = $input->LA(1);
        }
    }
	return;
}

# Push a rule's follow set using our own hardcoded stack
sub push_follow {
    dlock( my $usage = 'void push_follow(BitSet fset)' );
    croak $usage if @_ != 2;
    my ($self, $fset) = @_;

    push @{$self->state->following}, $fset;
    $self->state->_fsp($self->state->_fsp + 1);
	return;
}

# Return list of the rules in your parser instance
# leading up to a call to this method.
# 
# This is very useful for error messages and for context-sensitive
# error recovery.
sub get_rule_invocation_stack {
    dlock( my $usage = 'List get_rule_invocation_stack()' );
    croak $usage if @_ != 1;
    my ($self) = @_;

    my $rules = [];
    for (my $i = 0; ; ++$i) {
        my @frame = caller $i;
        last if !@frame;

        my ($package, $filename, $line, $subroutine) = @frame;

        if ($package =~ /^ANTLR::Runtime::/) {
            next; # skip support code such as this method
        }

        if ($subroutine eq NEXT_TOKEN_RULE_NAME) {
            next;
        }

        if ($package ne ref $self) {
            next; # must not be part of this parser
        }

        push @{$rules}, $subroutine;
    }
	return $rules;
}

sub get_backtracking_level {
    dlock( my $usage = 'int get_backtracking_level()' );
    croak $usage if @_ != 1;
    my ($self) = @_;

    return $self->state->backtracking;
}

sub set_backtracking_level {
    my ($self, $n) = @_;
    $self->state->backtracking($n);
}

# Return whether or not a backtracking attempt failed.
sub failed {
    my ($self) = @_;
    return $self->state->failed;
}

# Used to print out token names like ID during debugging and
# error reporting.  The generated parsers implement a method
# that overrides this to point to their String[] tokenNames.
sub get_token_names {
    return undef;
}

# For debugging and other purposes, might want the grammar name.
# Have ANTLR generate an implementation for this method.
sub get_grammar_file_name {
    return undef;
}

# A convenience method for use most often with template rewrites.
sub to_strings {
    dlock( my $usage = 'List to_strings(List tokens)' );
    croak $usage if @_ != 2;
    my ($self, $tokens) = @_;

    if (!defined $tokens) {
        return undef;
    }

    return map { $_->get_text() } @{$tokens};
}

# Given a rule number and a start token index number, return
# MEMO_RULE_UNKNOWN if the rule has not parsed input starting from
# start index.  If this rule has parsed input starting from the
# start index before, then return where the rule stopped parsing.
# It returns the index of the last token matched by the rule.
sub get_rule_memoization {
    dlock( my $usage = 'int get_rule_memoization(int rule_index, int rule_start_index)' );
    croak $usage if @_ != 3;
    my ($self, $rule_index, $rule_start_index) = @_;

    if (!defined $self->state->rule_memo->[$rule_index]) {
        $self->state->rule_memo->[$rule_index] = {};
    }

    my $stop_index = $self->state->rule_memo->[$rule_index]->{$rule_start_index};
    if (!defined $stop_index) {
        return $self->MEMO_RULE_UNKNOWN;
    }
    return $stop_index;
}

# Has this rule already parsed input at the current index in the
# input stream?  Return the stop token index or MEMO_RULE_UNKNOWN.
# If we attempted but failed to parse properly before, return
# MEMO_RULE_FAILED.
# 
# This method has a side-effect: if we have seen this input for
# this rule and successfully parsed before, then seek ahead to
# 1 past the stop token matched for this rule last time.
sub already_parsed_rule {
    dlock( my $usage = 'boolean alredy_parsed_rule(IntStream input, int rule_index)' );
    croak $usage if @_ != 3;
    my ($self, $input, $rule_index) = @_;

    my $stop_index = $self->get_rule_memoization($rule_index, $input->index());
    if ($stop_index == $self->MEMO_RULE_UNKNOWN) {
        return 0;
    }

    if ($stop_index == $self->MEMO_RULE_FAILED) {
        $self->state->failed(1);
    } else {
        $input->seek($stop_index + 1); # jump to one past stop token
    }
    return 1;
}

# Record whether or not this rule parsed the input at this position successfully.
sub memoize {
    dlock( my $usage = 'void memoize(IntStream input, int rule_index, int rule_start_index)' );
    croak $usage if @_ != 4;
    my ($self, $input, $rule_index, $rule_start_index) = @_;

    my $stop_token_index = $self->state->failed ? $self->MEMO_RULE_FAILED : $input->index() - 1;
	
    if (defined $self->state->rule_memo->[$rule_index]) {
        $self->state->rule_memo->[$rule_index]->{$rule_start_index} = $stop_token_index;
    }
	return;
}

# return how many rule/input-index pairs there are in total.
sub get_rule_memoization_cache_size {
    dlock( my $usage = 'int get_rule_memoization_cache_size()' );
    croak $usage if @_ != 1;
    my ($self) = @_;

    my $n = 0;
    foreach my $m (@{$self->state->rule_memo}) {
        $n += keys %{$m} if defined $m; # how many input indexes are recorded?
    }

    return $n;
}

sub trace_in {
    dlock( my $usage = 'void trace_in(String rule_name, int rule_index, Object input_symbol)' );
    croak $usage if @_ != 4;
    my ($self, $rule_name, $rule_index, $input_symbol) = @_;

    print "enter $rule_name $input_symbol";
    # if ($self->state->failed) {
    #     print ' failed=', $self->state->failed;
    # }
    if ($self->state->backtracking > 0) {
        print ' backtracking=', $self->state->backtracking;
    }
    print "\n";
	return;
}

sub trace_out {
    dlock( my $usage = 'void trace_out(String rule_name, int rule_index, Object input_symbol)' );
    croak $usage if @_ != 4;
    my ($self, $rule_name, $rule_index, $input_symbol) = @_;

    print "exit $rule_name $input_symbol";
    # if ($self->state->failed) {
    #     print ' failed=', $self->state->failed;
    # }
    if ($self->state->backtracking > 0) {
        print ' backtracking=', $self->state->backtracking;
		if ($self->state->failed) { print ' failed' }
		else { print ' succeeded' }
    }
    print "\n";
	return;
}

no Moose;
__PACKAGE__->meta->make_immutable();
1;
__END__

=head1 NAME

ANTLR::Runtime::BaseRecognizer

=head1 DESCRIPTION

A generic recognizer that can handle recognizers generated from
lexer, parser, and tree grammars.  This is all the parsing
support code essentially; most of it is error recovery stuff and
backtracking.
