%{
	#include<stdio.h>
	#include<string.h>

	int countToken = 0;
	
	char *keywords[] = {"int","float","char","if","else","for","while","return","main","void"};

	int isKeyword(const char *word){
		int total = sizeof(keywords)/sizeof(keywords[0]);

		for(int i=0;i<total;i++){
			if(strcmp(keywords[i], word)==0) return 1;
		}	
		return 0;
	}
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {
	if(isKeyword(yytext)){
		printf("Keyword\t: %s\n",yytext);  
	}
	else{
		printf("Identifier\t: %s\n",yytext);  
	}
	countToken++;
}

"=="|"!="|"<="|">="|[\+\-\*/=<>] {
	printf("Operator\t: %s\n",yytext);  
	countToken++;
}

[(){};,] {
	printf("Separator\t: %s\n",yytext);  
	countToken++;
}

[\t\n]+ ;

. {}

%%
int main()
{
	printf("Enter the expression: ");
	yylex();
	printf("Total Tokens: %d\n", countToken);
	return 0;
}

int yywrap(){
	return 1;
}