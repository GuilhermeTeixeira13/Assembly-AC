; LEITOR DE FICHEIROS --> Lê o ficheiro todo

org 100h

terminar equ 4ch
fechar equ 3eh
criar equ 3ch
escrever equ 40h
abrir equ  3dh
ler equ 3fh
ecran equ 1


;Abrir Ficheiro
mov ah, abrir
mov al, 0h ; Abrir só para leitura (1 para abrir para escrita)
mov dx, path ; nome do ficheiro
int 21h
mov [handle], ax  ; Porque quando se cria um ficheiro esquecese-se o nome e cria-se um número (handle).


ciclo:
; Ler no ficheiro      ; SAIDA : AX = número de bytes lidos
mov ah, ler
mov bx, [handle]  ; Não é no ecrã, é no handle (ler)
mov cx, 1         ; número de caracteres a serem lidos
mov dx, msg       ; Variável em que será guardado o que foi lido
int 21h

cmp ax, 0  ; Se for 0 não conseguiu ler
je sair    ; Se for 0, ou seja, se n conseguir ler, sai

; Escrever o caráter lido
mov ah, escrever
mov bx, ecran
mov cx, 1
mov dx, msg
int 21h

jmp ciclo ; Voltar para o ciclo

; Função fecho do do ficheiro
sair:
mov ah, fechar
mov bx, [handle]
int 21h

; Terminar
mov ah, terminar
int 21h

handle rw 1 ; Handle do ficheiro
path db "exemplo1.txt", 0 ; formato ASCIIZ --> o 0 final é muito importante!
msg rb 1
