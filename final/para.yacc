%{
#include<stdio.h>
int flag=0;
%}
%token VARIABLE L R L1 R1 L2 R2 L3 R3

%%
Expression: S{}
S:L1 S R1 S  {}
 |L1 R1 S {}
 |L1 R1 {}
 |L1 S R1 {}
 |L2 S R2 S {}
 |L2 R2 S {}
 |L2 R2 {}
 |L2 S R2 {}
 |L3 S R3 S {}
 |L3 R3 S {}
 |L3 R3 {}
 |L3 S R3 {}
 |VARIABLE S {}
 |VARIABLE {}
;
 %%

void main()
{
   printf("\nEnter Expression:\n");
   yyparse();
   printf("Valid");
}
void yyerror()
{
   printf("\nInvalid Expression\n\n");
   exit(0);
   flag=1;
}


