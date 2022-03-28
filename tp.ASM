; LEITOR DE FICHEIROS SEM ESPECIFICAR O NÚMERO DE CARATERES----------- ERROS----------

org 100h

terminar equ 4ch
fechar equ 3eh
criar equ 3ch
escrever equ 40h
abrir equ  3dh
ler equ 3fh
teclado equ 00

;Criar um ficheiro -> tem como saída em ax o handle do ficheiro
mov ah, criar
mov cx, 0
mov dx, path
int 21h
mov [handle], ax  ; Porque que quando se cria um ficheiro esquecese-se o nome e cria-se um número (handle)

;Abrir Ficheiro
mov ah, abrir
mov al, 02h ; Abrir só para leitura (1 para abrir para escrita)
mov dx, path ; nome do ficheiro
int 21h

; Escrever a msg
mov ah, escrever
mov bx, [handle]
mov cx, 10
mov dx, msgfich
int 21h

mov [contmin], 0
mov [contmas], 0

ciclo:
; Escrever a msg
mov ah, escrever
mov bx, 1
mov cx, 8
mov dx, msgteste
int 21h

; Ler no ficheiro      ; SAIDA : AX = número de bytes lidos
mov ah, ler
mov bx, [handle]  ; Não é no ecrã, é no handle (ler)
mov cx, 1        ; número de caracteres a serem lidos
mov dx, msg      ; Variável em que será guardado o que foi lido
int 21h

cmp ax, 0   ; Se for 0 não conseguiu ler
je sair     ; Se for 0, ou seja, se n conseguir ler, sai

cmp [msg], 97
jl maiusculas

add [contmin], 1
jmp salto

maiusculas:
add [contmas], 1

salto:
; Escrever o caráter lido
mov ah, escrever
mov bx, 1
mov cx, 1
mov dx, msg
int 21h

jmp ciclo ; Voltar para o ciclo

; Função Fecho
sair:
add [contmas], 48
add [contmin], 48
; Escrever o caráter lido
mov ah, escrever
mov bx, 1
mov cx, 1
mov dx, contmin
int 21h

; Escrever o caráter lido
mov ah, escrever
mov bx, 1
mov cx, 1
mov dx, contmas
int 21h
mov ah, fechar
mov bx, [handle]
int 21h

; Terminar
mov ah, terminar
int 21h

handle rw 1 ; Handle do ficheiro
path db "exemplo.txt", 0 ; formato ASCIIZ --> o 0 final é muito importante!
msg rb 1
msgfich db "TesteTeste"
msgteste db "msgteste"
contmin rb 1
contmas rb 1
