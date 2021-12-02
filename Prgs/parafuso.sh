#!/bin/bash
tput civis                          # Tira o cursor
trap "tput cnorm; exit" 0 2 3 15    # Devolve cursor quando terminar ou for morto
echo -ne "\t\t"                     # Anda 2 <TAB>s para aparecer melhor
while kill -0 $1 2>&-               # Testa se está ativo e tranca a saída de erros
do
    for i in \| \/ \- \\ \| \/ \-   # Ponteiros do parafuso
    do
        echo -en "\b$i"             # Volta uma posição (\b) e escreve ponteiro
        sleep 0.2
    done
done
