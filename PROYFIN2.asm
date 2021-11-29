;**********************************************************
; PROYFIN2
; Minimo como un multiplo
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
    numero1     dw ?
    numero2     dw ?
    mcd         dw ?
    divisor     dw ?
    mcm         dd ?
    invalido    db 'El caracter ingresado es invalido $'
    msg1        db 'Ingrese el primer numero: $' 
    msg2        db 'Ingrese el segundo numero: $' 
    msg3        db 'El minimo comun multiplo es es: $'

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
    je inicioMCM
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

inicioMCM:
    mov ax,[numero1]  ; ax = numero1
    mov dx,[numero2]  ; dx = numero2
    ; Se ultilizara el algoritmo de euclide para encontrar el mcm
    ; Por medio de divisiones consecitivas se busca el mcd
    cmp [numero1],dx
    ja mayor
    jb menor
    je igual

mayor:
    ; Num 2 es el menor
    ; El numero menor es el divisor y el numero mayor el dividendo 
    mov ax,[numero1]
    mov bx,[numero2]
    xor dx,dx ; Evitar el error de divicion por cero 
    jmp whi

menor:
    ; Num 1 es el menor
    ; El numero menor es el divisor y el numero mayor el dividendo 
    mov ax,[numero2]
    mov bx,[numero1]
    xor dx,dx ;evitar el error de divicion por cero 
    jmp whi
igual:
    ; No importa el orden 
    mov ax,[numero2]
    mov bx,[numero1]
    xor dx,dx ;evitar el error de divicion por cero 
    jmp whi
whi:
    ; Se hace la divicion
    div bx 
    ; Revisar si el resuciduo no es 0
    cmp dx,0
    je encontrado
    ; Ajustar los valores para la siguente vuelta del ciclo
    mov ax,bx ; El divisor anterior se vulve el nuevo dividendo  
    mov bx,dx ; El residuo se vuelve el divisor
    xor dx,dx ; Evitar el error de divicion por cero 
    jmp whi   ; Se hace otra vez el ciclo

encontrado:
    mov [mcd],bx ; Ya se encontra el MCD 
    ; Para el algoritmo de euclide el mcm(a,b)=a*b/mcd(a,b)
    mov ax,[numero1]
    mov bx,[mcd]
    xor dx,dx   ; Evitar el error de divicion por cero 
    div bx      ; Dividir a entre mcd caciente en ax 
    mul [numero2] ; Resultado en DX:AX
    mov [word mcm], ax ; Resul = DX:AX
    mov [word mcm+2], dx
    
    mov ah, 09h  
    mov dx, offset msg3
    int 21h

    mov ax,[word mcm]

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
; Codigo de finalizacion
 end inicio
