org 100h

mov ah, 40h    ;ah ? 40h (função de escrita)
mov bx, 1      ;bx ? 1 (1=ecrã)
mov cx, 10      ;cx ? 9 (número de caracteres a escrever )
mov dx, msg1    ;dx ? endereço da variável "msg" (dx aponta para os dados a escrever)
int 21h        ;provoca a execução da acção (escrita)

mov ah, 40h    ;ah ? 40h (função de escrita)
mov bx, 1      ;bx ? 1 (1=ecrã)
mov cx, 9      ;cx ? 9 (número de caracteres a escrever )
mov dx, msg2    ;dx ? endereço da variável "msg" (dx aponta para os dados a escrever)
int 21h        ;provoca a execução da acção (escrita)

mov ah, 3fh
int 21h

mov ah, 4Ch    ;ah ? 4Ch (função para terminar a execução de um programa)
int 21h        ;provoca a execução da acção (termina o programa)

msg1 db 79,108,"a mundo",10   ;define a variável "msg"
msg2 db "Ola mundo"   ;define a variável "msg"
