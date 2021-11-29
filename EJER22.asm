;**********************************************************
; EJER22.asm
; Serie fibonacci
; Grupo 6
;**********************************************************

; n es el numero de la serie que se quiere, finb el resultado
; CX = numero de la seria a pedir
; AX = n-1
; BX = n-2
; DX = temporal

; Codigo de inicio 
    ideal
    dosseg
    model small
    stack 256

; Declaracion de variables
dataseg

    codsal  db 0
    n       db ?
    fibn    dw ?

; Codigo del programa
codeseg

inicio:
    mov ax, @data   ; Inicializa el
    mov ds, ax      ; segmento de datos
    mov cl,[n]      ; Cargar a xc el numero de la serie que se pide
    jcxz caso1      ; Si n == 0 salta a caso 1
    cmp cx,1        ; Si n == 1 salta a caso 2
    jz  caso2
; Para toda n>=2
    mov ax,1
    mov bx,0        ; Se cargan los valores iniciales
    dec cx          ; Ajuste al contador por iniciar en 0
ciclo:
    mov dx,ax       ; Se guarda el n-1
    add ax,bx       ; Se suman n-1 + n-2
    mov bx,dx       ; n-2 = n-1 
    loop ciclo
    mov [fibn], ax  ; Se carga el fibonacci a fibn u salta a terminar
    jmp salir
caso1:
    mov [fibn],0
    jmp salir       ;se carga 0 a fibonacci y salta a terminar
caso2: 
    mov [fibn],1
    jmp salir       ;se carga 1 a fibonacci y salta a terminar
salir:
    mov ah, 04Ch
    mov al, [codsal]
    int 21h
  
; Finalizar
    end inicio