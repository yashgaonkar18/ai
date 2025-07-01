%{
#include <stdio.h>
#include <stdlib.h>

int choice;
%}

%%
[_a-zA-Z][_a-zA-Z0-9]* {
    if (choice == 1)
        printf("\n%s is a valid ID\n", yytext);
    else
        printf("\n%s is not a valid input for this option\n", yytext);
    return 0;
}

[a-zA-Z0-9._%+-]+@[a-zA-Z]+\.[a-z]{2,} {
    if (choice == 2)
        printf("\n%s is a valid email address\n", yytext);
    else
        printf("\n%s is not a valid input for this option\n", yytext);
    return 0;
}

[a-zA-Z ]+ {
    if (choice == 3)
        printf("\n%s is a valid name\n", yytext);
    else
        printf("\n%s is not a valid input for this option\n", yytext);
    return 0;
}

.* {
    if (choice == 1)
        printf("\n%s is not a valid ID\n", yytext);
    else if (choice == 2)
        printf("\n%s is not a valid email address\n", yytext);
    else if (choice == 3)
        printf("\n%s is not a valid name\n", yytext);
    return 0;
}

%%

int main() {
    char again;
    do {
        printf("\n1: Validate ID\n2: Validate Email\n3: Validate Name\n");
        printf("Enter your choice: ");
        if (scanf("%d", &choice) != 1) {
            printf("Invalid input. Exiting...\n");
            return 1;
        }
        while (getchar() != '\n');

        printf("Enter the string to validate: ");
        yylex();

        printf("\nDo you want to validate again? (y/n): ");
        scanf(" %c", &again);
    } while (again == 'y' || again == 'Y');

    return 0;
}

int yywrap() {
    return 1;
}
