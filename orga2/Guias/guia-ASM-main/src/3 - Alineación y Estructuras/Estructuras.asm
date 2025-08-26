

;########### ESTOS SON LOS OFFSETS Y TAMAÑO DE LOS STRUCTS
; Completar las definiciones (serán revisadas por ABI enforcer):
NODO_OFFSET_NEXT EQU 0
NODO_OFFSET_CATEGORIA EQU 8
NODO_OFFSET_ARREGLO EQU 16
NODO_OFFSET_LONGITUD EQU 24
NODO_SIZE EQU 32
PACKED_NODO_OFFSET_NEXT EQU 0
PACKED_NODO_OFFSET_CATEGORIA EQU 8
PACKED_NODO_OFFSET_ARREGLO EQU 9
PACKED_NODO_OFFSET_LONGITUD EQU 17
PACKED_NODO_SIZE EQU 21
LISTA_OFFSET_HEAD EQU 0
LISTA_SIZE EQU 8
PACKED_LISTA_OFFSET_HEAD EQU 0
PACKED_LISTA_SIZE EQU 8

;########### SECCION DE DATOS
section .data

;########### SECCION DE TEXTO (PROGRAMA)
section .text

;########### LISTA DE FUNCIONES EXPORTADAS
global cantidad_total_de_elementos
global cantidad_total_de_elementos_packed

;########### DEFINICION DE FUNCIONES
;extern uint32_t cantidad_total_de_elementos(lista_t* lista);
;registros: lista[RDI]
cantidad_total_de_elementos:
	PUSH RBP
	MOV RBP, RSP

	XOR ECX, ECX ; contador

	MOV RAX, [RDI + LISTA_OFFSET_HEAD] ; head de la lista

bucle_nopl:

    CMP RAX, 0 ; si RAX es NULL, no hay elementos

	JE fin_nopl ; salir

	MOV EDX, [RAX + NODO_OFFSET_LONGITUD] ; longitud del nodo

	ADD ECX, EDX ; sumar longitud al contador

	MOV RAX, [RAX + NODO_OFFSET_NEXT] ; siguiente nodo

	JMP bucle_nopl ; repetir

fin_nopl:

	MOV EAX, ECX ; devolver el contador
	POP RBP 
	RET

;extern uint32_t cantidad_total_de_elementos_packed(packed_lista_t* lista);
;registros: lista[?]
cantidad_total_de_elementos_packed:
	PUSH RBP
	MOV RBP, RSP
	
	XOR ECX, ECX ; contador

	MOV RAX, [RDI + PACKED_LISTA_OFFSET_HEAD] ; head de la lista

bucle_packed:

	CMP RAX, 0 ; si RAX es NULL, no hay elementos

	JE fin_packed ; salir

	MOV EDX, [RAX + PACKED_NODO_OFFSET_LONGITUD] ; longitud del nodo

	ADD ECX, EDX ; sumar longitud al contador

	MOV RAX, [RAX + PACKED_NODO_OFFSET_NEXT] ; siguiente nodo

	JMP bucle_packed ; repetir

fin_packed:
	MOV EAX, ECX

	POP RBP
	RET

