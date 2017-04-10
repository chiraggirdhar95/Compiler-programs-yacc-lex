%{
#include <stdio.h>
#include <ctype.h>
int valid=1;
%}
%token let dig
%%
stmt	:	S {return 0;}
   		;
S :   S  dig   
      |	 S let
      |  let
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
	if(isalpha(ch))
		return let;
	if(isdigit(ch))
		return dig;
	return ch;
}