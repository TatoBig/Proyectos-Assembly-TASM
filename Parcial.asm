;Codigo creado por Santiago Navas

;Lo primero que se debe asignar es la variable a FAHR al inicio
;Luego hacer las operaciones, primero se hace la resta, y luego la multiplicacion para finalmente obtener el valor
;-->Inicio
  ideal
  dosseg
  model small
  stack 256
;-->Declaracion de variables
  dataseg
codsal  db 0
CENTI   dw ?
FAHR    dw ?
;-->Inicio del programa
    codeseg
inicio:
    mov ax, @data 
    mov ds, ax        
    mov ax, [FAHR]  
    sub ax , 20h      ;Se resta 32 decimal
    mov al , 05h      ;Se multiplica por 5 decimal
    mul al 
    mov bx , 09h      ;Se divide dentro de 9 decimal
    div bx  
    mov [CENTI], ax   ;Se almacena el resultado en CENTI
salir:
    mov ah, 04Ch
    mov al, [codsal]
    int 21h
    end inicio 