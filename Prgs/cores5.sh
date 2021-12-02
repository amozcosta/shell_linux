Qtd=$(tput colors)
for ((i=0; i<=$Qtd; i++))
{
    printf "%0${#Qtd}i-" $i
    tput setaf $i
    echo -n '██████    '
    tput op
    ((i%8)) || echo
}

