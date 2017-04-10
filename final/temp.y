%{
#include<stdio.h>
int valid = 0;	
%}
%token a b c d
%%
stmt: S {return 0;}
S: c A d
 ;
A : a b
  | a
  ;
%%
yyerror()
{
	printf("\nInvalid");
	exit(0);
}
main()
{
	printf("\nEnter string:");
	yyparse();
	printf("\nvalid");
}
yylex()
{
	char ch;
	while((ch=getchar())==' ');
	if(ch=='a')
		return a;
	if(ch=='b')
		return b;
	if(ch=='c')
		return c;
	if(ch=='d')
		return d;
	return ch;
}