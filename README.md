# Analizador Semantico con Flex y Yacc  
Josue Avendano Galarza

## Descripcion

Este proyecto implementa un analizador lexico y un analizador sintactico con soporte para analisis semantico basico, utilizando Flex (Lex) y Yacc (Bison).  
El objetivo es procesar un archivo fuente escrito en un subconjunto del lenguaje C, revisar su estructura y validar el correcto uso de identificadores dentro de diferentes alcances (scopes).

El analizador lee un archivo llamado `input.c` y genera mensajes en consola sobre posibles errores sintacticos o semanticos.

---

## Alcances del analisis semantico

El proyecto soporta las siguientes validaciones semanticas:

### 1. Tabla de simbolos y manejo de scopes
El sistema mantiene una pila de scopes correspondiente a:

- Programa global  
- Bloques internos `{ ... }`  
- Cuerpos de funciones

Cada vez que se entra en un bloque se crea un nuevo scope, y al salir se elimina.

### 2. Declaracion de variables
Cada variable declarada se inserta en el scope actual.  
Si se intenta declarar una variable que ya existe en el mismo scope, se reporta:

Error semantico: variable redeclarada

### 3. Uso de variables antes de ser declaradas
Si una variable se usa sin haber sido declarada en ningun scope visible, se reporta:

Error semantico: variable no declarada


### 4. Variables fuera de alcance
Si una variable era valida dentro de un bloque pero se usa fuera de el, tambien se genera un error.

### 5. Validacion de funciones llamadas
Las llamadas a funciones tambien se verifican como si fueran identificadores, y si no estan declaradas, se reporta.

---

## Archivos del proyecto

| Archivo      | Descripcion |
|--------------|-------------|
| `lexer.l`    | Analizador lexico implementado en Flex |
| `parser.y`   | Analizador sintactico y semantico implementado en Yacc |
| `input.c`    | Archivo de prueba con codigo fuente |
| `README.md`  | Documentacion del proyecto |

---

## Reglas del lenguaje soportado

El analizador reconoce:

- Declaraciones de variables
- Declaracion de funciones con parametros
- Bloques `{ ... }` con scopes anidados
- Asignaciones
- Llamadas a funcion
- Expresiones aritmeticas con `+ - * /`
- Instrucciones `return`
- Comentarios de linea y bloque
- Numero enteros e identificadores

---

## Como compilar y ejecutar

### 1. Generar el parser con Yacc

Esto genera:

- `y.tab.c`
- `y.tab.h`

### 2. Generar el lexer con Flex
flex lexer.l
Esto genera:

- `lex.yy.c`

### 3. Compilar todo con GCC
gcc lex.yy.c y.tab.c -o parser.exe

### 4. Ejecutar el analizador
parser.exe input.c

---

## Ejemplo de salida
=== Iniciando analisis ===
Error semantico (linea 22): variable 'e' no declarada
Error semantico (linea 23): variable 'd' no declarada
=== Analisis completado ===

Si el codigo no contiene errores:
=== Iniciando analisis ===
=== Analisis completado ===
