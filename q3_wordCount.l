%{
	#include<stdio.h>
	#include<string.h>

	int word_count = 0;
	char search[100];
%}

%%
[a-zA-Z]+ {
	if(strcmp(yytext, search)== 0)
		word_count++;
}

.|\n {}
%%

int main()
{
	printf("Enter the word to search: ");
	scanf("%s", search);

	yyin = fopen("count.txt","r");
	yylex();

	printf("The word %s appears %d times", search, word_count);
	return 0;
}

int yywrap(){
	return 1;
}