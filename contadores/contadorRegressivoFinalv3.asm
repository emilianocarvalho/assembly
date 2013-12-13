;---------------------------------------------------
; Programa: Contagem regressiva
; Autor: Emiliano Carvalho / Arrenius Carlos Santos
; Data: 17.10.2013
; Revis�o 18.10.2013
;---------------------------------------------------
CONTA1: LDA X          ; carrega no acumulador o valor de X
        OUT 00         ; transfere do acumulador para disp externo (visor)
        ADD UM         ; soma ao acumulador o valor de UM
        NOP            ; --
        NOP            ; --
        STA X          ; armazena em X o valor adicionado ao acumulador
        SUB DEZ        ; subtrai do acumulador o conte�do de uma posi��o 
        JZ  SAIR       ; se o subtrai reduziu a zero pula pra Decrementador
        JMP CONTA1     ; loop volta ao in�cio

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
        JZ FIM         ; se a ultima opera��o produziu um valor zero finaliza
        JMP CONTA2     ; entra em loop para decrementar      
FIM:  
        HLT            ; fim da contagem

        ORG 100        ; posi��o de mem�ria onde ser� colocada a pr�xima instru��o
X:      DS  1          ; reserva um n�mero de palavras na mem�ria 
DEZ:    DB  10         ; define bytes, carrega na mem�ria o valor
ZERO:   DB  0          ; define bytes, carrega o valor definido pelo operando
UM:     DB  1          ; -             -
