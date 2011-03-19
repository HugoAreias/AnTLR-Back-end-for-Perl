lexer grammar t011lexer;
options {
  language = Perl5;
}

IDENTIFIER: 
        ('a'..'z'|'A'..'Z'|'_') 
        ('a'..'z'
        |'A'..'Z'
        |'0'..'9'
        |'_'
            { 
              print "Underscore\n";
              print "foo\n";
            }
        )*
    ;

WS: (' ' | '\n')+;
