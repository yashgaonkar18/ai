%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<math.h>

	float a = 0, b = 0;
	int op = 0;

	void calculate();
%}

%%
[0-9]+(\.[0-9]+)? {calculate();}

"+" {op = 1;}
"-" {op = 2;}
"*" {op = 3;}
"/" {op = 4;}
"pow" {op = 5;}

\n {printf("Result: %.2f\n", a); a = 0; op = 0;}

[\t]+ ;

.	{printf("Invalid input");}
%%

void calculate(){
	if(op == 0){
		a = atof(yytext);
	}
	else{
		b = atof(yytext);

		switch(op){
			case 1: a += b; break;
			case 2: a -= b; break;
			case 3: a *= b; break;
			case 4:
				if(b != 0) a /= b;
				else printf("Error: Division by zero\n");
				break;
			case 5: a = pow(a,b); break;
			defualt: 
				printf("Invalid operator\n");
		}
	}
}

int main()
{
	printf("Enter the expression: \n");
	yylex();
	return 0;
}

int yywrap(){
	return 1;
}