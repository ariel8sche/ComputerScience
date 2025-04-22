extern malloc
extern free
extern fprintf

section .data
fmt_str: db "%s", 0


section .text

global strCmp
global strClone
global strDelete
global strPrint
global strLen

; ** String **

; int32_t strCmp(char* a, char* b)
strCmp:
	PUSH RBP
	MOV RBP, RSP

	MOV DL, [RDI]
	MOV CL, [RSI]

.loop_cmp:

	CMP DL, 0 ; Se verifica si el final de la cadena a se ha alcanzado
	JE .endA ; Si se ha alcanzado el final de la cadena a, se verifica si la cadena b también ha llegado al final

	CMP CL, 0 ; Se verifica si el final de la cadena b se ha alcanzado
	JE .endB ; Si se ha alcanzado el final de la cadena b, y la cadena a no ha llegado al final, entonces retorno -1

	CMP DL, CL ; Se comparan los caracteres de ambas cadenas
	JE .next_cmp ; ; Si son iguales, se sigue comparando

	JB .a_menor   ; si DL < CL, a < b → devolver 1
	JA .b_menor   ; si DL > CL, a > b → devolver -1

.endA:
	CMP CL, 0 ; Se verifica si el final de la cadena b se ha alcanzado
	JE .equals ; Si se ha alcanzado el final de la cadena b y de la cadena a, entonces retorno 0

	MOV RAX, 1 ; Si la cadena a ha llegado al final y la cadena b no, retorno 1
	JMP .end_cmp ; Salgo de la función

.equals:
	XOR RAX, RAX ; Si son iguales, se retorna 0
	JMP .end_cmp ; Salgo de la función

.endB:
	MOV RAX, -1 ; Si la cadena a no ha llegado al final y la cadena b sí, retorno -1
	JMP .end_cmp ; Salgo de la función

.next_cmp:
	INC RDI ; Se incrementa el puntero de la cadena a
	INC RSI ; Se incrementa el puntero de la cadena b
	MOV DL, [RDI] ; Se carga el siguiente caracter de la cadena a
	MOV CL, [RSI] ; Se carga el siguiente caracter de la cadena b
	JMP .loop_cmp ; Se repite el ciclo

.a_menor:
	MOV RAX, 1 ; Si la cadena a es menor que la cadena b, retorno 1
	JMP .end_cmp ; Salgo de la función

.b_menor:
	MOV RAX, -1 ; Si la cadena a es mayor que la cadena b, retorno -1
	JMP .end_cmp ; Salgo de la función

.end_cmp:
	POP RBP
	RET

; char* strClone(char* a)
strClone:
	PUSH RBP
    MOV RBP, RSP

    ; guardo el puntero original (a) porque CALL pisa RDI
    MOV RSI, RDI        ; RSI = puntero a

    ; llamo a strLen(a)
    CALL strLen         ; EAX = longitud de a

    ; Reservamos memoria: longitud + 1 byte para el '\0'
    MOV ECX, EAX        ; ECX = longitud
    ADD EAX, 1          ; longitud + 1
    MOV EDI, EAX        ; argumento para malloc
    CALL malloc         ; RAX = puntero destino

    ; guardo el puntero a inicio del destino
    MOV RDX, RAX        ; RDX = destino original

.copy_loop:
    MOV BL, [RSI]       ; leer byte de origen
    MOV [RAX], BL       ; copiar al destino
    INC RSI				; avanzar puntero origen
    INC RAX				; avanzar puntero destino
    CMP BL, 0			; verifico si es el final de la cadena
    JNE .copy_loop  	; si no es el final de la cadena, sigo copiando

    ; devuelvo el puntero al inicio del string clonado
	MOV RAX, RDX

    POP RBP ; retorno el rbp
    RET

; void strDelete(char* a)
strDelete:
	PUSH RBP
	MOV RBP, RSP

	CALL free ; Libera la memoria de la cadena

	POP RBP
	RET

; void strPrint(char* a, FILE* pFile)
strPrint:
	PUSH RBP
    MOV RBP, RSP

    MOV RDX, RDI        ; string como tercer argumento
    MOV RDI, RSI        ; FILE* → primer argumento
    MOV RSI, fmt_str    ; formato "%s"

    CALL fprintf

    POP RBP
    RET

; uint32_t strLen(char* a)
strLen:
	PUSH RBP
	MOV RBP, RSP

	MOV RAX, 0 ; Inicializa el contador de longitud a 0

.loop_len:
	MOV DL, [RDI] ; Carga el siguiente caracter de la cadena
	CMP DL, 0 ; Verifica si se ha alcanzado el final de la cadena
	JE .end_len ; Si se ha alcanzado el final de la cadena, salta al final
	INC RAX ; Incrementa el contador de longitud
	INC RDI ; Avanza al siguiente caracter
	JMP .loop_len ; Repite el ciclo

.end_len:
	POP RBP
	RET 


