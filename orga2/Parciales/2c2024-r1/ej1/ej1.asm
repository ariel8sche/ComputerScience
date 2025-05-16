extern malloc
extern free

section .rodata
; Acá se pueden poner todas las máscaras y datos que necesiten para el ejercicio

section .text
; Marca un ejercicio como aún no completado (esto hace que no corran sus tests)
FALSE EQU 0
; Marca un ejercicio como hecho
TRUE  EQU 1

FILAS EQU 255
COLUMNAS EQU 255

; Marca el ejercicio 1A como hecho (`true`) o pendiente (`false`).
;
; Funciones a implementar:
;   - optimizar
global EJERCICIO_1A_HECHO
EJERCICIO_1A_HECHO: db TRUE ; Cambiar por `TRUE` para correr los tests.

; Marca el ejercicio 1B como hecho (`true`) o pendiente (`false`).
;
; Funciones a implementar:
;   - contarCombustibleAsignado
global EJERCICIO_1B_HECHO
EJERCICIO_1B_HECHO: db TRUE ; Cambiar por `TRUE` para correr los tests.

; Marca el ejercicio 1C como hecho (`true`) o pendiente (`false`).
;
; Funciones a implementar:
;   - modificarUnidad
global EJERCICIO_1C_HECHO
EJERCICIO_1C_HECHO: db TRUE ; Cambiar por `TRUE` para correr los tests.

;########### ESTOS SON LOS OFFSETS Y TAMAÑO DE LOS STRUCTS
; Completar las definiciones (serán revisadas por ABI enforcer):
ATTACKUNIT_CLASE EQU 0
ATTACKUNIT_COMBUSTIBLE EQU 12
ATTACKUNIT_REFERENCES EQU 14
ATTACKUNIT_SIZE EQU 16

global optimizar
optimizar:
	; Te recomendamos llenar una tablita acá con cada parámetro y su
	; ubicación según la convención de llamada. Prestá atención a qué
	; valores son de 64 bits y qué valores son de 32 bits o 8 bits.
	;
	; rdi = mapa_t           mapa
	; rsi = attackunit_t*    compartida
	; rdx = uint32_t*        fun_hash(attackunit_t*)
	push rbp 		; alineada
	mov rbp, rsp
	push r12		
	push r13		; alineada
	push r14
	push r15 		; alineada	
	push rbx		
	sub rsp, 8		; alineada

	mov r12, rdi	; mapa
	mov r13, rsi	; compartida
	mov r14, rdx	; fun_hash
	xor r15, r15	; iterador


	mov rdi, r13	; rdi = compartida
	call r14		; llamo a fun_hash que esta en r14
	mov rbx, rax	; rbx = hash compartida

	.lopp:
		mov rdi, [r12 + 8 * r15] ; rdi = unidad actual (como el mapa es un array de punteros, el offset es 8 * i)
		cmp rdi, 0  ; miro si unidad actual == NULL
		je .continue	; si es NULL, salgo

		cmp rdi, r13 ;comparo si la unidad actual es la compartida
		je .continue	; si es la compartida, salgo

		call r14
		cmp rax, rbx	; comparo el hash de la unidad actual con el hash de la compartida
		jne .continue	; si no son iguales, salgo


		inc byte [r13 + ATTACKUNIT_REFERENCES] 	; sumo 1 a la clase de la unidad compartida
		mov rdi, [r12 + 8 * r15] ; rdi = unidad actual
		dec byte [rdi + ATTACKUNIT_REFERENCES]	; resto 1 a la clase de la unidad actual
		mov [r12 + 8 * r15], r13				; mapa[i][j] = compartida
		

		cmp byte [rdi + ATTACKUNIT_REFERENCES], 0
		jne .continue	; si la unidad actual tiene referencias, salgo
		call free;

	.continue:
		inc r15
		cmp r15, FILAS * COLUMNAS ; comparo i con el tamaño de la clase
		jl .lopp

	add rsp, 8		; alineada
	pop rbx
	pop r15 		; alineada
	pop r14
	pop r13			; alineada
	pop r12
	pop rbp 		; alineada
	ret

global contarCombustibleAsignado
contarCombustibleAsignado:
	; rdi = mapa_t           mapa
	; rsi = uint16_t*        fun_combustible(char*)
	push rbp		; alineada
	mov rbp, rsp
	push r12
	push r13		; alineada
	push r14
	push r15		; alineada
	push rbx
	sub rsp, 8		; alineada

	mov r12, rdi	; mapa
	mov r13, rsi	; fun_combustible
	xor r14, r14	; acumulador
	xor r15, r15	; iterador
	
	.loop:
		mov rsi, [r12 + 8 * r15] ; unidad actual
		cmp rsi, 0  ; miro si unidad actual == NULL
		je .continue	; si es NULL, salgo

		movzx ebx, word [rsi + ATTACKUNIT_COMBUSTIBLE] ; rbx = combustible

		mov rdi, rsi
		call r13
		movzx eax, ax 	; eax = combustible base

		sub ebx, eax	; ebx = combustible actual - combustible base

		add r14d, ebx 	; sumo el combustible actual al acumulador

	.continue:
		inc r15
		cmp r15, FILAS * COLUMNAS ; comparo i con el tamaño de la clase
		jl .loop

	mov rax, r14
	add rsp, 8
	pop rbx
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbp
	ret

global modificarUnidad
modificarUnidad:
	; rdi  = mapa_t           mapa
	; rsi  = uint8_t          x
	; rdx  = uint8_t          y
	; rcx  = void*            fun_modificar(attackunit_t*)
	push rbp		; alineada
	mov rbp, rsp
	push r13		; alineada
	push r14
	push r15		; alineada
	sub rsp, 8		; alineada

	movzx rsi, sil
	movzx rdx, dl

	imul rsi, COLUMNAS
	add rdx, rsi			; rsi = x * COLUMNAS + y
	shl rdx, 3				; * 8
	add rdi, rdx 			; unidad actual

	mov r15, rdi	; posicion de la unidad a modificar
	mov r14, rcx	; fun_modificar

	
	
	
	
	mov r13,[r15] ; unidad actual
	cmp r13, 0  ; miro si unidad actual == NULL
	je .end

	mov r9b, [r13 + ATTACKUNIT_REFERENCES]
	cmp r9b, 1 ; miro si la unidad actual tiene referencias
	jle .modifier ; si no tiene referencias, la modifico




	dec byte [r13 + ATTACKUNIT_REFERENCES] 

	
	mov rdi, ATTACKUNIT_SIZE
	call malloc
	mov rdi, [r13]
	mov [rax], rdi
	mov rdi, [r13+8]
	mov [rax+8], rdi

	mov [rax + ATTACKUNIT_REFERENCES], byte 1
	mov [r15], rax

.modifier:

	mov rdi, [r15] ; unidad actual
	call r14	; llamo a fun_modificar

.end:
	add rsp, 8		
	pop r15 		
	pop r14			; alineada
	pop r13	
	pop rbp		
	ret