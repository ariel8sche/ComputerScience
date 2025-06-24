; /** defines bool y puntero **/
%define NULL 0
%define TRUE 1
%define FALSE 0

section .data
%define LIST_SIZE 16
%define LIST_FIRST 0
%define LIST_LAST 8
%define NODE_SIZE 32
%define NODE_NEXT 0
%define NODE_PREV 8
%define NODE_TYPE 16
%define NODE_HASH 24
section .text

global string_proc_list_create_asm
global string_proc_node_create_asm
global string_proc_list_add_node_asm
global string_proc_list_concat_asm

; FUNCIONES auxiliares que pueden llegar a necesitar:
extern malloc
extern free
extern str_concat


string_proc_list_create_asm:
    push rbp
    mov rbp, rsp

    ; Para crear un nuevo string_proc_list, primero tengo que alocar el espacio necesario. Para ello, tengo que hacer un llamado a malloc
    ; con la cantidad de bytes que quiero alocar. En este caso, el struct cuenta con dos punteros de 8 bytes cada uno. Por lo tanto, la 
    ; cantidad de alocar es 16 bytes.

    mov rdi, LIST_SIZE
    call malloc                     ; en rax tengo un puntero a la memoria alocada

    ; Por ultimo, tengo que definir los atributos de string_proc_list. Como la lista todavia no tiene nodos, el puntero first y el puntero last
    ; tienen que estar ambos inicializados en NULL. Como NULL es un puntero a la posicion 0, tenemos que moverle un puntero a 0 a cada aributo.

    xor rsi, rsi                            ; rsi = 0
    mov [rax + LIST_FIRST], rsi
    mov [rax + LIST_LAST], rsi

    ; Como el puntero ya esta en rax (el registro en el que tengo que devolver el puntero), termino la ejecucion

    pop rbp
    ret

;string_proc_node* string_proc_node_create_asm(uint8_t type, char* hash)
; [dil]: type, [rsi]: hash
string_proc_node_create_asm:
    push rbp
    push r12
    push r13
    mov rbp, rsp

    ; La logica es muy similar al string_proc_list_create_asm: tenemos que alocar memoria y definir los atributos. De punteros next y previous no tenemos
    ; informacion, por lo que los inicializaremos como NULL. Para otro dos atributos (type y hash) tenemos dos valores de entrada que respectivamente corres-
    ; ponden con los dos atributos.

    ; Primero pedimos memoria. Como vamos a hacer un llamado a funcion y tenemos valores que queremos conservar en registros volatiles, vamos a moverlos a no
    ; volatiles.
    mov r12b, dil               ; r12 = type
    mov r13, rsi                ; r13 = hash
    mov rdi, NODE_SIZE          ; en rdi esta la cantidad de bytes a alocar
    call malloc                 ; en rax esta el puntero a la memoria alocada

    ; Definimos next y previous
    xor rdi, rdi            ; Seteo rdi en 0
    mov [rax + NODE_NEXT], rdi
    mov [rax + NODE_PREV], rdi

    ; Ahora defino los otros dos atributos con los parametros de entrada
    mov [rax + NODE_TYPE], r12b
    mov [rax + NODE_HASH], r13

    ; Como el puntero ya esta en rax, termino la ejecucion
    pop r13
    pop r12
    pop rbp
    ret

