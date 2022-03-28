
; 2 º Exemplo - Mostrar um pixel no meio do ecrã mas utilizando a mistura de cores.
; Nota : Meu puto, quando o ecrã tiver com uma res tipo a do cs, 800x600, fazes "cls" na consola.
org 100h

;Definir modo gráfico
mov ah, 4fh
mov al, 02h
mov bx, 13 ;Modo Gráfico 320*320 16 cores
int 10h

; Como já estamos em modo gráfico, já podemos descrever a função que desenha um pixel.

mov ah, 0ch ; Funcão que escreve um pixel no ecrã.
mov al, 2 ;Porque o professor é Sportinguista logo a cor representada é o verde.
mov bh, 0 ; Número da página, por defenição é sempre 0.
mov cx, 10 ; Coluna 10 (mais ou menos a meio do ecrã)
mov dx, 50 ; linha 50
int 10h


;Controla operaçoes nos registos de cor
mov ah, 10h
mov al, 10h
mov bx, 2  ; Cor a definir
mov dh, 20 ; Valor de vermelho
mov ch, 35 ; Valor de verde
mov cl, 50 ; Valor de azul
int 10h

;Terminar o programa
mov ah, 4ch
int 21h


