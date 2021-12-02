#!/bin/bash
# Se o nome do arquivo tiver pelo menos uma 
#+ letra maiúscula, troca-a para minúscula 
for Arq in *[A-Z]*          # Pelo menos 1 minúscula
do
    if [ -f "${Arq,,}" ]    # Arq em minúsculas já existe?
    then
        echo ${Arq,,} já existe
    else
        mv "$Arq" "${Arq,,}"
    fi
done
