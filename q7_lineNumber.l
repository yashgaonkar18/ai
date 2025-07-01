%{
	#include<stdio.h>
	int lineno = 1;
%}

%%
.*\n {printf("%5d %s",lineno++,yytext);}
%%
int main()
{
	yyin = fopen("example.txt","r");
	yylex();
	return 0;
}

int yywrap(){
	return 1;
}