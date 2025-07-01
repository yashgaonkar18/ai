%{
	#include<stdio.h>
	#include<stdlib.h>

	int countPositive = 0;
	int countNegative = 0;
	int countZero = 0;
%}

%%
[+-]?[0-9]+(\.[0-9]+)? {
	double num = atof(yytext);
	if(num>0) countPositive++;
	else if (num <0) countNegative++;
	else countZero++;
}
.|\n {}
%%
int main()
{
	printf("Enter the numbers: \n");
	yylex();

	printf("Positive Numbers: %d\n", countPositive);
	printf("Negative Numbers: %d\n", countNegative);
	printf("Zero Numbers: %d\n", countZero);
	return 0;
}

int yywrap(){
	return 1;
}