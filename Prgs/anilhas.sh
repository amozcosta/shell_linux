#  O prg serve para contar a quantidade de cada anilha teria de usar
#+ para fazer um cabeamento.
#+ Anilhas são aqueles pequenos anéis numerados que se vê nos cabos
#+ de rede e que servem para identificá-los.
(($# != 2)) && {
    echo "Uso: $0 <Número Inicial> <Número Final>"
    exit 1
}
Tudo=$(eval echo {$1..$2})       # Recebe os num. entre $1 e $2
Tudo=${Tudo// /}                 # Tira os brancos entre os números
for ((i=0; i<${#Tudo}; i++))
{
    let Algarismo[${Tudo:i:1}]++ # Incrementa vetor do algarismo
}
for ((i=0; i<=9; i++))
{
    printf "Algarismo %d = %2d\n" \
    $i ${Algarismo[$i]:-0}       # Se elemento for vazio, lista zero
}
