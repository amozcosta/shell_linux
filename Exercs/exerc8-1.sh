#!/bin/bash
#  Exercício 1 do capítulo 8
#  Lista os parâmetros recebidos em ordem inversa
#+ Receberá:
#+      $1...$N - Parâmetros que serão
#+                listados na ordem inversa
function Erro
{
    echo "$*" >&2    # Esse $* é o da função, não é o do script
}
(($# < 2)) && {
    Erro Uso: $0 P1 P2 ... PN, que são os parâmetros a inverter
    exit 1
}
for ((Parm=$#; Parm>0; Parm--))
do
    eval echo O parâmetro $Parm é \$$Parm
    #  Como o eval dá duas passadas no comando, na primeira
    #+ ele substitui $Parm pelo seu valor e tira a contrabarra
    #+ na segunda, ele escreve o valor do parâmetro.
done

