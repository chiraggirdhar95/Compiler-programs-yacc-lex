%{
%}
A [[ab]*[cd]*]+
B [a][b]*[c]*[d]
D 0*1*|[01]*
C 01*2|[0]*[2]+[1]
%%
{A}|{B} {printf("R1\n");}
{D} {printf("R2\n");}
{C} {printf("R3\n");}
%%
int main(void)
{
	yylex();
	return 0;
}