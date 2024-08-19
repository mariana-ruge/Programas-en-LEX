%{
#include <stdio.h>

// Variables para llevar el conteo
//Se inicializan en 0
int numLineas = 0;
int numPalabras = 0;
int numCaracteres = 0;

%}

%%

\n               { numLineas++; } // Cuenta una línea cada vez que encuentra un salto de línea
[[:alnum:]]+     { numPalabras++; } // Cuenta una palabra cuando encuentra una secuencia de caracteres alfanuméricos
.                { numCaracteres++; } // Cuenta cualquier carácter que no sea espacio ni salto de línea

%%

//Funcion main
int main(int argc, char **argv) {
    // Verifica si se proporcionó un archivo como argumento
    if(argc > 1) {
      //Arbir el archivo en permiso de lectura ('r')
        FILE *file = fopen(argv[1], "r");
        //Si se encuentra el archivo
        if(file) {
          //Declarar la entrada, y declara un yyin para que LEX lea el archivo
            yyin = file;
          //Ejecuta el analizador lèxico para procesar el archivo y contar las lineas, palabras y caracteres
            yylex();
            //Cerrar el archivo despues de procesarlo
            fclose(file);
        } else {
          //No se encuentra el archivo, devolver un error
            printf("No se pudo abrir el archivo.\n");
            return 1;
        }
    } else {
      //No hay un archivo como argumento
        printf("Por favor, proporcione un archivo como argumento.\n");
        return 1;
    }

    // Imprime los resultados del conteo en la consola
    printf("Número de Líneas: %d\n", numLineas);
    printf("Número de Palabras: %d\n", numPalabras);
    printf("Número de Caracteres: %d\n", numCaracteres);

    //Termina el programa
    return 0;
}
