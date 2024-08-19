%{
#include <stdio.h>

// Declaración de la función para traducir la entrada
void translate(char *input);
%}

%%

/* Reglas de traducción:
   Cada una de estas reglas reconoce una palabra en inglés
   y la traduce al español imprimiéndola en la consola. *//* Reglas de traducción (sin cambios) */
book            { printf("libro "); }
books           { printf("libros "); }
apple           { printf("manzana "); }
apples          { printf("manzanas "); }
cat             { printf("gato "); }
cats            { printf("gatos "); }
dog             { printf("perro "); }
dogs            { printf("perros "); }
house           { printf("casa "); }
houses          { printf("casas "); }
car             { printf("coche "); }
cars            { printf("coches "); }
mouse           { printf("ratón "); }
mice            { printf("ratones "); }
child           { printf("niño "); }
children        { printf("niños "); }
tree            { printf("árbol "); }
trees           { printf("árboles "); }

/* Regla para palabras no reconocidas */
[a-zA-Z]+       { printf("Error: la palabra '%s' no puede ser traducida. ", yytext); }

/* Manejar espacios, tabs y saltos de línea */
[ \t\n]+        { printf("%s", yytext); }

/* Regla para manejar caracteres individuales no alfabéticos */
.               { printf("%s", yytext); }
%%

/* Regla para manejar caracteres individuales no alfabéticos que no se pueden traducir.
   Esto asegura que cualquier carácter no alfabético se maneje correctamente. */
.               { /* Ignorar caracteres individuales no alfabéticos */ }

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        for (int i = 1; i < argc; i++) {
            translate(argv[i]);
        }
    } else {
        yylex(); /* Analizar la entrada estándar */
    }
    return 0;
}

/* Función translate:
   - Toma una cadena de entrada (input) y la analiza para traducirla.
   - Usa las funciones de Flex para procesar la cadena en un buffer temporal. */
void translate(char *input) {
  //Establecer un buffer de Flex para la cadena de entrada
    YY_BUFFER_STATE bp = yy_scan_string(input);
    //Ejecutar  el analisis lexico
    yylex();
    //Eliminar el buffer de Flex para liberar recursos
    yy_delete_buffer(bp);
}
