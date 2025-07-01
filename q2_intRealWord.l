%{
	#include<stdio.h>
%}

%%
[0-9]+\.[0-9]+ {printf("Real Number\n");}
[0-9]+ {printf("Integer\n");}
[a-zA-Z]+ {printf("Word\n");}
%%
int main()
{
	printf("Enter the string to process: \n");
	yylex();
	return 0;
}

int yywrap(){
	return 1;
}