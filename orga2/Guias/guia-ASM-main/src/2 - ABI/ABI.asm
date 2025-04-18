extern sumar_c
extern restar_c
;########### SECCION DE DATOS
section .data

;########### SECCION DE TEXTO (PROGRAMA)
section .text

;########### LISTA DE FUNCIONES EXPORTADAS

global alternate_sum_4
global alternate_sum_4_using_c
global alternate_sum_4_using_c_alternative
global alternate_sum_8
global product_2_f
global product_9_f

;########### DEFINICION DE FUNCIONES
; uint32_t alternate_sum_4(uint32_t x1, uint32_t x2, uint32_t x3, uint32_t x4);
; parametros: 
; x1 --> EDI
; x2 --> ESI
; x3 --> EDX
; x4 --> ECX
alternate_sum_4:
  sub EDI, ESI
  add EDI, EDX
  sub EDI, ECX
  mov EAX, EDI
  ret

; uint32_t alternate_sum_4_using_c(uint32_t x1, uint32_t x2, uint32_t x3, uint32_t x4);
; parametros: 
; x1 --> EDI
; x2 --> ESI
; x3 --> EDX
; x4 --> ECX
alternate_sum_4_using_c:
  ;prologo
  push RBP ;pila alineada
  mov RBP, RSP ;strack frame armado
  push R12
  push R13	; preservo no volatiles, al ser 2 la pila queda alineada

  mov R12D, EDX ; guardo los parámetros x3 y x4 ya que están en registros volátiles
  mov R13D, ECX ; y tienen que sobrevivir al llamado a función

  call restar_c 
  ;recibe los parámetros por EDI y ESI, de acuerdo a la convención, y resulta que ya tenemos los valores en esos registros
  
  mov EDI, EAX ;tomamos el resultado del llamado anterior y lo pasamos como primer parámetro
  mov ESI, R12D
  call sumar_c

  mov EDI, EAX
  mov ESI, R13D
  call restar_c

  ;el resultado final ya está en EAX, así que no hay que hacer más nada

  ;epilogo
  pop R13 ;restauramos los registros no volátiles
  pop R12
  pop RBP ;pila desalineada, RBP restaurado, RSP apuntando a la dirección de retorno
  ret


alternate_sum_4_using_c_alternative:
  ;prologo
  push RBP ;pila alineada
  mov RBP, RSP ;strack frame armado
  sub RSP, 16 ; muevo el tope de la pila 8 bytes para guardar x4, y 8 bytes para que quede alineada

  mov [RBP-8], RCX ; guardo x4 en la pila

  push RDX  ;preservo x3 en la pila, desalineandola
  sub RSP, 8 ;alineo
  call restar_c 
  add RSP, 8 ;restauro tope
  pop RDX ;recupero x3
  
  mov EDI, EAX
  mov ESI, EDX
  call sumar_c

  mov EDI, EAX
  mov ESI, [RBP - 8] ;leo x4 de la pila
  call restar_c

  ;el resultado final ya está en EAX, así que no hay que hacer más nada

  ;epilogo
  add RSP, 16 ;restauro tope de pila
  pop RBP ;pila desalineada, RBP restaurado, RSP apuntando a la dirección de retorno
  ret


; uint32_t alternate_sum_8(uint32_t x1, uint32_t x2, uint32_t x3, uint32_t x4, uint32_t x5, uint32_t x6, uint32_t x7, uint32_t x8);
; registros y pila: x1[EDI], x2[ESI], x3[EDX], x4[ECX], x5[R8D], x6[R9D], x7[PILA], x8[PILA]
alternate_sum_8:
	PUSH RBP ; pila alineada
  MOV RBP, RSP ;strack frame armado

  MOV R10D, [RBP + 16] ; x7
  MOV R11D, [RBP + 24] ; x8

  PUSH R12 ; preservo no volatiles 
  PUSH R13 ; preservo no volatiles
  PUSH R14 ; preservo no volatiles
  PUSH R15 ; preservo no volatiles
	
  MOV R12D, EDX ; Muevo x3 a un registro no volátil
  MOV R13D, ECX ; Muevo x4 a un registro no volátil
  MOV R14D, R8D ; Muevo x5 a un registro no volátil
  MOV R15D, R9D ; Muevo x6 a un registro no volátil

  CALL restar_c ; EAX = x1 - x2

  MOV EDI, EAX ; Muevo el resultado a EDI
  MOV ESI, R12D ; Muevo x3 a ESI
  CALL sumar_c ; EAX = EAX + x3

  MOV EDI, EAX ; Muevo el resultado a EDI
  MOV ESI, R13D ; Muevo x4 a ESI
  CALL restar_c ; EAX = EAX - x4

  MOV EDI, EAX ; Muevo el resultado a EDI
  MOV ESI, R14D ; Muevo x5 a ESI
  CALL sumar_c ; EAX = EAX + x5

  MOV EDI, EAX ; Muevo el resultado a EDI
  MOV ESI, R15D ; Muevo x6 a ESI
  CALL restar_c ; EAX = EAX - x6

  MOV EDI, EAX ; Muevo el resultado a EDI
  MOV ESI, R10D ; Muevo x7 a ESI
  CALL sumar_c ; EAX = EAX + x7

  MOV EDI, EAX ; Muevo el resultado a EDI
  MOV ESI, R11D ; Muevo x8 a ESI
  CALL restar_c ; EAX = EAX - x8

	POP R15 ; restauro no volatiles
  POP R14 ; restauro no volatiles
  POP R13 ; restauro no volatiles
  POP R12 ; restauro no volatiles
  POP RBP ; pila desalineada, RBP restaurado, RSP apuntando a la dirección de retorno
	ret


