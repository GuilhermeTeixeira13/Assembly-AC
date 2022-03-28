org 100h

terminar equ 4ch
fechar equ 3eh
criar equ 3ch
escrever equ 40h
abrir equ 3dh
ler equ 3fh
ecran equ 1

;Criar um ficheiro -> tem como saída em ax o handle do ficheiro
mov ah, criar
mov cx, 0
mov dx, path2
int 21h
mov [handle2], ax

;Abrir ficheiro
mov ah, abrir
mov al, 0h;abir só para leitura
mov dx, path
int 21h
jc erro; tratar o erro -> jump if carry
mov [handle], ax

;Abrir ficheiro
mov ah, abrir
mov al, 1h;abrir para escrita
mov dx, path2
int 21h
mov [handle2], ax

; ler no ficheiro
mov ah, ler
mov bx, [handle]
mov cx, 100
mov dx, msg
int 21h
cmp ax, 0

; Sair
sair:
; Escrever no novo ficheiro
mov ah, escrever
mov bx, [handle2]
mov cx, 100
mov dx, msg
int 21h

; Fechar ambos
mov ah, fechar
mov bx, [handle]
int 21h

mov ah, fechar
mov bx, [handle2]
int 21h

jmp fim ; Saltar para o fim

;Tratar erro
erro:
mov ah, escrever
mov bx, ecran
mov cx, 17
mov dx, msgerro
int 21h

;Terminar
fim:
mov ah, terminar
int 21h

handle rw 1; handle do ficheiro (ax - word)
handle2 rw 1
path db "exemplo1.txt", 0
path2 db "exemplo2.txt", 0
msg rb 100
msgerro db "Erro! Nao existe!"