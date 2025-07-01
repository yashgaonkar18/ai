%{
	#include<stdio.h>
	#include<stdlib.h>
	#define cm_to_inch 2.54
%}

%%
[0-9]+(.\[0-9]+)? {
	double cm = atof(yytext);
	double inch = cm / cm_to_inch;

	printf("Centimeters: %.2f\n",cm);
	printf("Inch: %.2f\n",inch);
}

.|\n {}
%%

int main()
{
	printf("Enter the distance in cm: ");
	yylex();
	return 0;
}

int yywrap(){
	return 1;
}