;**********************************************************
; EJER12.asm
; Conversion de Centigrados a Fahrenheit
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
    centi   dw ?
    fahr    dw ?

; Codigo del programa
codeseg

inicio:
    mov ax, @data       ; Inicializa el
    mov ds, ax          ; segmento de 
    mov bx, [centi]
    ; Se verifica si el valor ingresado esta entre el rango del programa (-200 a 200 °C)
    mov ax, 200d
    cmp bx, ax
    jg  salir            ; Si no cumple, termina el programa
    mov ax, -200d
    cmp bx, ax
    jl  salir
    ; Fin de las verificaciones
    mov ax, 09h         ; Pasadas las verificaciones empieza a realizar las operaciones para la conversion 
    imul [centi]      
    mov bx, 05h
    idiv bx
    add ax, 20h
    mov [fahr], ax      ; Se deja el resultado final en la variable fahr
 
salir:
    mov ah, 04Ch
    mov al, [codsal]
    int 21h

; Finalizar
    end inicio