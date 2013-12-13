;---------------------------------------------------
; Programa: Contagem regressiva
; Autor: Emiliano Carvalho / Arrenius Carlos Santos
; Data: 17.10.2013
; Revisão 18.10.2013
;---------------------------------------------------
CONTA1: LDA X          ; carrega no acumulador o valor de X
        OUT 00         ; transfere do acumulador para disp externo (visor)
        ADD UM         ; soma ao acumulador o valor de UM
        NOP            ; --
        NOP            ; --
        STA X          ; armazena em X o valor adicionado ao acumulador
        SUB DEZ        ; subtrai do acumulador o conteúdo de uma posição 
        JZ  SAIR       ; se o subtrai reduziu a zero pula pra Decrementador
        JMP CONTA1     ; loop volta ao início

SAIR:   LDA DEZ        ; acumulador esta com zero carrega DEZ para decremento
        OUT 00         ; exibe no visor
        NOP            ; --
        NOP            ; --
CONTA2: 
        SUB UM         ; subtrai 1 do acumulador que tem DEZ inicialmente
        OUT 00         ; exibe no visor
        NOP            ; --
        NOP            ; --
        NOP            ; --
        JZ FIM         ; se a ultima operação produziu um valor zero finaliza
        JMP CONTA2     ; entra em loop para decrementar      
FIM:  
        HLT            ; fim da contagem

        ORG 100        ; posição de memória onde será colocada a próxima instrução
X:      DS  1          ; reserva um número de palavras na memória 
DEZ:    DB  10         ; define bytes, carrega na memória o valor
ZERO:   DB  0          ; define bytes, carrega o valor definido pelo operando
UM:     DB  1          ; -             -
