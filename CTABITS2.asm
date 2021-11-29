;**********************************************************
; CTABITS2.ASM
;
; Este programa cuenta el número de bits en uno de una
; variable de un byte. El pseudocódigo de este programa es:
;
; CL = dato
; AL = 0
;
; while(CL > 0)
; {
; C = msb(CL)
; AL += C
; }
;
; cuenta = AL
;**********************************************************
;****** CÓDIGO DE INICIO **********************************
    ;52 Programas con Instrucciones de Control de Flujo
    ;ITSON Manuel Domitsu Kono
    ideal
    dosseg
    model small
    stack 256
;****** VARIABLES DEL PROGRAMA ****************************
dataseg
    codsal db 0
    dato db ?
    cuenta db ?
;****** CÓDIGO DEL PROGRAMA *******************************
codeseg
inicio:
    mov ax, @data ; Inicializa el
    mov ds, ax ; segmento de datos
    xor ch, ch ; CH = 0
    mov cl, [dato] ; CL = dato
    xor al, al ; AL = 0
whil: jcxz endwhi ; while(CL > 0)
    ; {
    shl cl, 1 ; C = msb(CL)
    adc al, 0 ; AL += C
    jmp whil ; }
endwhi:
    mov [cuenta], al ; cuenta = AL
salir:
    mov ah, 04Ch
    mov al, [codsal]
    int 21h
;****** CÓDIGO DE TERMINACIÓN *****************************
end inicio
