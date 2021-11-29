;**********************************************************
; PRIMER.ASM.
;
; Este programa ilustra la estructura de un programa en
; ensamblador. También muestra las principales directivas
; para El ensamblador.
;**********************************************************
;****** CÓDIGO DE INICIO **********************************

        ideal
        dosseg
        model small
        stack 256
  
;****** DECLARACIÓN DE CONSTANTES SIMBÓLICAS **************

cte equ 10

;****** VARIABLES DEL PROGRAMA ****************************
        dataseg
        codsal  db 0          ;Santiago Navas 1551619
        dato1   db ?
        dato2   db ?
        resul   db ?

;****** CÓDIGO DEL PROGRAMA *******************************

codeseg
inicio:
        mov ax, @data         ; Inicializa el segmento de
        mov ds, ax            ; datos
        mov al, [dato1]       ; resul = dato1 + dato2 + cte
        add al, [dato2]
        add al, cte
        mov [resul], al
salir:
        mov ah, 04Ch
        mov al, [codsal]
        int 21h
;****** CÓDIGO DE TERMINACIÓN *****************************

        end inicio

;Comandos para TASM 1.4
;   dir             // muestra contenido
;   dir h1primer.*  // muestra todos los archivos con el nombre
;   td h1primer     // entra al debugger
;   assm h1primer   // realiza el ensamblado y enlazado