;**********************************************************
; PROYFIN1
; maximo como un divisor
; Grupo 6
;**********************************************************

; Codigo de inicio 
    ideal
    dosseg
    model small
    stack 256

; Declaracion de variables
dataseg
    codsal      db 0
    diez        db 10
    numero1     dw 0
    numero2     dw 0
    invalido    db 'El caracter ingresado es invalido $'
    msg1        db 'Ingrese el primer numero: $' 
    msg2        db 'Ingrese el segundo numero: $' 
    msg3        db 'El maximo comun divisor es: $'

; Codigo del programa
codeseg

inicio:
    mov ax, @data           ; Inicializa el
    mov ds, ax              ; Segmento de datos

ingreso1:
    mov ah, 09h             ; Interrupcion 09h  para imprimir una cadena
    mov dx, offset msg1     
    int 21h                 
    mov [numero1], 0        ; Se empieza el numero en 0

leerNumero1:
    mov ah,01h              ; Interrupcion para leer entrada de teclado
    int 21h                 
    cmp al, 0dh             
    je continuar            ; Continua si encuentra un enter
    ; Se compara si la entrada es un numero, sino se salta a un caracter invalido
    cmp al, 30h             
    jl invalido1            
    cmp al, 39h             
    jg invalido1        
        
    sub al, 30h             ; Al restar 30h se obtien el valor en bytes
    mov ah, 00                            
    mov bx, ax              
    mov ax, [numero1]      
    mul [diez]              ; Al multiplicar por 10 se van moviendo los datos para dejar espacio al siguiente numero
                            
    add ax, bx              ; El numero se va armando en ax
    mov [numero1], ax
    jmp leerNumero1

invalido1:       
    mov ah, 09h             
    mov dx, offset invalido  
    int 21h                 
    jmp ingreso1

continuar:
    ; El procedimiento realizado para el primer numero se repite para el segundo
    mov ah, 09h             
    mov dx, offset msg2    
    int 21h     
    mov [numero2], 0         

leerNumero2:
    mov ah, 01h              
    int 21h     
    cmp al, 0dh  
    je operaciones
    cmp al, 30h 
    jl invalido2 
    cmp al, 39h  
    jg invalido2 
    sub al, 30h 
    mov ah, 00                            
    mov bx, ax 
    mov ax,[numero2]   
    mul [diez]      
    add ax,bx      
    mov [numero2],ax
    jmp leerNumero2

invalido2:
    mov ah, 09h  
    mov dx, offset invalido
    int 21h     
    jmp ingreso1

operaciones:

    mov ax, [numero1]       ; ax mayor
    mov dx, [numero2]       ; dx menor
    ; Comparar cual es mayor
    cmp ax, dx
    jl cambiar              ; Si dx es mayor saltarse a cambiarlos de lugar
    mov bx, dx              ; bx=dx
    xor dx, dx              ; dx=0
    jmp mcd
cambiar:
    xchg ax, dx             ; ax=bx, bx=ax
    mov bx, dx              
    xor dx, dx              ; dx=0
mcd:
    push bx 
    div bx                  ; ax=ax/bx
    cmp dx, 0               ; ax= 0 ?
    jz  resul
    mov bx, dx              ; bx= residuo de la division
    xor dx, dx              ; dx=0
    pop ax                  ; 
    jmp mcd                 ; Repetir
resul:
    pop dx
    mov ax, bx              ; Guardar resultado en ax
    xor dx,dx               ; Se reinicia dx para evitar problemas de la division
    
    mov ah, 09h  
    mov dx, offset msg3
    int 21h   

    call mostrar
salir:
    mov ah, 04Ch
    mov al, [codsal]
    int 21h

mostrar:
    ; Procedimiento para convetir el resultado de bytes a caracteres
   
    
    mov bx, 10000d       
    xor dx, dx
    div bx  
    mov bx, dx
    mov dl, '0'
    add dl, al
    mov ah, 02h
    int 21h

    mov ax,bx
    mov bx, 1000d       
    xor dx, dx
    div bx  
    mov bx, dx
    mov dl, '0'
    add dl, al
    mov ah, 02h
    int 21h
    
    mov ax, bx
    mov bx, 100d
    xor dx, dx
    div bx  
    mov bx, dx
    mov dl, '0'
    add dl, al
    mov ah, 02h
    int 21h

    mov ax, bx
    mov bx, 10d
    xor dx, dx
    div bx  
    mov bx, dx
    mov dl, '0'
    add dl, al
    mov ah, 02h
    int 21h

    mov ax, bx
    mov bx, 1d
    xor dx, dx
    div bx  
    mov bx, dx
    mov dl, '0'
    add dl, al
    mov ah, 02h
    int 21h
    ret
;****** CÓDIGO DE TERMINACIÓN ********************************
 end inicio
