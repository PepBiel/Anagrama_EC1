*-----------------------------------------------------------
* Tiyulo  : P1 (2021-2022) - Anagram
* Autores : Josep Gabriel Fornés Reynés y Toni Cruz Carrió
*-----------------------------------------------------------
            ORG    $1000
WORD_SIZE:  EQU     7
WORD_1:     DC.B    'armonia'
WORD_2:     DC.B    'mariano'
IS_ANAGRAM: DC.B    1
NOT_FOUND:  DS.B    1     
*-----------------------------------------------------------

START:

    MOVE.B  #WORD_SIZE,D0       ;El D0 se usará para las repeticiones del DBRA
    SUB.B   #1,D0
    MOVE.B  #0,D3               ;D3 será el contador de las letras iguales
    LEA.L   WORD_1,A1 
    LEA.L   WORD_2,A2
    MOVE.B  #0,IS_ANAGRAM
    MOVE.B  #0,NOT_FOUND

PAR1:
    MOVE.B  (A1)+,D1     
    
PAR2:
    MOVE.B  (A2)+,D2
    CMP.B   D2,D1               ;Se comparan las letras de cada palabra
    BEQ     COMPROVACION        ;Si D2 y D1 son iguales, bota a ET3
    DBRA    D0,PAR2
    ADD.B   #1,D4               ;D4 cuenta las letras no repetidas y al final representará el NOT_FOUND
    BRA     COMPROVACION

ANAGRAMA:
    CMP.B   #0,D4
    BNE     NOT_FOUD            ;Si hay alguna letra no repetida, salta a ET4
    ADD.B   #1,IS_ANAGRAM       ;Si no se cumple la condición anterior, va a ser un anagrama
    SIMHALT                     ;Ponemos el SIMHALT porque si llega a esta intrucción, es porque
                                ;es un anagrama y se termina el proceso
     
        
COMPROVACION:
    SUB.W   #1,A2               ;Restamos 1 al registro de direcciones para colocarnos en la letra
    MOVE.B  #0,(A2)             ;encontrada y asì poner 0 a para que el programa no repita la letra
    LEA.L   WORD_2,A2
    MOVE.W  #WORD_SIZE,D0
    SUB.B   #1,D0    
    ADD.B   #1,D3
    CMP.B   #WORD_SIZE,D3       ;Comparamos las letras iguales con la longitud de las palabras para
    BEQ     ANAGRAMA            ;poder salir del bucle si coinciden
    BRA     PAR1

NOT_FOUD:
    MOVE.B   D4,NOT_FOUND
   
    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source








*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
