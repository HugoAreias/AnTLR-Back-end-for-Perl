grammar t015calc;
options {
  language = Perl5;
}

@header {
use Math::Trig;
}

@parser::init {
\$self->reported_errors = [];
}

@parser::members {
sub emit_error_message {
	my (\$self,\$msg) = @_;
    push @{\$self->reported_errors},\$msg;
	return;
}
}

evaluate returns [$result]: r=expression {\$result = \$r;};

expression returns [$result]: r=mult (
    '+' r2=mult {\$r += \$r2;}
  | '-' r2=mult {\$r -= \$r2;}
  )* {\$result = \$r;};

mult returns [$result]: r=log (
    '*' r2=log {\$r *= \$r2;}
  | '/' r2=log {\$r /= \$r2;}
//  | '%' r2=log {\$r %= \$r2;}
  )* {\$result = \$r;};

log returns [$result]: 'ln' r=exp {\$result = log(\$r);}
    | r=exp {\$result = \$r;}
    ;

exp returns [$result]: r=atom ('^' r2=atom {\$r = \$r**\$r2;} )? {\$result = \$r;}
    ;

atom returns [$result]:
    n=INTEGER {\$result = $n.text;}
  | n=DECIMAL {\$result = $n.text;} 
  | '(' r=expression {\$result = \$r;} ')'
  | 'PI' {\$result = pi;}
//  | 'E' {\$result = math.e}
  ;

INTEGER: DIGIT+;

DECIMAL: DIGIT+ '.' DIGIT+;

fragment
DIGIT: '0'..'9';

WS: (' ' | '\n' | '\t')+ {$self->skip();};
