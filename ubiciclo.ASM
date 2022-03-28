org 100h

escrita equ 40h
ecran equ 1

; Nova forma de fazer ciclos -> ver intruções no final do programa
mov cx, 10
ciclo:
push cx; --> Importante - Rever teórica

call escrever ; --> Chamar a subrotina
call escrever1

pop cx; --> Importante - Rever teórica
loop ciclo

mov ah, 07h
int 21h

mov ah, 4ch
int 21h

msg db "UBI "
msg1 db "Boa tarde", 10

escrever: ; --> Subrotina --> Tem de estar depois do corpo do programa
push ax ; --> Para cada push tem de haver um pop
mov ah, escrita
mov bx, ecran
mov cx, 4
mov dx, msg
int 21h
pop ax
ret

escrever1: ; --> Subrotina --> Tem de estar depois do corpo do programa
mov ah, escrita
mov bx, ecran
mov cx, 10
mov dx, msg1
int 21h
ret

;mov cx, valor inicial
;label:
; instru.A
; ...
; loop label

;executa o ciclo a partir de label, enquanto o cx não for zero


; DESAFIO --> Penso que a solução seja criar 2 sebrotinas, uma com um cilo de 3 UBI e outra com um ciclo de 5 UBI