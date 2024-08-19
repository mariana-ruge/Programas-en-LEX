%{
	#include <stdio.h>
%}

%%

[0-9]+(\.[0-9]+)? {printf("NUMERO %s\n", yytext); }
/*
	Explicacion de esta expresion
	 [0-9]+(\.[0-9]+)?
	 - Reconoce un numero como entero o decimal
	 - La primera parte  [0-9]+ reconoce una secuencia de uno o mas digitos.
	 - La segunda parte (\. [0-9]+)? reconoce opcionalmente un punto seguido de uno o mas digitos, lo que permite detectar numeros decimales.
	 - Cuando se lee un numero, se imprime con el formato "NUMERO <numero> (yytext)".
*/

// "+" Reconoce el operador suma '+', imprime MAS cuando lo encuentra
"+"  {printf("MAS\n"); }
// "-" Reconoce el operador resta '-'', imprime MENOS cuando lo encuentra
"-"  {printf("MENOS\n"); }
// "*" Reconoce el operador multiplicacion '*', imprime MULTIPLICACION cuando lo encuentra
"*"  {printf("MULTIPLICACION\n"); }
// "/" Reconoce el operador division '/', imprime DIVISION cuando lo encuentra
"/"  {printf("DIVISION\n"); }
// "|" Reconoce el operador valor absoluto '|', imprime ABS cuando lo encuentra
"|"  {printf("ABS\n"); }
// "%" Reconoce el operador modulo, imprime MOD cuando lo encuentra
"%"  {printf("MOD\n"); }
// "Reconoce parentisis izquierdo cuando lo encuentra, imprime CHAR: PARENTESIS IZQUIERDO" cuando lo encuentra
"("  {printf("CHAR: PARENTESIS IZQUIERDO\n"); }
// "Reconoce parentisis derecho cuando lo encuentra, imprime CHAR: PARENTESIS DERECHO" cuando lo encuentra
")"  {printf("CHAR: PARENTESIS DERECHO\n"); }
// "Reconoce un salto de linea cuando lo encuentra, imprime LINEA NUEVA
\n   {printf("LINEA NUEVA\n"); }
[ \t] { }
/*
 - - Reconoce cualqueier otro caracter no manejado por las reglas anteriores
 	- Imprime "TOKEN NO RECONOCIDO" seguido por el input no reconocido
*/
.    {printf("TOKEN NO RECONOCIDO /n", yytext); }

%%
/*
	-Funcion principal del programa
	 - Ejecuta la funcion 'yylex()' que es el analizador lexico que procesara la entrada
	 - Retorna 0 para decir que el programa se ejecuto con exito
*/
int main(){
	yylex();
	return 0;
}

/*
 - Funcion 'yywrap()' estandar en programas lexico
 - Retorna 1 para indicar que se ha alcanzado el final de la entrada
*/

int yywrap(){
	return 1;
}
