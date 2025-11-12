%{
#include <stdio.h>
int nbMaj = 0;
%}

%option noyywrap

%%
[A-Z]    { nbMaj++; printf("Majuscule : %s\n", yytext); }
[a-z]    { printf("Minuscule : %s\n", yytext); }
.        { /* ignorer */ }
%%

int main() {
    yylex();
    printf("Nombre de majuscules reconnues : %d\n", nbMaj);
    return 0;
}
