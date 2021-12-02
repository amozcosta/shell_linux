#!/bin/bash
#  Exercício 4 do capítulo 6
#  Gera uma lista no centro da tela e parando
#+ 3 linhas antes do final da tela esperando
#+ usuário pedir para encerrar ou não
Centro=$((($(tput cols)-3)/2))  #  Calculando centro da tela
UltLin=$(($(tput lines)-3))     #  Calculando última linha para listagem
LinAtu=0                        #  Contador da linha atual
clear
seq -w 200 |
while read Num
do
    tput cup $((++LinAtu)) $Centro  #  Posicionou para listar
    echo $Num
    ((LinAtu == UltLin)) && {       #  Chegamos na última linha?
        read -n1 -p "Tecle algo para prosseguir ou f para fim..." < /dev/tty
        [[ $REPLY == F || $REPLY == f ]] && {
            echo                    #  Para o prompt ser na linha seguinte
            exit
        }
        LinAtu=0                    # Zera o contador e limpa tela
        clear
    }
done

