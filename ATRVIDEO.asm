;**********************************************************
; ATRVIDEO.ASM
;
; Este programa forma el byte de atributo de video empleado
; para almacenar el color con que se desplegará el texto en
; una PC. El byte de atributo de video atrvid se forma de
; la siguiente manera:
;
; atrvid = ctexto + cfondo * 16 + blink
;
; donde ctexto representa el color que tendrán las letras,
; cfondo es el color del fondo y blink controla si el texto
; parpadea, blink = 1, o no, blink = 0.
;
; ctexto es un valor entre 0 y 15, cfondo es un valor entre
; 0 y 7. Esos valores representan los siguientes colores:
;
; Negro 0
; Azul 1
; Verde 2
; Cyan 3
; Rojo 4
; Magenta 5
; Café 6
; Gris claro 7
; Gris oscuro 8
; Azul claro 9
; Verde claro 10
; Cyan claro 11
; Rojo claro 12
; Magenta claro 13
; Amarillo 14
; Blanco 15
;
; El pseudocódigo para este programa es:
;
; AH = (cfondo & 0x7) << 4
; AL = ctexto &= 0xF
; AH |= AL
;
; AL = (blink & 0x1) << 7
; AH |= AL
;
; atrvid = AH
;**********************************************************
;****** CÓDIGO DE INICIO **********************************
    ideal
;Práctica 4 Programas con Operaciones Lógicas 41
;ITSON Manuel Domitsu Kono
    dosseg
    model small
    stack 256
;****** VARIABLES DEL PROGRAMA ****************************
dataseg
    codsal  db 0
    ctexto  db ?
    cfondo  db ?
    blink   db ?
    atrvid  db ?
;****** CÓDIGO DEL PROGRAMA *******************************
    codeseg
inicio:
    mov ax, @data     ; Inicializa el
    mov ds, ax        ; segmento de datos
    mov ah, [cfondo]  ; AH = cfondo
    and ah, 7h        ; AH &= 0x7
    mov cl, 4         ; AH <<= 4
    shl ah, cl
    mov al, [ctexto]  ; AL = ctexto
    and al, 0Fh       ; AL &= 0xF
    or  ah, al        ; AH |= AL
    mov al, [blink]   ; AL = blink
    ror al, 1         ; AL = (al & 0x1) << 7
    and al, 80h
    or  ah, al        ; AH |= AL
    mov [atrvid], ah  ; atrvid = AH
salir:
    mov ah, 04Ch
    mov al, [codsal]
    int 21h
;****** CÓDIGO DE TERMINACIÓN *****************************
    end inicio