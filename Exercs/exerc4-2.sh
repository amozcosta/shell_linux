#!/bin/bash
#  Execício 2 do capítulo 4
#  Passa a data do sistema para o formato AM - PM

#Hora=$(date +%H)
#Min=$(date +%M)
Hora=$1
Min=$2
Horario=$Hora:$Min
AP=AM
[[ $Horario =~ (00|12):00 ]] && {
    echo $Horario
    exit
}
(( 10#$Hora >= 12 )) && { # Especificando que a base é 10 para não dar erro em 08 e 09
    let Hora-=12
    AP=PM
}
echo $Hora:$Min $AP

