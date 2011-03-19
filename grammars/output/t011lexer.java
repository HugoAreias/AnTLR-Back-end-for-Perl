// $ANTLR 3.2 Sep 23, 2009 12:02:23 /Users/Hades/Projects/ANTLR/antlr-3.2/target/antlr/grammars/t011lexer.g 2010-09-26 13:53:03

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class t011lexer extends Lexer {
    public static final int IDENTIFIER=4;
    public static final int WS=5;
    public static final int EOF=-1;

    // delegates
    // delegators

    public t011lexer() {;} 
    public t011lexer(CharStream input) {
        this(input, new RecognizerSharedState());
    }
    public t011lexer(CharStream input, RecognizerSharedState state) {
        super(input,state);

    }
    public String getGrammarFileName() { return "/Users/Hades/Projects/ANTLR/antlr-3.2/target/antlr/grammars/t011lexer.g"; }

    // $ANTLR start "IDENTIFIER"
    public final void mIDENTIFIER() throws RecognitionException {
        try {
            int _type = IDENTIFIER;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Projects/ANTLR/antlr-3.2/target/antlr/grammars/t011lexer.g:3:11: ( ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )* )
            // /Users/Hades/Projects/ANTLR/antlr-3.2/target/antlr/grammars/t011lexer.g:4:9: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
            {
            if ( (input.LA(1)>='A' && input.LA(1)<='Z')||input.LA(1)=='_'||(input.LA(1)>='a' && input.LA(1)<='z') ) {
                input.consume();

            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                recover(mse);
                throw mse;}

            // /Users/Hades/Projects/ANTLR/antlr-3.2/target/antlr/grammars/t011lexer.g:5:9: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
            loop1:
            do {
                int alt1=5;
                switch ( input.LA(1) ) {
                case 'a':
                case 'b':
                case 'c':
                case 'd':
                case 'e':
                case 'f':
                case 'g':
                case 'h':
                case 'i':
                case 'j':
                case 'k':
                case 'l':
                case 'm':
                case 'n':
                case 'o':
                case 'p':
                case 'q':
                case 'r':
                case 's':
                case 't':
                case 'u':
                case 'v':
                case 'w':
                case 'x':
                case 'y':
                case 'z':
                    {
                    alt1=1;
                    }
                    break;
                case 'A':
                case 'B':
                case 'C':
                case 'D':
                case 'E':
                case 'F':
                case 'G':
                case 'H':
                case 'I':
                case 'J':
                case 'K':
                case 'L':
                case 'M':
                case 'N':
                case 'O':
                case 'P':
                case 'Q':
                case 'R':
                case 'S':
                case 'T':
                case 'U':
                case 'V':
                case 'W':
                case 'X':
                case 'Y':
                case 'Z':
                    {
                    alt1=2;
                    }
                    break;
                case '0':
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                case '7':
                case '8':
                case '9':
                    {
                    alt1=3;
                    }
                    break;
                case '_':
                    {
                    alt1=4;
                    }
                    break;

                }

                switch (alt1) {
            	case 1 :
            	    // /Users/Hades/Projects/ANTLR/antlr-3.2/target/antlr/grammars/t011lexer.g:5:10: 'a' .. 'z'
            	    {
            	    matchRange('a','z'); 

            	    }
            	    break;
            	case 2 :
            	    // /Users/Hades/Projects/ANTLR/antlr-3.2/target/antlr/grammars/t011lexer.g:6:10: 'A' .. 'Z'
            	    {
            	    matchRange('A','Z'); 

            	    }
            	    break;
            	case 3 :
            	    // /Users/Hades/Projects/ANTLR/antlr-3.2/target/antlr/grammars/t011lexer.g:7:10: '0' .. '9'
            	    {
            	    matchRange('0','9'); 

            	    }
            	    break;
            	case 4 :
            	    // /Users/Hades/Projects/ANTLR/antlr-3.2/target/antlr/grammars/t011lexer.g:8:10: '_'
            	    {
            	    match('_'); 
            	     
            	                  System.out.println("Underscore");
            	                  System.out.println("foo");
            	                

            	    }
            	    break;

            	default :
            	    break loop1;
                }
            } while (true);


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "IDENTIFIER"

    // $ANTLR start "WS"
    public final void mWS() throws RecognitionException {
        try {
            int _type = WS;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/Hades/Projects/ANTLR/antlr-3.2/target/antlr/grammars/t011lexer.g:16:3: ( ( ' ' | '\\n' )+ )
            // /Users/Hades/Projects/ANTLR/antlr-3.2/target/antlr/grammars/t011lexer.g:16:5: ( ' ' | '\\n' )+
            {
            // /Users/Hades/Projects/ANTLR/antlr-3.2/target/antlr/grammars/t011lexer.g:16:5: ( ' ' | '\\n' )+
            int cnt2=0;
            loop2:
            do {
                int alt2=2;
                int LA2_0 = input.LA(1);

                if ( (LA2_0=='\n'||LA2_0==' ') ) {
                    alt2=1;
                }


                switch (alt2) {
            	case 1 :
            	    // /Users/Hades/Projects/ANTLR/antlr-3.2/target/antlr/grammars/t011lexer.g:
            	    {
            	    if ( input.LA(1)=='\n'||input.LA(1)==' ' ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse = new MismatchedSetException(null,input);
            	        recover(mse);
            	        throw mse;}


            	    }
            	    break;

            	default :
            	    if ( cnt2 >= 1 ) break loop2;
                        EarlyExitException eee =
                            new EarlyExitException(2, input);
                        throw eee;
                }
                cnt2++;
            } while (true);


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "WS"

    public void mTokens() throws RecognitionException {
        // /Users/Hades/Projects/ANTLR/antlr-3.2/target/antlr/grammars/t011lexer.g:1:8: ( IDENTIFIER | WS )
        int alt3=2;
        int LA3_0 = input.LA(1);

        if ( ((LA3_0>='A' && LA3_0<='Z')||LA3_0=='_'||(LA3_0>='a' && LA3_0<='z')) ) {
            alt3=1;
        }
        else if ( (LA3_0=='\n'||LA3_0==' ') ) {
            alt3=2;
        }
        else {
            NoViableAltException nvae =
                new NoViableAltException("", 3, 0, input);

            throw nvae;
        }
        switch (alt3) {
            case 1 :
                // /Users/Hades/Projects/ANTLR/antlr-3.2/target/antlr/grammars/t011lexer.g:1:10: IDENTIFIER
                {
                mIDENTIFIER(); 

                }
                break;
            case 2 :
                // /Users/Hades/Projects/ANTLR/antlr-3.2/target/antlr/grammars/t011lexer.g:1:21: WS
                {
                mWS(); 

                }
                break;

        }

    }


 

}