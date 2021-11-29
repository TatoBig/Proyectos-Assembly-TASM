;**********************************************************
; EJER13.asm
; Encontrar la paridad de unos en 7 bits
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
    dato    db ?
    resul   db ?

; Codigo del programa
codeseg

inicio:
    mov ax, @data       ; Inicializa el
    mov ds, ax          ; segmento de datos
    mov al, [dato]      ; AL = dato
    xor ah, ah          ; AH = 0
    and al, 7fh         ; Se deja el bit 7 en cero si es que tiene un valor para obtener los unos solo del bit 0 al bit 6   
    ; Inicia el corrimiento de los bits para obtener la cantidad de unos
    shl al, 1
    adc ah, 0
    shl al, 1
    adc ah, 0
    shl al, 1
    adc ah, 0
    shl al, 1
    adc ah, 0
    shl al, 1
    adc ah, 0
    shl al, 1
    adc ah, 0
    shl al, 1
    adc ah, 0
    shl al, 1
    adc ah, 0
    mov al, ah              
    mov bx, 2h          ; Se tiene que dividir el total de unos dentro de 2 para ver si es par (residuo 0) o es impar (residuo 1)
    div bx              ; AL / BX (2) : Residuo en DL
    mov al, dl          ; Se mueve el resuduo obtenido en dl que es de 1 o 0 a al
    ror al, 1           ; Se mueve el residuo al bit 7
    mov ah, [dato]      ; Recuperamos el dato inicial
    and ah, 7fh         ; Se deja el bit 7 en cero nuevamente si es que tiene un valor      
    or  ah, al          ; Une el ultimo bit 7 donde esta el residuo con el dato original sin el bit 7
    mov [resul], ah     ; Se obtiene el resultado
salir:
    mov ah, 04Ch
    mov al, [codsal]
    int 21h

; Finalizar
    end inicio