%{
#include <stdio.h>
#include <string.h>

void prompt_input();
%}

%%

[+-]?[0-9]+(\.[0-9]+)?[iI]?	{
                                if (strchr(yytext, 'i') != NULL || strchr(yytext, 'I') != NULL) {
                                    if (strpbrk(yytext, "+-") == NULL) {
                                        printf("Número Imaginario Puro: %s\n", yytext);
                                    } else {
                                        printf("Número Complejo: %s\n", yytext);
                                    }
                                } else {
                                    printf("Número Real: %s\n", yytext);
                                }
                                prompt_input();
                            }

[+-]?[0-9]+(\.[0-9]+)?∠[0-9]+(\.[0-9]+)?	{ printf("Número Complejo en Forma Polar: %s\n", yytext); prompt_input(); }

.	{ printf("Carácter no reconocido: %s\n", yytext); prompt_input(); }

\n  { /* Ignorar saltos de línea */ }

%%

void prompt_input() {
    printf("\nIngrese un número complejo: ");
}

int main(int argc, char **argv)
{
    prompt_input();
    yylex();
    return 0;
}
