#!/bin/bash
#  Exercício 3 do capítulo 6
#  Redireciona, de acordo com a opção para:
#+ Opção   Programa    Tipo Listagem
#+  -v    exerc6.3.1   Vertical
#+  -h    exerc6.3.2   Horizontal
#+  Sem   Ambos        Ambos

#  Cálculo dos 4 intervalos, entre as 5 colunas,
#+ Total de colunas - 25 (10 das margens + 5 colunas de 3 char)
export Intervalo=$((($(tput cols) - 25) / 4)) # Para os filhos verem
(($# == 0)) && {
    exerc6.3.1
    read -n1 -p ' Tecle algo... '
    Col=4
    exerc6.3.2
    exit
}
[[ $1 == -v ]] && {
    exerc6.3.1
    exit
}
[[ $1 == -h ]] && {
    exerc6.3.2
    exit
}
echo Parâmetro Inválido >&2
