#!/bin/bash
#  Exercício 3 do capítulo 6
#  Faz a listagem vertical baseada no intervalo
#+ entre colunas exportado pelo exerc6.3, seu pai
clear
Col=4
seq -w 100 | xargs -n20 |   #  100/5=20, isto é, 20 linhas ao todo
while IFS=$'\n' read Vinte
do
    Lin=1
    for Num in $Vinte
    {
        tput cup $Lin $Col
        echo $Num
        let Lin++
    }
    let Col+=Intervalo+3
    #sleep 0.3   #  Para câmara lenta, descomente o inicio da linha
done
