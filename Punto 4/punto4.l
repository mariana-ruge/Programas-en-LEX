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
[0-9]+ {
    yylval = atoi(yytext);  // Convierte la secuencia de dígitos en un número entero
    return NUMBER;          // Retorna el token NUMBER
}
\n { return EOL; }          // Reconoce el fin de línea y retorna el token EOL
[ \t] { /* Ignora espacios en blanco y tabulaciones */ }
. {
    printf("Carácter desconocido %c\n", *yytext);
    return -1;              // Retorna -1 para indicar un carácter no reconocido
}

%%

int main(int argc, char **argv)
{
    // Si se proporciona un archivo como argumento, abrirlo
    if(argc > 1) {
      //'r' permisos de lectura
        FILE *file = fopen(argv[1], "r");
        //No se encontro el archivo de entrada
        if(!file) {
            perror("No se puede abrir el archivo"); //Devuelve un error
            return 1;
        }
        yyin = file;  // Establece yyin para leer desde el archivo
    }

    // Tok es la variable que almacena el token retornado
    int tok;
    while((tok = yylex())) {
        if(tok == 0) break;  // Si yylex retorna 0, se ha terminado la entrada
        //Funcion switch para identificar los operadores y los operandos
        switch(tok) {
          //Numeros ingresados
            case NUMBER:
                printf("NUMBER = %d\n", yylval);
                break;
         //Operador +
            case ADD:
                printf("ADD\n");
                break;
        //Operador -
            case SUB:
                printf("SUB\n");
                break;
      //Operador NULL
            case MUL:
                printf("MUL\n");
                break;
       //Operador /
            case DIV:
                printf("DIV\n");
                break;
        //Operador -
            case ABS:
                printf("ABS\n");
                break;
      //End Of Line
            case EOL:
                printf("EOL\n");
                break;
      //No se identifica el caracter
            case -1:
                printf("Error: Carácter desconocido\n");
                break;
            default:
                printf("Token desconocido: %d\n", tok);
        }
    }

    return 0;  // Fin del programa
}
