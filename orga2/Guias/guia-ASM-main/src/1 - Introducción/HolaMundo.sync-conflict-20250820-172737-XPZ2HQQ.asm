%define SYS_WRITE 1     ; Directivas de preprocesador
%define SYS_EXIT 60     ; Directivas de preprocesador
%define STDOUT 1        ; Directivas de preprocesador

section .data           ; Directivas del ensamblador
msg: db '¡Hola Mundo!', 10   ; Pseudo-instrucción
len equ $ - msg             ; Pseudo-instrucción

global _start           ; Directivas de ensamblador
section .text           ; Directivas de ensamblador
_start:                                                         
    mov rax, SYS_WRITE   ; Mueve el inmediato 1 a rax                                
    mov rdi, STDOUT      ; Mueve el inmediato 1 a rdi                       
    mov rsi, msg         ; Mueve la dirección de msg a rsi                          
    mov rdx, len         ; Mueve la longitud de msg a rdx                          
    syscall              ; Llama a la interrupción del sistema para escribir en la salida estándar                             
                                                                
    mov rax, SYS_EXIT    ; Mueve el inmediato 60 a rax                                        
    mov rdi, 0           ; Mueve el inmediato 0 a rdi                                   
    syscall              ; Llama a la interrupción del sistema para salir del programa                                       
