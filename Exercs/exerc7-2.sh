#!/bin/bash
#  Exercício 2 do capítulo 7
#+ Loop de leitura de arquivos em tela formatada
#+ aceitando metacaracteres e com exposição parcial e
#+ total dos arquivos informados após expansão dos coringas

clear
tput cup 2 10             #  Posicionando na linha 2 coluna 10
echo "Arquivo:"
while true
do
    tput cup 2 19         #  Posicionando na linha 2 coluna 10
    tput el               #  Apaga nome do arquivo anterior
    read Arq
    [[ -z $Arq ]] && {
        tput cup 5 0
        [[ -n $Arqs ]] && {
            echo -e "Arquivos informados:\nÍndice\tArquivo"
            for Ind in ${!Arqs[@]}
            {
                echo -e "  $Ind\t${Arqs[Ind]}"
            }
        }
        exit
    }
    Trab=$(ls $Arq 2> /dev/null) || {  # Variável de trabalho
        tput cup 5 0
        echo Arquivo $Arq não existe. Tecle algo... >&2
        read -n1
        tput cup 5 0; tput el       #  Apaga a mensagem de erro
        continue
    }
    tput cup 4 10
    tput el               #  Apaga arquivos da relação anterior
    echo $Trab
    Arqs+=($Trab)
done
