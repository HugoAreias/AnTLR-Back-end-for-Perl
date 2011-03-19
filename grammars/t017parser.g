grammar t017parser;

options {
    language = Perl5;
}

program
    :   declaration+
    ;

declaration
    :   variable
    |   functionHeader ';'
    |   functionHeader block
    ;

variable
    :   type declarator ';'
    ;

declarator
    :   ID {print "Declarator: ",$ID.text,"\n";}
    ;

functionHeader
    :   type ID '(' ( formalParameter ( ',' formalParameter )* )? ')' {print "Function Header: ",$ID.text,"\n";}
    ;

formalParameter
    :   type declarator
    ;

type
    :   'int' {print "Type: int\n";}
    |   'char' {print "Type: char\n";}
    |   'void' {print "Type: void\n";}
    |   ID {print "Type: ",$ID.text,"\n";}
    ;

block
    :   '{'
            variable*
            stat*
        '}'
    ;

stat: forStat
    | expr ';'      
    | block
    | assignStat ';'
    | ';'
    ;

forStat
    :   'for' '(' assignStat ';' expr ';' assignStat ')' block {print "For Loop\n";}
    ;

assignStat
    :   ID '=' expr {print "Variable: ",$ID.text,"\n";}
    ;

expr:   condExpr
    ;

condExpr
    :   aexpr ( ('==' | '<') aexpr )?
    ;

aexpr
    :   atom ( '+' atom )*
    ;

atom
    : ID {print 'ID: ',$ID.text,"\n";}
    | INT {print 'INT: ',$INT.text,"\n";}
    | '(' expr ')'
    ; 

ID  :   ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;

INT :	('0'..'9')+
    ;

WS  :   (   ' '
        |   '\t'
        |   '\r'
        |   '\n'
        )+
        {$self->skip();}
    ;    
