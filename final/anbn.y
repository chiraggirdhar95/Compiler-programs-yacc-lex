%{
#include<stdio.h>
int valid=1;
%}
%token a b
%%
stmt: S { return 0;}
S : a S b
  |  
  ;
%%
int yyerror()
{
printf("  Invalid String.\n");  exit(0);
 }
main()
{
	printf("Enter any string\n");
	yyparse();
	if(valid==1)
   		printf("\nvalid string");
}

yylex()
{
	char ch;
	while((ch=getchar())==' ');
	if(ch=='a')
		return a;
	if(ch=='b')
		return b;
	return ch;
}

