#!/bin/bash
#  Recebe parâmetros via qualquer meio
#+ e os coloca em coluna numerando-os

(($# == 0)) && {      # Os dados vêm pela StdIn ou por parâmetro?
    Parms=$(cat -)
    set $Parms
}

for ((i=1; i<="$#"; i++))
{
    Lista=$(for ((i=1; i<="$#"; i++)); { printf "%0${##}i %s\n" $i ${!i}; })
}
echo "$Lista" | pr -T -8
