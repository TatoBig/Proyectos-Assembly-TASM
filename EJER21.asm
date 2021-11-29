;**********************************************************
; EJER21.asm
; Determinar si un año es bisiesto
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
    anio    dw ?
    resul   db ?

; Codigo del programa
codeseg

inicio:
    mov ax, @data       ; Inicializa el
    mov ds, ax          ; segmento de datos
    xor dx, dx          ; Se limpian los registros para volver a dividir
    mov ax, [anio]      
    mov bx, 4h          
    div bx              ; El año es dividido entre 4
    cmp dl, 0h          ; Si el residuo en dl es 0, podría ser bisiesto continua
    jne noes            ; Si no es 0 el residuo, no puede ser bisiesto y termina
paso2: 
    mov ax, [anio]      
    mov bx, 64h          
    div bx              ; Ahora el año se divide en 100 (64h)
    cmp dl, 0h          ; Si el residuo es 0, se debe comprobar con una ultima operacion
    jne sies            ; Si no es 0, si es bisiesto
    mov ax, [anio]      
    mov bx, 190h        
    div bx              ; La ultima comparacion es si es divisible entre 400 (190h) 
    cmp dl, 0h          
    je  sies            ; Si lo es, es bisiesto
noes:                   ; Si no lo es, continua y lo deja en 0 porque no es bisiesto
    mov [resul], 0h     ; No es bisiesto, se deja 0 en resul
    jmp salir       
sies:
    mov [resul], 1h     ; Si es bisiesto, se deja 1 en resul
salir:
    mov ah, 04Ch
    mov al, [codsal]
    int 21h

; Finalizar
    end inicio