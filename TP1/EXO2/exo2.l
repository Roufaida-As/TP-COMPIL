%{
#include <stdio.h>
%}

%option noyywrap

%%

[0-9]+                  { 
    printf("Nombre : %s (taille=%d)\n", yytext, yyleng); 
}

[A-Za-z][A-Za-z0-9]*    { 
    printf("Mot : %s (taille=%d)\n", yytext, yyleng); 
}

.                        { 
    printf("Caractere indesirable : %s\n", yytext); 
}

%%

int main() {
    yylex();
    return 0;
}
