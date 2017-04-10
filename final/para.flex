%{
#include<stdio.h>
#include "y.tab.h"
extern int yylval;
%}

%%
[a-zA-Z]* {
          yylval=atoi(yytext);
          return VARIABLE;
       }
[(] {yylval=atoi(yytext);
        return L1;}
[)] {yylval=atoi(yytext);
        return R1;}
[{] {yylval=atoi(yytext);
        return L2;}
[}] {yylval=atoi(yytext);
        return R2;}
[\[] {yylval=atoi(yytext);
        return L3;}
[\]] {yylval=atoi(yytext);
        return R3;}
[\t] ;
[\n] return 0;
. return yytext[0];
%%
int yywrap()
{
return 1;
} 