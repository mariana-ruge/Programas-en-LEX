%{
//Importar librerias
#include <stdio.h> //Funciones estandar como printf
#include <string.h> //Manipulacion de cadenas como strchr
// Declaración de la función para solicitar nueva entrada al usuario.


void prompt_input(); //Funcion para introducir datos por consola
%}

//LEX para no usar envoltorio yywrap
%option noyywrap

%%
//Expresion regular para detectar numeros reales, complejos y puros


//1. Signo
//[+-] -> Signo
//? el conjunto de signos es opcional -> el numero puede tener o no signos
//2. Validar el digito
//[0-9] Un conjunto de caracteres que coincide con cualquier digito del 0 al 9
// + Modificador de cuantificacion que indica el caracter anteriores

//3. (\.[0-9]+)?
// \. coincidir con cualquier punto literal
// [0-9]+ Coincide con uno o mas digitos

//4. [iI]
// Pueden coincidir los caracteres con i p I

[+-]?[0-9]+(\.[0-9]+)?[iI]? {

  //Si se encuentra una 'i' o 'I' se trata de un numero imaginario
    if (strchr(yytext, 'i') != NULL || strchr(yytext, 'I') != NULL) {
      //Sino hay signos '+' o '-' es un numero imaginario
        if (strpbrk(yytext, "+-") == NULL) {
          //Imprimir "puro"
            printf("Número Imaginario Puro: %s\n", yytext);
        } else {
          //Si esta el signo, es complejo ('+' o '-')
            printf("Número Complejo: %s\n", yytext);
        }
    } else {
      //Sino hay 'i' o 'I' es un numero real
        printf("Número Real: %s\n", yytext);
    }
    //Solicita una nueva entrada al usuario
    prompt_input();
}

//Expresion regular para numeros complejos en forma polar
[+-]?[0-9]+(\.[0-9]+)?°[0-9]+(\.[0-9]+)? {
    printf("Número Complejo en Forma Polar: %s\n", yytext);
    //Solicitar la entrada a los usuarios
    prompt_input();
}

[ \t]+  { /* Ignorar espacios en blanco y tabulaciones */ }

\n      { /* Ignorar saltos de línea */ }

.       {
  //Sino coincide con la lista de expresiones regulares declarada señalara un error
    printf("Carácter no reconocido: %s\n", yytext);
    //Solicitar una entrada al usuario
    prompt_input();
}

%%

//Definicion de la funcion para solicitar una nueva entrada al usuario
void prompt_input() {
    printf("\nIngrese un número complejo: "); //Ingresar el numero complejo
    fflush(stdout); //Vaciar el buffer de la consola
}

//Funcion main
int main(int argc, char **argv) {
  //Solicitar al usuario que ingrese un numero complejo
    prompt_input();
    //Ejecutar el analizador lexico
    yylex();
    //Fin del programa
    return 0;
}
