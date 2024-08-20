# Programas en Lex

**Realizado por:**
- Andres Sebastian Urrego Amaya
- Sebastian Cortes Briceño
- Julian Esteban Rincon Rodriguez
- Mariana Ruge Vargas

## Para ejecutar el proyecto
A continuacion se presentan los pasos para poder correr en  entorno local el contenido de este repositorio.

### Requisitos
#####  1. Tener   GCC  (Compilador de C)
Para ejecutar el proyecto necesitas tener  un compilador de C en tu maquina, puedes verificar la version y su instalacion con el siguiente comando.
```bash
	gcc --version
```
Si no te muestra la version del compilador, por favor ejecuta en la terminal.
```bash
    sudo apt-get update
    sudo apt-get install gcc
```
Esto instalara el compilador de C en tu maquina.

#####  2. Tener **Flex **(Es una herramienta de analizadores lexicos) instalado en tu maquina o entorno local.
Para verificar si esta instalado, por favor ejecuta en la terminal.
```bash
flex  --version
```
Este comando deberia mostrar la version de flex que se encuentra en tu maquina.

En caso de no tenerlo instalado, puedes instalarlo con el siguiente comando:
```bash
sudo apt install flex gcc make
```
o con el siguiente comando:
```bash
  sudo apt-get update
  sudo apt-get install flex bison gcc
```

- El desarrollo de los programas se hizo con la siguiente con esta version del compilador de  C.
```bash
gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
```
Y con esta version de Flex
```bash
flex 2.6.4
```

### Descripcion
Este proyecto contiene 5 ejercicios desarrollados en Lex, cada uno relacionado con el procesamiento de texto y el reconocimiento de tokens. Para aportar a ellos, o ver su funcionamiento en entorno local, ten en cuenta estos pasos.

##### 1. Clona el respositorio a tu entorno local.
Para clonar este proyecto en tu maquina, ejecuta el siguiente comando.

```bash
git clone https://github.com/mariana-ruge/Programas-en-LEX.git
```

Esto dejara en la ubicacion donde hayas clonado, una carpeta con todos los elementos de este repositorio.
##### 2.  Ubicate en la carpeta del proyecto.
Este proyecto contiene una carpeta general, a la que puedes acceder con:
```bash
cd 'Programas-en-LEX'
```
Dentro de la misma, estan  otras 5 carpetas cada una con el ejercicio que desarrollan.
- **Punto 1:** Contar líneas, palabras y caracteres.
- **Punto 2:** Traductor de inglés a español.
- **Punto 3:** Reconocer símbolos y caracteres de la calculadora.
- **Punto 4:** Reconocimiento de tokens.
- **Punto 5:** Clasificación de números complejos.
Puedes navegar a cada  carpeta de desarrollo  con:
```bash
cd  'Punto *Numero del punto* '
```

##### 3. Ejecuta los ejercicios
Una vez hayas seleccionado el ejercicio y te hayas ubicado en la carpeta correspondiente, debes compilar y ejecutarlo. Puedes hacerlo de la siguiente forma:

**Para compilar**

(Asegurate que el archivo a compilar este en la carpeta)

Usa el siguiente comando en la terminal.
```bash
	gcc lex.yy.c -o  nombre del archivo  -lfl
```
Una vez compilado, ya puedes ejecutar el archivo en la terminal, de la siguiente forma.


**Para ejecutar**
```bash
	./nombre del archivo
```
Esto deberia ejecutar o mostrar el resultado de la ejecucion en tu terminal.



