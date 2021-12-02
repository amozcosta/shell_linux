#!/bin/bash
for ((b=0; b<=7; b++))
{
    tput sgr0; echo -n "|"      # Restaura as cores padrão e marca a coluna
    for ((f=0; f<=7; f++))
    {
        tput setab $b; tput setaf $f; echo -n " b=$b f=$f "
        tput sgr0; echo -n "|"  # Restaura as cores padrão e marca a coluna
    }
    echo
}
tput sgr0
