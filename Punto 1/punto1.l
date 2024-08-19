%{
#include <stdio.h>

// Variables para llevar el conteo
int numLineas = 0;
int numPalabras = 0;
int numCaracteres = 0;

%}

%%

\n               { numLineas++; } // Cuenta una línea cada vez que encuentra un salto de línea
[[:alnum:]]+     { numPalabras++; } // Cuenta una palabra cuando encuentra una secuencia de caracteres alfanuméricos
.                { numCaracteres++; } // Cuenta cualquier carácter que no sea espacio ni salto de línea

%%

int main(int argc, char **argv) {
    // Verifica si se proporcionó un archivo como argumento
    if(argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if(file) {
            yyin = file;
            yylex();
            fclose(file);
        } else {
            printf("No se pudo abrir el archivo.\n");
            return 1;
        }
    } else {
        printf("Por favor, proporcione un archivo como argumento.\n");
        return 1;
    }

    // Imprime los resultados
    printf("Número de Líneas: %d\n", numLineas);
    printf("Número de Palabras: %d\n", numPalabras);
    printf("Número de Caracteres: %d\n", numCaracteres);

    return 0;
}
