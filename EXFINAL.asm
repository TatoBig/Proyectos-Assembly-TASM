  ideal
  dosseg
  model small
  stack 256

dataseg
  codsal  db 0
  dato    dw ?
  resul   dw ?
  aux     dw ?
  aux2    dw ?

codeseg
inicio:
  mov ax, @data       ; Inicializa el
  mov ds, ax          ; segmento de datos
  mov ax, [dato]
  mov bx, 0FFh
  xor ax, bx
    
salir:
  mov ah, 04Ch
  mov al, [codsal]
  int 21h

  end inicio
