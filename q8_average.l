%{
	#include<stdio.h>
	#include<stdlib.h>
	float sum = 0;
	float count = 0;
%}

%%
[0-9]+ {
	float num = atof(yytext);
	sum += num;
	count++;
}
\n {
	if(count>0){
		printf("Average: %.2f", sum/count);
	}
	else{
		printf("No numbers were entered");
	}
	sum =0;
	count = 0;
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