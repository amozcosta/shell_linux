#!/bin/bash
#  Exercício 3 do capítulo 8
#+ Cria uma função para dar uma mensagem.
#+ Receberá:
#+      $1 - Mensagem
#+      $2 - Linha na qual será dada a mensagem
#+      $3 - Coluna da mensagem (opcional)
function MandaErro
{
    local Centro=$((($(tput cols) - ${#1}) / 2))
    local Col=${3:-$Centro}  # Se $3 vazia, recebe valor de $Centro
    tput cup $2 $Col
    echo -n $1 >&2    # Manda mensagem para StdErr
    read -n1	      # Espera qualquer caractere ser teclado
    tput cup $2 $Col  # Posiciona para apagar a msg
    tput el           # Erase Line apaga linha a partir deste ponto
}
