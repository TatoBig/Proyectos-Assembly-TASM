;**********************************************************
; EJER11.ASM
; Suma de 4 numeros
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
    dato1   dd ?
    dato2   dd ?
    dato3   dd ?
    dato4   dd ?
    resul   dq ?

; Codigo del programa
codeseg

inicio: 
    mov ax, @data           ; Inicializa el
    mov ds, ax              ; segmento de datos
    mov ax, [word dato1]    ; Guarda en dx el contenido de la palabra doble
    mov dx, [word dato1+2]  

    add ax, [word dato2]    ; En ax suma el siguiente numero
    adc dx, [word dato2+2] 

    ; Se repite el mismo procedimiento para los demas datos
    add ax, [word dato3] 
    adc dx, [word dato3+2]

    add ax, [word dato4] 
    adc dx, [word dato4+4]
    
    ; Guarda el resultado en resul (dq)
    mov [word resul],   ax    
    mov [word resul+2], dx
salir:
    mov ah, 04Ch
    mov al, [codsal]
    int 21h

; Finalizar
    end inicio