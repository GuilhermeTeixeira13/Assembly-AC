
org 100h

;Definir modo gráfico
mov ah, 4fh
mov al, 02h
mov bx, 13 ;Modo Gráfico 320*320 16 cores
int 10h

; Como já estamos em modo gráfico, já podemos descrever a função que desenha um pixel

mov ah, 0ch
mov al, 2 ;Porque o professor é Sportinguista logo a cor representada é o verde.
mov bh, 0 ; Número da página, por defenição é sempre 0.
mov cx, 150 ; Coluna 150 (mais ou menos a meio do ecrã)
mov dx, 100 ; Linha 100
int 10h

;Aguarda tecla
mov ah, 3Fh
int 21h

;Terminar o programa
mov ah, 4ch
int 21h




