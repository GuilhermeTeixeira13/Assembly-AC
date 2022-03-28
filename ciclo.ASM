;;;; DESAFIO --> Fazer para 3 dígitos
;;;; Subject Aula 3 !!!!!!!

org 100h

escrever equ 40h ; escrever é equivalente a 4h
ecran equ 1      ; ecran é equivalente a 1
ler equ 3fh      ; ler é equivalente a 3fh
terminar equ 21h ; terminar é equivalente a 21h


mov [cont], 15 ; --> colocar 15 no conteúdo da variável [OS PARENTISES SÂO IMPORTANTES]

ciclo: ; é uma label (etiqueta) --> não escrever com letra maiúscula e não esquecer os dois pontos

; DIVISÃO
mov ah, 0
mov al, [cont]     ; -- > valor que queremos dividir
mov bl, 10         ; --> bl ou qualquer outro registo de 8 bit
div bl             ; --> divide AX (cont) por bl --> divisão inteira --> coloca quociente no regisot AL e o resto no registo AH
mov [dezenas], al  ; --> Cria uma variável "dezenas" com o conteúdo de al
mov [unidades], ah ; --> Cria uma variável "unidades" com o conteúdo de al

add [dezenas], 48 ; --> sem isto iria escrever os símbolos que contêm os caracteres dos 15 primeiros números da tabela ascii
mov ah, escrever ;ah ? 40h (função de escrita)
mov bx, ecran    ;bx ? 1 (1=ecrã)
mov cx, 1        ;cx ? 10 (número de caracteres a escrever )
mov dx, dezenas  ;dx ? endereço da variável "dezenas" (dx aponta para os dados a escrever)
int terminar     ;provoca a execução da acção (escrita)

add [unidades], 48 ; --> sem isto iria escrever os símbolos que contêm os caracteres dos 15 primeiros números da tabela ascii
mov ah, escrever ;ah ? 40h (função de escrita)
mov bx, ecran    ;bx ? 1 (1=ecrã)
mov cx, 1        ;cx ? 10 (número de caracteres a escrever )
mov dx, unidades ;dx ? endereço da variável "unidades" (dx aponta para os dados a escrever)
int terminar     ;provoca a execução da acção (escrita)

; ESCRITA PARA PASSAR DE LINHA
mov ah, escrever
mov bx, ecran
mov cx, 1
mov dx, novalinha
int terminar

sub [cont], 1; cont = cont - 1

jnz ciclo ; jump, if not zero, to ciclo --> termina o ciclo se o contador for zero

; FICA HÁ ESPERA QUE SEJA INTRODUZIDO UM CARACTER
mov ah, ler
int 21h

mov ah, 4Ch      ;ah , 4Ch (função para terminar a execução de um programa)
int terminar     ;provoca a execução da acção (termina o programa)


novalinha db 10 ; --> novalinha contem o '\n', ou seja, 10 em decimal a partir da tabela ascii
cont rb 1       ; reserva um byte --> com um byte pode contar-se de 0 a 255
dezenas rb 1    ; reserva um byte
unidades rb 1   ; reserva um byte
