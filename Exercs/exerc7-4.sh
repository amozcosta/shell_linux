#!/bin/bash
#  Exercício 4 do capítulo 7
#  Conta a quantidade de ocorrências de cada palavra
#+ num arquivo cujo nome será passado por parâmetro
declare -A Palavras # Array que será usado para contar palavras
Arq=$1
[[ -n $Arq ]] || {  #  Se não existir um arquivo com esse nome
    echo Arquivo não existe ou não é um arquivo regular >&2
    exit 1
}
#  Passando para minúscula usando o sed, usando o tr para tirar
#+ a pontuação e guardando saída em um arquivo temporário, pois
#+ uma variável poderia estourar com grandes arquivos.
sed 's/\(.*\)/\L\1/' $Arq | tr -dc '[:alnum:]\n\t ' > /tmp/Arq$$
for Palavra in $(cat /tmp/Arq$$)
{
    ((${#Palavra} < 3)) && continue  # Só conta palavras com 3 ou mais caracteres
    let Palavras[$Palavra]++
}
> /tmp/Arq$$   # Esvaziando arquivo de trabalho
#  Saída irá para /tmp/Arq$$ para ordenar e listar
#+ o arquivo terá <QTD OCORRENCIAS><TAB><PALAVRAS>
for Palavra in ${!Palavras[@]}
{
    echo -e "${Palavras[$Palavra]}\t$Palavra" >> /tmp/Arq$$
}
sort -nr /tmp/Arq$$ | more

