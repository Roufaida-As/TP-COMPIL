%{
#include <stdio.h>
%}

%option noyywrap

%%

%[abc%]+%                { printf("Mot du langage L : %s\n", yytext); }

[A-Za-z0-9]{8}           { printf("Mot de passe valide : %s\n", yytext); }

[A-Za-z][A-Za-z0-9]*     { printf("Identificateur : %s\n", yytext); }

.|\n                     { /* ignorer tout autre caractère */ }

%%

int main() {
    yylex();
    return 0;
}
