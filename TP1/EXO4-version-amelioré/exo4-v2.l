%{
#include <stdio.h>
FILE *out;
%}

%option noyywrap

%%

2CSSIL|2CSSIQ    { fprintf(out, "1CS"); }

2CSSI            { yymore(); }

2CSSI.           { yyless(5); fprintf(out, "%s", yytext); }

.|\n             { fprintf(out, "%s", yytext); }

%%

int main(void) {
    out = fopen("output.txt", "w");
    if (!out) {
        perror("Erreur ouverture fichier");
        return 1;
    }
    
    yylex();
    fclose(out);
    
    return 0;
}