; void string_proc_list_add_node_asm(string_proc_list* list, uint8_t type, char* hash);
; [rdi]: list, [sil]: type, [rdx]: hash
string_proc_list_add_node_asm:
    push rbp
    push r12
    sub rsp, 8
    mov rbp, rsp

    ; Para agregar un nodo al final de la lista, primero tenemos que crearlo. Para eso vamos a hacer un llamado a la funcion string_proc_node_create, por lo
    ; que tenemos que guardar los parametros en registros no volatiles. El que nos interesa conservar, sin embargo, es solo list (rdi), ya que el resto no los
    ; utilizaremos mas
    mov r12, rdi
    xchg rdi, rdx       ; Ahora rdi = hash y rdx = list
    xchg rdi, rsi       ; Ahora rdi = type y rsi = hash (el orden que necesitamos)
    call string_proc_node_create_asm        ; en rax tengo el puntero a new_node

    ; A partir de aca tenemos dos escenarios posibles: o es el primer elemento que se agrega a la lista, o la lista tiene al menos un elemento. Primero, vamos
    ; a chequear en que caso estamos. Para eso, tenemos que revisar si el puntero list->last (o list->first) == NULL.
    xor rdi, rdi        ; seteo rdi en 0
    cmp [r12 + LIST_LAST], rdi
    je .esElPrimero
    jne .noEsElPrimero

    .esElPrimero:
    ; En este caso, tengo que setear list->first y list->last como new_node 
        mov [r12 + LIST_FIRST], rax
        mov [r12 + LIST_LAST], rax
        jmp .fin

    .noEsElPrimero:
    ; En este caso tenemos que hacer 3 cosas: 
    ;   - Que el siguiente al ultimo actual sea new_node
    ;   - Que el previo a new_node sea el ultimo actual
    ;   - Actualizar el ultimo actual a new_node
        mov rdi, [r12 + LIST_LAST]      ; en rdi esta el ultimo de la lista (list->last)
        mov [rdi + NODE_NEXT], rax
        mov [rax + NODE_PREV], rdi
        mov [r12 + LIST_LAST], rax
        jmp .fin

    .fin:
    add rsp, 8
    pop r12
    pop rbp
    ret

; char* string_proc_list_concat_asm(string_proc_list* list, uint8_t type, char* hash);
; [rdi]: list, [sil]: type, [rdx]: hash
string_proc_list_concat_asm:
    push rbp
    push r12
    push r13
    push r14
    push r15
    mov rbp, rsp

    ; Lo primero que tenemos que hacer para implementar la funcion es conseguir un iterador de la lista. Podemos lograrlo agarrando el primer elemento de la
    ; lista y utilizandolo como tal
    mov rcx, [rdi + LIST_FIRST]
    .ciclo:
    ;El ciclo tiene que terminar cuando nos quedamos sin elementos de la lista, o sea, cuando el iterador apunta a NULL.
        cmp rcx, 0
        je .fin
        ; Si el iterador apunta a un elemento de la lista, primero tenemos que chequear si el type coincide con el pasado por parametro
        cmp [rcx + NODE_TYPE], sil
        je .compartenTipo
        jne .siguienteIteracion

        .compartenTipo:
        ; Aca tenemos que hacer un llamado a la funcion str_concat, para que nos concatene hash y it->hash. Por lo tanto, tenemos que guardarnos en registros
        ; no volatiles los tres parametros de entrada (rdi, sil y rdx) y el iterador (rcx)
            mov r12, rdi
            mov r13b, sil
            mov r14, rdx
            mov r15, rcx
            mov rdi, rdx
            mov rsi, [rcx + NODE_HASH]      ; le paso lo concatenado hasta ahora y el hash del nodo (en ese orden para que este primero el hash en el string)
            call str_concat                 ; en rax tengo el puntero al string de lo concateado hasta ahora
            ;mov rdi, r14                   ; quiero liberar la memoria de lo que ya tenia concatenado. Por eso lo paso como parametro 
            mov r14, rax                    ; actualizo lo concatenado
            ;call free                      ; libero la memoria (*)
            mov rdi, r12
            mov sil, r13b
            mov rdx, r14
            mov rcx, r15            ; muevo todo a los registros originales


        .siguienteIteracion:
            mov rcx, [rcx + NODE_NEXT]
            jmp .ciclo

    .fin:
    mov rax, rdx
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbp
    ret

; (*): lo comente porque descomentado devuelve SIGSEV, pero mi idea era hacer un free sobre lo concatenado en la iteracion anterior para no perder memoria.