%{
	#include<stdio.h>
	#include<stdlib.h>
	int sumSquares = 0;
%}

%%
[0-9]+ {
	int num = atoi(yytext);
	sumSquares += num * num;
}
\n {
	printf("Sum of squares: %d\n", sumSquares);
	sumSquares = 0;
}
.|\n {}
%%

int main()
{
	printf("Enter the numbers: \n");
	yylex();
	return 0;
}

int yywrap(){
	return 1;
}