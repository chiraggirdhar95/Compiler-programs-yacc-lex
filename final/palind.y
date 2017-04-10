%{
#include <stdio.h>
#include <ctype.h>
int valid=1;
%}
%token a b
%%
S : a S a | b S b | a | b |;      
%%
int yyerror()
{
printf("  Invalid String.\n");exit(0);
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
	if(ch=='\n')
		return 0;
	return ch;
}