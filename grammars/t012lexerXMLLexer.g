lexer grammar t012lexerXMLLexer;
options {
  language = Perl5;
}

/*@header {
from cStringIO import StringIO
}*/

/*@lexer::init {
$self->outbuf = StringIO()
}*/

/*@lexer::members {
def output(self, line):
    self.outbuf.write(line.encode('utf-8') + "\n")
}*/

DOCUMENT
    :  XMLDECL? WS? DOCTYPE? WS? ELEMENT WS? 
    ;

fragment DOCTYPE
    :
        '<!DOCTYPE' WS rootElementName=GENERIC_ID 
        {print "ROOTELEMENT: ", rootElementName.text;}
        WS
        ( 
            ( 'SYSTEM' WS sys1=VALUE
                {print "SYSTEM: ", sys1.text;}
                
            | 'PUBLIC' WS pub=VALUE WS sys2=VALUE
                {print "PUBLIC: ", pub.text;}
                {print "SYSTEM: ", sys2.text;}
            )
            ( WS )?
        )?
        ( dtd=INTERNAL_DTD
            {print "INTERNAL DTD: ", dtd.text;}
        )?
		'>'
	;

fragment INTERNAL_DTD : '[' (options {greedy=false;} : .)* ']' ;

fragment PI :
        '<?' target=GENERIC_ID WS? 
          {print "PI: ", target.text;}
        ( ATTRIBUTE WS? )*  '?>'
	;

fragment XMLDECL :
        '<?' ('x'|'X') ('m'|'M') ('l'|'L') WS? 
          {print "XML declaration";}
        ( ATTRIBUTE WS? )*  '?>'
	;


fragment ELEMENT
    : ( START_TAG
            (ELEMENT
            | t=PCDATA
                {print 'PCDATA: "', $t.text, '"';}
            | t=CDATA
                {print 'CDATA: "', $t.text, '"';}
            | t=COMMENT
                {print 'Comment: "', $t.text, '"';}
            | pi=PI
            )*
            END_TAG
        | EMPTY_ELEMENT
        )
    ;

fragment START_TAG 
    : '<' WS? name=GENERIC_ID WS?
          {print "Start Tag: ", name.text;}
        ( ATTRIBUTE WS? )* '>'
    ;

fragment EMPTY_ELEMENT 
    : '<' WS? name=GENERIC_ID WS?
          {print "Empty Element: ", name.text;}
        ( ATTRIBUTE WS? )* '/>'
    ;

fragment ATTRIBUTE 
    : name=GENERIC_ID WS? '=' WS? value=VALUE
        {print "Attr: ", name.text, "=", value.text;}
    ;

fragment END_TAG 
    : '</' WS? name=GENERIC_ID WS? '>'
        {print "End Tag: ", name.text;}
    ;

fragment COMMENT
	:	'<!--' (options {greedy=false;} : .)* '-->'
	;

fragment CDATA
	:	'<![CDATA[' (options {greedy=false;} : .)* ']]>'
	;

fragment PCDATA : (~'<')+ ; 

fragment VALUE : 
        ( '\"' (~'\"')* '\"'
        | '\'' (~'\'')* '\''
        )
	;

fragment GENERIC_ID 
    : ( LETTER | '_' | ':') 
        ( options {greedy=true;} : LETTER | '0'..'9' | '.' | '-' | '_' | ':' )*
	;

fragment LETTER
	: 'a'..'z' 
	| 'A'..'Z'
	;

fragment WS  :
        (   ' '
        |   '\t'
        |  ( '\n'
            |	'\r\n'
            |	'\r'
            )
        )+
    ;    

