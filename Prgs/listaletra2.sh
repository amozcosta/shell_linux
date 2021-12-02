#!/bin/bash
while IFS=: read c1 c2 c3 c4    # Olha o detalhe do $IFS modificando o read
do
    echo $((++Num)) $c4 $c3 $c2 $c1
done < letras
echo letras tem :$Num: linhas
