#!/bin/bash
#
# Para saber se tem dado na entrada primária
#
if [[ -t 0 ]]       # Verdadeiro se não houver dados em StdIn
then
    if (($# == 0))	# Então testa se foram passados parâmetros
    then
        echo Não tem dados em StdIn nem parâmetros >&2
        exit 1
    fi
    Meio="por passagem de parâmetros" # Como os dados chegaram?
else
    Parms=$(cat -)                    # Manda o que veio de StdIn para parms 
    set "$Parms"                      # Os dados de Parms viram parâmetros posicionais
    Meio="pela entrada primária"      # Como os dados chegaram?
fi
echo -e "Recebi $Meio os seguintes dados:\n$@"
