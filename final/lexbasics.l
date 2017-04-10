%{
%}
digit [0-9]
letter [_?a-zA-Z]
%%
if|else|then|begin {printf("Keyword: %s\n",yytext);}
{letter}({letter}|{digit})* {printf("Identifier: %s\n",yytext);}
-?\+?{digit}+ {printf("Integer\n");}
-?.?{digit}+.?(e)?{digit}+ {printf("Real\n");}
"->" {printf("PTR_OP\n");}
","|"{" {printf("Recognised");}
.* {printf("Invalid: %s\n",yytext);}
%%
 int main(void) {
	yylex();
	return 0;
}
