#!/bin/bash
#  cores4.sh - Lista as cores da console com bold
clear
for ((Cor=0; Cor <=7; Cor++))
{
    for Modo in sgr0 bold
    {
        tput $Modo
        tput setaf $Cor
        printf -v Linha "%-$(tput cols)s" "-Em-modo-$([ $Modo = sgr0 ] && echo Normal || echo "Bold  ")-"
        sed "s/ /█/g" <<< "$Linha"
    }
    tput sgr0
}
