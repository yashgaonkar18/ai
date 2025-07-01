%{
	#include<stdio.h>
	#include<stdlib.h>
	#define PI 3.14159

	double radius;
%}

%%
[0-9]+(\.[0-9]+)? {
	radius = atof(yytext);
	double area = PI * radius * radius;
	double circumference = 2 * PI * radius;

	printf("Area of circle: %.2f\n", area);
	printf("Circumference of circle: %.2f\n", circumference);
}
.|\n {}
%%

int main()
{
	printf("Enter the radius: ");
	yylex();
	return 0;
}

int yywrap(){
	return 1;
}