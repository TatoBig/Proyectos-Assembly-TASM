; <-
; Programa realizado por Santiago José Navas Maldonado
; Carnet 1551619
; El programa encuentra si el valor ingresado en dato es impar (1) o par (0) para dejarlo en resul
; El codigo es muy sencillo ya que lo unico que hace es hacer una division del dato entre 2
; y se utilizo el residuo para dejar en resul, ya que cuando dividimos entre 2 un numero,
; si el residuo es de 1 es que el numero es impar, y si es 0 es que es par, luego solo dejamos el residuo
; que estaba en dl a resul
; ->

; <- Codigo de inicio ->
    ideal
    dosseg
    model small
    stack 256

; <- Declaracion de las variables ->
dataseg

    codsal  db 0
    dato    db ?
    resul   db ?

; <- Inicio del programa ->
codeseg

inicio:
    mov ax, @data       ; Inicializa el
    mov ds, ax          ; segmento de datos
    mov al, [dato]      ; AL = dato
    xor ah, ah          ; Esto fue necesario para limpiar ah, ya que al querer ejecutar otra vez el programa daba un error de division en 0
    mov bx, 2h          
    div bx                      
    mov [resul], dl    
salir:
    mov ah, 04Ch
    mov al, [codsal]
    int 21h

; <- Codigo de finalizacion ->
    end inicio
