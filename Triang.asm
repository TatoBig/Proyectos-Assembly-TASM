; /* El triángulo es equilátero */
; equil: Al = 'E'
; goto alm
;
; /* No forman triángulo */
; notri: Al = 'I'
;
; alm: tipo = AL
;**********************************************************
;****** CÓDIGO DE INICIO **********************************
    ideal
    dosseg
    model small
    stack 256
;****** VARIABLES DEL PROGRAMA ****************************
dataseg
    codsal db 0
    lado1 dw ?
    lado2 dw ?
    lado3 dw ?
    tipo  db ?
;****** CÓDIGO DEL PROGRAMA *******************************
codeseg
inicio:
    mov ax, @data ; Inicializa el
    mov ds, ax ; segmento de datos
    mov ax, [lado1]
    mov bx, [lado2]
    mov cx, [lado3]
    ; Determina si las líneas forman un triángulo
    add ax, bx
    cmp ax, cx ; if(lado1+lado2 <= lado3)
    jbe notri ; goto notri
    ; Determina si es un triángulo equilátero
    mov ax, [lado1]
    cmp ax, cx ; if(lado1 == lado3)
    je equil ; goto equil
    ; Determina si es un triángulo isósceles
    cmp ax, bx ; if(lado1 == lado2)
    je isos ; goto isos
    cmp bx, cx ; if(lado2 == lado3)
    je isos ; goto isos
; 48 Programas con Instrucciones de Control de Flujo
; ITSON Manuel Domitsu Kono
    ; El triángulo es escaleno
    mov al, 'S' ; Al = 'S'
    jmp alm ; goto alm
    ; El triángulo es isósceles
isos: 
    mov al, 'I' ; Al = 'I'
    jmp alm ; goto alm
    ; El triángulo es equilátero
equil: 
    mov al, 'E' ; Al = 'E'
    jmp alm ; goto alm
    ; No forman triángulo
notri: 
    mov al, 'N' ; Al = 'N'
alm: 
    mov [tipo], al ; tipo = AL
salir:
    mov ah, 04Ch
    mov al, [codsal]
    int 21h
;****** CÓDIGO DE TERMINACIÓN *****************************
 end inicio
