#!/bin/bash
#  Exercício 2 do capítulo 8
#+ Cria uma função para dar uma mensagem de erro, formatada
#+ com o nome do programa, com a msg e enviada para StdErr
#+ Receberá:
#+      $* ou $@ - Mensagem
function Erro
{
    echo $0: "$*" >&2     # O mesmo que: echo $0: "$@" >&2
}


