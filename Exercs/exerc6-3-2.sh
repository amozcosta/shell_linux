#!/bin/bash
#  Exercício 3 do capítulo 6
#  Faz a listagem horizontal baseada no intervalo
#+ entre colunas exportado pelo exerc6.3, seu pai
Col1=4
Col2=$((Col1+Intervalo+3))  # 3 = largura de cada número listado
Col3=$((Col2+Intervalo+3))
Col4=$((Col3+Intervalo+3))
Col5=$((Col4+Intervalo+3))
clear
Lin=1
#  Fazendo a listagem horizontal
seq -w 100 | xargs -n5 |
while IFS=' ' read n1 n2 n3 n4 n5
do
    tput cup $Lin $Col1; echo $n1
    tput cup $Lin $Col2; echo $n2
    tput cup $Lin $Col3; echo $n3
    tput cup $Lin $Col4; echo $n4
    tput cup $Lin $Col5; echo $n5
    let Lin++ 
done
