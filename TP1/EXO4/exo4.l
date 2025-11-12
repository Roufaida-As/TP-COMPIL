%{
#include <stdio.h>
int ch;
FILE *out;
%}

%option noyywrap

%%
2CSSI    {
            ch = input();           /* lit le caractère suivant */
            if (ch == 'L' || ch == 'Q') {
                fprintf(out, "1CS");
            } else {
                /* ce n'était pas L ni Q : remettre le caractère dans le flux
                   et écrire le texte courant tel quel ("2CSSI") */
                unput(ch);
                fprintf(out, "%s", yytext);
            }
         }

.|\n     {
            fprintf(out, "%s", yytext);
         }
%%

int main(void) {
    out = fopen("output.txt", "w");
    if (!out) {
        perror("Erreur ouverture fichier de sortie");
        return 1;
    }

    yylex();
    fclose(out);
    return 0;
}
