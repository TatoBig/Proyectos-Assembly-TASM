;**********************************************************
; CTABITS1.ASM
;
; Este programa cuenta el número de bits en uno de una
; variable de un byte. El pseudocódigo para este programa
; es:
;
; AL = dato
; AH = 0
;
; C = msb(AL) /* AL <<= 1 */
; AH += C
; C = msb(AL)
; AH += C
; C = msb(AL)
; AH += C
; C = msb(AL)
; AH += C
; C = msb(AL)
; AH += C
; C = msb(AL)
; AH += C
; C = msb(AL)
; AH += C
; C = msb(AL)
; AH += C
;
; cuenta = AH
;**********************************************************
;****** CÓDIGO DE INICIO **********************************
    ideal
    dosseg
;Práctica 4 Programas con Operaciones Lógicas 37
;ITSON Manuel Domitsu Kono
    model small
    stack 256

;****** VARIABLES DEL PROGRAMA ****************************
dataseg
    codsal  db 0
    dato    db ?
    cuenta  db ?
;****** CÓDIGO DEL PROGRAMA *******************************
    codeseg
inicio:
    mov ax, @data ; Inicializa el
    mov ds, ax ; segmento de datos
    mov al, [dato] ; AL = dato
    xor ah, ah ; AH = 0
    shl al, 1 ; C = msb(AL)
    adc ah, 0 ; AH += C
    shl al, 1 ; C = msb(AL)
    adc ah, 0 ; AH += C
    shl al, 1 ; C = msb(AL)
    adc ah, 0 ; AH += C
    shl al, 1 ; C = msb(AL)
    adc ah, 0 ; AH += C
    shl al, 1 ; C = msb(AL)
    adc ah, 0 ; AH += C
    shl al, 1 ; C = msb(AL)
    adc ah, 0 ; AH += C
    shl al, 1 ; C = msb(AL)
    adc ah, 0 ; AH += C
    shl al, 1 ; C = msb(AL)
    adc ah, 0
    mov [cuenta], ah ; cuenta = AH
salir:
    mov ah, 04Ch
    mov al, [codsal]
    int 21h
;****** CÓDIGO DE TERMINACIÓN *****************************
    end inicio