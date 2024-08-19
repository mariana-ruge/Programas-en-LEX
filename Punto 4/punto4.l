/* Reconoce tokens para una calculadora e imprime los tokens y sus valores */

%{
 // Definición de los tipos de tokens utilizando una enumeración
 enum yytokentype {
    NUMBER = 258,  // Token para números
    ADD = 259,     // Token para suma (+)
    SUB = 260,     // Token para resta (-)
    MUL = 261,     // Token para multiplicación (*)
    DIV = 262,     // Token para división (/)
    ABS = 263,     // Token para valor absoluto (|)
    EOL = 264      // Token para fin de línea End Of Line
 };

 // Variable para almacenar el valor numérico de un token NUMBER
 int yylval;
%}

%%

"+" { return ADD; }         // Reconoce el operador '+' y retorna el token ADD
"-" { return SUB; }         // Reconoce el operador '-' y retorna el token SUB
"*" { return MUL; }         // Reconoce el operador '*' y retorna el token MUL
"/" { return DIV; }         // Reconoce el operador '/' y retorna el token DIV
"|" { return ABS; }         // Reconoce el operador '|' y retorna el token ABS
[0-9]+ { //Se toman valores en el rango de 0 a 9
    yylval = atoi(yytext);  // Convierte la secuencia de dígitos en un número entero
    return NUMBER;          // Retorna el token NUMBER
}
// \n significa un salto de lìnea
\n { return EOL; }          // Reconoce el fin de línea y retorna el token EOL
[ \t] { /* Ignora espacios en blanco y tabulaciones */ }
. { printf("Carácter desconocido %c\n", *yytext); }  // Maneja caracteres no reconocidos

%%

int main(int argc, char **argv)
{
    //Tok es la conversion del token
    int tok;
    // Bucle para escanear y procesar tokens hasta que se termine la entrada
    while((tok = yylex())) {
        printf("%d", tok);  // Imprime el valor del token
        if(tok == NUMBER)
            printf(" = %d\n", yylval);  // Si es un número, imprime también su valor
        else
            printf("\n");  // Para otros tokens, solo imprime una nueva línea
    }
    return 0;  // Fin del programa
}
