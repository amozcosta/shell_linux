#!/bin/bash

cat letras |
while read c1 c2 c3 c4
do
    echo $((++Num)) $c4 $c3 $c2 $c1
done
echo letras tem :$Num: linhas   # Valor de $Num será listado entre 2 dois pontos
