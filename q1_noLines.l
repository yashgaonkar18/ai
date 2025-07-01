%{
 #include<stdio.h>
 int line = 0;
%}

%%
\n line++;
%%

int main(){
	yyin = fopen("example.txt","r+");
	yylex();
	printf("\nNumber of lines: %d",line);
	return 0;
}

int yywrap(){
	return 1;
}