; SUGERENCIA: investigar uso de instrucciones para convertir enteros a floats y viceversa
;void product_2_f(uint32_t * destination, uint32_t x1, float f1);
;registros: destination[RDI], x1[ESI], f1[XMM0]
product_2_f:
  PUSH RBP ; pila alineada
  MOV RBP, RSP ;strack frame armado

  XOR RAX, RAX
  MOV EAX, ESI
  CVTSI2SD XMM1, RAX ; Convierte el entero a double
  CVTSS2SD XMM0, XMM0 ; Convierte el float a double

  MULSD XMM0, XMM1 ; Multiplico x1 por x2

  CVTTSD2SI EAX, XMM0 ; Convierte el resultado a entero

  MOV DWORD [RDI], EAX ; Muevo el resultado a la dirección de destino

  POP RBP ; pila desalineada, RBP restaurado, RSP apuntando a la dirección de retorno
	ret


;extern void product_9_f(double * destination
;, uint32_t x1, float f1, uint32_t x2, float f2, uint32_t x3, float f3, uint32_t x4, float f4
;, uint32_t x5, float f5, uint32_t x6, float f6, uint32_t x7, float f7, uint32_t x8, float f8
;, uint32_t x9, float f9);
;registros y pila: destination[rdi], x1[esi], f1[xmm0], x2[edx], f2[xmm1], x3[ecx], f3[xmm2], x4[r8d], f4[xmm3]
;	, x5[r9d], f5[xmm4], x6[stack], f6[xmm5], x7[stack], f7[xmm6], x8[stack], f8[xmm7],
;	, x9[stack], f9[stack]
product_9_f:
	;prologo
	PUSH RBP
	MOV RBP, RSP

  ; Recupero f9 y lo pongo en xmm8
  MOV R10D, [RBP + 16] ; x6
  MOV R11D, [RBP + 24] ; x7
  MOV R12D, [RBP + 32] ; x8
  MOV R13D, [RBP + 40] ; x9

  MOVSS XMM8, [RBP + 48] ; f9

	;convertimos los flotantes de cada registro xmm en doubles
	CVTSS2SD XMM0, XMM0 ;convierte el flotante a double
  CVTSS2SD XMM1, XMM1 ;convierte el flotante a double
  CVTSS2SD XMM2, XMM2 ;convierte el flotante a double
  CVTSS2SD XMM3, XMM3 ;convierte el flotante a double
  CVTSS2SD XMM4, XMM4 ;convierte el flotante a double
  CVTSS2SD XMM5, XMM5 ;convierte el flotante a double
  CVTSS2SD XMM6, XMM6 ;convierte el flotante a double
  CVTSS2SD XMM7, XMM7 ;convierte el flotante a double
  CVTSS2SD XMM8, XMM8 ;convierte el flotante a double

	;multiplicamos los doubles en xmm0 <- xmm0 * xmm1, xmmo * xmm2 , ...
	MULSD XMM0, XMM1 ; xmm0 = xmm0 * xmm1
  MULSD XMM0, XMM2 ; xmm0 = xmm0 * xmm2
  MULSD XMM0, XMM3 ; xmm0 = xmm0 * xmm3
  MULSD XMM0, XMM4 ; xmm0 = xmm0 * xmm4
  MULSD XMM0, XMM5 ; xmm0 = xmm0 * xmm5
  MULSD XMM0, XMM6 ; xmm0 = xmm0 * xmm6
  MULSD XMM0, XMM7 ; xmm0 = xmm0 * xmm7
  MULSD XMM0, XMM8 ; xmm0 = xmm0 * xmm8

	; convertimos los enteros en doubles y los multiplicamos por xmm0.
	CVTSI2SD XMM1, ESI ;convierte el entero x1 a double
  MULSD XMM0, XMM1 ; xmm0 = xmm0 * xmm1
  CVTSI2SD XMM1, EDX ;convierte el entero x2 a double
  MULSD XMM0, XMM1 ; xmm0 = xmm0 * xmm1
	CVTSI2SD XMM1, ECX ;convierte el entero x3 a double
  MULSD XMM0, XMM1 ; xmm0 = xmm0 * xmm1
  CVTSI2SD XMM1, R8D ;convierte el entero x4 a double
  MULSD XMM0, XMM1 ; xmm0 = xmm0 * xmm1
	CVTSI2SD XMM1, R9D ;convierte el entero x5 a double
  MULSD XMM0, XMM1 ; xmm0 = xmm0 * xmm1
	CVTSI2SD XMM1, R10D ;convierte el entero x6 a double
  MULSD XMM0, XMM1 ; xmm0 = xmm0 * xmm1
	CVTSI2SD XMM1, R11D ;convierte el entero X7 a double
  MULSD XMM0, XMM1 ; xmm0 = xmm0 * xmm1
  CVTSI2SD XMM1, R12D ;convierte el entero X8 a double
  MULSD XMM0, XMM1 ; xmm0 = xmm0 * xmm1
  CVTSI2SD XMM1, R13D ;convierte el entero X9 a double
  MULSD XMM0, XMM1 ; xmm0 = xmm0 * xmm1

  ; Guardamos el resultado en la dirección de destino
  MOVSD QWORD [RDI], XMM0

	; epilogo
	POP RBP
	RET

