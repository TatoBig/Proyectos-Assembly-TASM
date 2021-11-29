;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;++                          SEGUNDA SERIE                               ++
;++                        PAOLO VELIZ 1543219                           ++
;++             ESTE PROGRAMA VE LA CANTIDAD DE 0 EN UNA VARIABLE        ++
;++                     TIPO PALABRA Y USANDO LOOP                       ++
;++                                                                      ++
;++                                                                      ++
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ideal
 dosseg
 model small
 stack 256

;+++++++++++++++++++++VARIABLES DE PROGRAMA++++++++++++++++++++++++++++++++
 dataseg
codsal db ?
cuenta dw ?
numerobits db ?

; CÓDIGO DEL PROGRAMA 
        codeseg
inicio:
  mov     ax, @data           ; Inicializa el
  mov     ds, ax              ; segmento de datos

  mov     ax, [cuenta]
  xor     bx, bx
  xor     cx, cx
  mov     cx, 16d
  mov     bh, 0d

  jcxz    enddo

do:
  shl     ax, 1
  adc     bl, 0
  loop    do
enddo:

  mov     [numerobits], bl
  mov     al, 16d
  sub     al, [numerobits]
  mov     [numerobits], al
salir:
  mov     ah, 04Ch
  mov     al, [codsal]
  int 21h 
  end inicio