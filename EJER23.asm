;**********************************************************
; EJER23.asm
; Encontrar el último número cuadrado dentro del limite
; Grupo 6
;**********************************************************

; Codigo de inicio 
    ideal
    dosseg
    model small
    stack 256

; Declaracion de variables
dataseg
    codsal  db 0
    limite  dw ?
    aux     dw ?
    n       db ?

; Codigo del programa
codeseg 

inicio:
    mov ax, @data     ; Inicializa el
    mov ds, ax        ; segmento de datos
    mov cx, 0h        ;cont=0
    xor ax, ax        ; AX = 0
 
ciclo: 
    inc cx
    mov bx, cx        ; bx igual ah numero del contador
    mov ax, cx        ; ax igual ah numero del contador
    mul bx            ; bx*ax se guarda en ax
    add [aux], ax     ; Sumar aux=aux+ax
    mov ax, [aux]     ; ax= aux
    cmp ax, [limite]  ; Compara el total del valor con el limite
    jg  enddo         ; Si es mayor al limite se termina el ciclo
    jmp ciclo         ; Sino repite el ciclo
enddo:
    dec cx            ; Le quita 1 al contador
    mov [n], cl       ; Guarda el valor de n en una variable byte
salir:
    mov ah, 04Ch
    mov al, [codsal]
    int 21h

; Finalizar
    end inicio