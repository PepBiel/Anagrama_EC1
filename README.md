# Anagram Checker en ensamblador 68000

Proyecto de **Estructura de Computadores 1** desarrollado en ensamblador para **Motorola 68000** (`.X68`). El programa comprueba si dos palabras son anagramas y deja el resultado en memoria.

## Descripción

El objetivo del proyecto es comparar dos palabras de longitud fija y determinar si contienen exactamente las mismas letras, aunque estén en distinto orden.

En el ejemplo incluido en el código:

- `WORD_1 = "armonia"`
- `WORD_2 = "mariano"`
- `WORD_SIZE = 7`

El programa recorre ambas cadenas, busca coincidencias letra a letra y marca como usadas las letras encontradas en la segunda palabra para evitar contarlas dos veces. Si todas las letras de la primera palabra encuentran correspondencia, el programa considera que hay anagrama.

## Tecnologías

- Ensamblador **Motorola 68000**
- Formato fuente **`.X68`**
- Ejecución pensada para simuladores tipo **Easy68K / X68**

## Estructura del programa

El fichero define estas constantes y variables principales:

- `WORD_SIZE`: longitud de las palabras a comparar.
- `WORD_1`: primera palabra.
- `WORD_2`: segunda palabra.
- `IS_ANAGRAM`: vale `1` si las palabras son anagramas.
- `NOT_FOUND`: guarda cuántas letras no se han encontrado.

### Registros utilizados

- `D0`: contador de iteraciones para el bucle con `DBRA`.
- `D1`: letra actual de `WORD_1`.
- `D2`: letra actual de `WORD_2`.
- `D3`: contador de letras encontradas.
- `D4`: contador de letras no encontradas.
- `A1`: puntero a `WORD_1`.
- `A2`: puntero a `WORD_2`.

## Funcionamiento

El algoritmo sigue esta idea:

1. Inicializa punteros, contadores y variables de resultado.
2. Lee una letra de `WORD_1`.
3. Recorre `WORD_2` buscando una coincidencia.
4. Si encuentra la letra, la sustituye por `0` en `WORD_2` para no reutilizarla.
5. Repite el proceso hasta comprobar todas las letras.
6. Si todas las letras han sido emparejadas, guarda `1` en `IS_ANAGRAM`.
7. Si quedan letras sin encontrar, guarda el total en `NOT_FOUND`.

## Resultado esperado

Tras ejecutar el programa:

- `IS_ANAGRAM = 1` si ambas palabras son anagramas.
- `IS_ANAGRAM = 0` si no lo son.
- `NOT_FOUND` indica cuántas letras no han podido emparejarse.

## Cómo ejecutar

1. Abrir el archivo `41616030-41616618.X68` en el simulador.
2. Ensamblar el programa.
3. Ejecutarlo desde la etiqueta `START`.
4. Revisar en memoria los valores de:
   - `IS_ANAGRAM`
   - `NOT_FOUND`

## Aspectos interesantes del proyecto

- Uso de **punteros a memoria** con registros de dirección.
- Recorrido de cadenas byte a byte.
- Uso de **bucles con `DBRA`**.
- Gestión manual de estado y resultados en memoria.
- Ejemplo claro de resolución de un problema de cadenas a bajo nivel.

## Posibles mejoras

- Permitir palabras de longitud variable.
- Añadir comprobación previa de longitud antes de comparar.
- Restaurar `WORD_2` tras la comprobación para no modificar el contenido original.
- Inicializar explícitamente todos los registros auxiliares usados en el algoritmo.
- Mejorar nombres de etiquetas y comentarios para hacer el código más mantenible.

## Autoría

- Josep Gabriel Fornés Reynés
- Antoni Cruz Carrió

