#!/bin/bash
#  Exercício 2 do capítulo 6
#+ Loop de leitura de dados e manipulação de cadeias
#  Para efeito didático, esse exercício será
#+ feito usando uma tela pré formatada.

#  Montagem da tela
clear
echo "
                   Nome da Máquina:

             Login Name na máquina:

                             Senha:

                 Nome dos arquivos:"

#  Para formatar a tela usa-se somente um echo, não sendo
#+ necessário usar um echo para cada linha, mas note que abrimos
#+ aspas está após o echo e o fechamos no fim da última linha
tput cup 1 36
read Maq
tput cup 3 36
read LName
tput cup 5 36
read -s Sen
#  Loop de leitura dos nomes de arquivos
Lista=
LinhaMsg=$(($(tput lines) - 3))  # 3 linhas acima da ùltima
while true
do
    tput cup 7 36
    tput el                 #  Apaga o nome do arquivo anterior
    read Arq
    [[ -z $Arq ]] && break  #  Sai do loop se nada foi informado

    #  Normalmente o teste a seguir seria seria: [[ -e $Arq ]],
    #+ porém se $Arq possuir um coringa, sua expansão produzirá
    #+ um erro, pq a opção -e é unária (só aceita um argumento)
    ls $Arq > /dev/null 2>&1 || {
        tput cup 7 51
        echo "$Arq não existe. Tecle algo..." >&2
        read -n1
        continue            #  Volta para ler outro arquivo
    }
    Lista+=$(echo $Arq)' '  #  echo para expandir coringas
    ColMsg=$((($(tput cols)-${#Lista})/2))  # Centrando a lista
    tput cup $LinhaMsg $ColMsg
    echo $Lista 
    # Não estamos controlando tamanho da lista, pode estourar a linha 
done
