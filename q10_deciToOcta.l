%{
	#include<stdio.h>
	#include<stdlib.h>
	char octal[20];
%}

%%
[0-9]+ {
	int num = atoi(yytext);

	int i=0;

	if(num == 0){
		printf("Octal: 0\n");
	}
	else{
		while(num > 0){
			octal[i++] = '0' + (num % 8);
			num /= 8;
		}

		printf("Octal: ");
		for(int j = i-1;j>=0;j--){
			printf("%c", octal[j]);
		}
		printf("\n");
	}
}

.|\n {}
%%

int main()
{
	printf("Decimal: ");
	yylex();
	return 0;
}

int yywrap(){
	return 1;
}