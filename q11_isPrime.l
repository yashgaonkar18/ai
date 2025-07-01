%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<math.h>

	int isPrime(int num){
		if (num <= 1) return 0;
	
		for(int i=2;i<= sqrt(num); i++){
			if(num % i == 0) return 0;
		}

		return 1;
	}
%}

%%
[0-9]+ {
	int num = atoi(yytext);

	if(isPrime(num)){
		printf("The %d is prime number\n",num);
	}
	else{
		printf("The %d is not a prime number\n",num);
	}
}

.|\n {}
%%

int main()
{
	printf("Enter the number: ");
	yylex();
	return 0;
}

int yywrap(){
	return 1;
}