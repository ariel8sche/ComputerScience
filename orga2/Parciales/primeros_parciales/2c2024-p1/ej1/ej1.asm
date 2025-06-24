extern malloc

section .rodata
; Acá se pueden poner todas las máscaras y datos que necesiten para el ejercicio

section .text
; Marca un ejercicio como aún no completado (esto hace que no corran sus tests)
FALSE EQU 0
; Marca un ejercicio como hecho
TRUE  EQU 1

; Marca el ejercicio 1A como hecho (`true`) o pendiente (`false`).
;
; Funciones a implementar:
;   - es_indice_ordenado
global EJERCICIO_1A_HECHO
EJERCICIO_1A_HECHO: db TRUE ; Cambiar por `TRUE` para correr los tests.

; Marca el ejercicio 1B como hecho (`true`) o pendiente (`false`).
;
; Funciones a implementar:
;   - indice_a_inventario
global EJERCICIO_1B_HECHO
EJERCICIO_1B_HECHO: db TRUE ; Cambiar por `TRUE` para correr los tests.

;########### ESTOS SON LOS OFFSETS Y TAMAÑO DE LOS STRUCTS
; Completar las definiciones (serán revisadas por ABI enforcer):
ITEM_NOMBRE EQU 00
ITEM_FUERZA EQU 20
ITEM_DURABILIDAD EQU 24
ITEM_SIZE EQU 28

;; La funcion debe verificar si una vista del inventario está correctamente 
;; ordenada de acuerdo a un criterio (comparador)

;; bool es_indice_ordenado(item_t** inventario, uint16_t* indice, uint16_t tamanio, comparador_t comparador);

;; Dónde:
;; - `inventario`: Un array de punteros a ítems que representa el inventario a
;;   procesar.
;; - `indice`: El arreglo de índices en el inventario que representa la vista.
;; - `tamanio`: El tamaño del inventario (y de la vista).
;; - `comparador`: La función de comparación que a utilizar para verificar el
;;   orden.
;; 
;; Tenga en consideración:
;; - `tamanio` es un valor de 16 bits. La parte alta del registro en dónde viene
;;   como parámetro podría tener basura.
;; - `comparador` es una dirección de memoria a la que se debe saltar (vía `jmp` o
;;   `call`) para comenzar la ejecución de la subrutina en cuestión.
;; - Los tamaños de los arrays `inventario` e `indice` son ambos `tamanio`.
;; - `false` es el valor `0` y `true` es todo valor distinto de `0`.
;; - Importa que los ítems estén ordenados según el comparador. No hay necesidad
;;   de verificar que el orden sea estable.

global es_indice_ordenado
es_indice_ordenado:
	; Te recomendamos llenar una tablita acá con cada parámetro y su
	; ubicación según la convención de llamada. Prestá atención a qué
	; valores son de 64 bits y qué valores son de 32 bits o 8 bits.
	;
	; rdi = item_t**     inventario
	; rsi = uint16_t*    indice
	; dx = uint16_t     tamanio
	; rcx = comparador_t comparador
		push rbp
		mov rbp, rsp
		push r12
		push r13
		push r14
		push r15
		push rbx
		sub rsp, 8
		
		mov r12, rdi 			; inventario
		mov r13, rsi 			; indice
		movzx r14, dx 			; tamanio
		mov r15, rcx 			; comparador

		sub r14, 1				; tamanio - 1
		xor rbx, rbx			; contador rbx = 0

		.loop:

			cmp rbx, r14		; comparo si rbx < tamanio - 1
			jae .endTrue		; si no, salgo

			; Obtener itemA = inventario[indice[i]]
			movzx r8, word [r13 + 2*rbx]        ; r8 = indice[i] (uint16_t)
			mov rdi, [r12 + 8*r8]               ; rdi = itemA (item_t*)

			; Obtener itemB = inventario[indice[i+1]]
			movzx r9, word [r13 + 2*rbx + 2]    ; r9 = indice[i+1] (uint16_t)
			mov rsi, [r12 + 8*r9]               ; rsi = itemB (item_t*)

			; Llamar a comparador(itemA, itemB)
			call r15

			cmp rax, 0			; comparo el resultado de la funcion comparador
			je .endFalse		; si rax == 0, no está ordenado, salgo

			inc rbx				; incremento el contador
			jmp .loop			; vuelvo a empezar el loop

.endFalse:
		xor rax, rax			; rax = 0 (false)
		jmp .end				; salgo de la funcion

.endTrue:
		mov rax, 1				; rax = 1 (true)

.end:
		add rsp, 8
		pop rbx
		pop r15
		pop r14
		pop r13
		pop r12
		pop rbp
		ret

;; Dado un inventario y una vista, crear un nuevo inventario que mantenga el
;; orden descrito por la misma.

;; La memoria a solicitar para el nuevo inventario debe poder ser liberada
;; utilizando `free(ptr)`.

;; item_t** indice_a_inventario(item_t** inventario, uint16_t* indice, uint16_t tamanio);

;; Donde:
;; - `inventario` un array de punteros a ítems que representa el inventario a
;;   procesar.
;; - `indice` es el arreglo de índices en el inventario que representa la vista
;;   que vamos a usar para reorganizar el inventario.
;; - `tamanio` es el tamaño del inventario.
;; 
;; Tenga en consideración:
;; - Tanto los elementos de `inventario` como los del resultado son punteros a
;;   `ítems`. Se pide *copiar* estos punteros, **no se deben crear ni clonar
;;   ítems**

global indice_a_inventario
indice_a_inventario:
	; Te recomendamos llenar una tablita acá con cada parámetro y su
	; ubicación según la convención de llamada. Prestá atención a qué
	; valores son de 64 bits y qué valores son de 32 bits o 8 bits.
	;
	; rdi = item_t**  inventario
	; rsi = uint16_t* indice
	; dx = uint16_t  tamanio
	push rbp
	mov rbp, rsp
	push rbx
	push r12
	push r13
	push r14
	push r15
	sub rsp, 8

	mov r12, rdi 		; inventario
	mov r13, rsi 		; indice
	movzx r14, dx 		; tamanio

	xor rbx, rbx		; contador rbx = 0

	; Solicitar memoria para el nuevo inventario
	mov r8, r14
	shl r8, 3			; tamanio * 8 (sizeof(item_t*))
	mov rdi, r8		; muevo tamanio a rdi
	call malloc

	; Verificar si malloc devolvió NULL
	cmp rax, 0
	je .end			; si malloc falla, salgo

	mov r15, rax

	.loop:
		cmp rbx, r14		; comparo si rbx < tamanio - 1
		jae .end			; si no, salgo

		; cargar indice[i]
		movzx rdi, word [r13 + rbx*2]    ; rdi = indice[i]

		; cargar inventario[indice[i]]
		mov rsi, [r12 + rdi*8]           ; rsi = inventario[indice[i]]

		; guardar en nuevo[i]
		mov [r15 + rbx*8], rsi			; rax = item_t*

		inc rbx
		jmp .loop

.end:
	mov rax, r15
	add rsp, 8
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbx
	pop rbp
	ret
