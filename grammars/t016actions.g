grammar t016actions;
options {
  language = Perl5;
}

declaration returns [$name =[\]]
    :   ( functionHeader ';' {push @{$name},$functionHeader.name;})+
    ;

functionHeader returns [$name]
    :   type ID
	{$name = $ID.text;}
    ;

type
    :   'int'   
    |   'char'  
    |   'void'
    ;

ID  :   ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;

WS  :   (   ' '
        |   '\t'
        |   '\r'
        |   '\n'
        )+
        {$self->skip();}
    ;    
