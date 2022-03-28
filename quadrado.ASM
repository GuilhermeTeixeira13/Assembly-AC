org 100h

ler      equ 3fh
teclado  equ 0
escrever equ 40h
ecran    equ 1
terminar equ 4ch

; ESCRITA DA MENSAGEM A PEDIR VALOR, NO ECRÂ
mov ah, escrever
mov bx, ecran
mov cx, 33
mov dx, msg1
int 21h

; !!!! Para as funções de escrita e leitura não precisamos de colocar [] nas variáveis!!! !!!!

;LER VALOR DO TECLADO
mov ah, ler
mov bx, teclado
mov cx, 1
mov dx, valor
int 21h

;LER O LF MAIS O CARRIAGE RETURN -> espera pelo ENTER
mov ah, ler
mov bx, teclado
mov cx, 2
mov dx, temp
int 21h

; MULTIPLICAR
; AX = AL * registo(8bit)
; Exemplo: 5*4
; AL=5   BL=4
; mul bl
; ax = 20

sub [valor], 48

mov al, [valor]
mov bl, [valor]
mul bl ; multiplica al por bl
mov [quadrado], ax

mov ax, [quadrado]
mov bl, 10
div bl ; divido ax pelo bl
mov [dezenas], al
mov [unidades], ah

add [dezenas], 48
add [unidades], 48

; ESCRITA DA MENSAGEM DO RESULTADO, NO ECRÂ
mov ah, escrever
mov bx, ecran
mov cx, 17
mov dx, msg2
int 21h

; ESCRITA DAS DEZENAS, NO ECRÂ
mov ah, escrever
mov bx, ecran
mov cx, 1
mov dx, dezenas
int 21h

; ESCRITA DAS UNIDADES, NO ECRÂ
mov ah, escrever
mov bx, ecran
mov cx, 1
mov dx, unidades
int 21h

;TERMINAR
mov ah, terminar
int 21h

valor rb 1; variável de leitura
temp rb 2 ; variável temporária/auxiliar
quadrado rw 1 ; reseva 2byte -> 1 word
dezenas rb 1
unidades rb 1

msg1 db "Introduza um valor entre 0 e 9 = "
msg2 db "Quadrado igual a "

; SUBJECT AULA 4 --> DESAFIO: O PROGRAMA ACEITAR VALORES DE 0 A 30