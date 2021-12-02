#!/bin/bash
#  Capítulo 5 exercício 2
#  Calcula DV e indica operadora de cartão de débito/crédito

(( $# != 1 )) && {
    echo 'Uso: $0 <NUMERO DO CARTAO SEM O ÙLTIMO ALGARISMO>' >&2
    exit 1
}

[[ ${#1} =~ 1[45] ]] || {  # Só aceita cartão com 14 ou 15 algarísmos
    echo Uso: $0 '<NÚMERO CARTÂO SEM DV>' >&2
    exit 1
}
case ${1:0:2} in    # 2 primeiros algarismos para descobrir operadora
       4?) Oper=Visa ;;
    3[47]) Oper=American\ Express ;;
    5[15]) Oper=MasterCard ;;
esac
printf -v Num '%015i' $1    # Inclui 0 esquerda para American Express 
Soma=0
Mul=212121212121212
for ((Pos=0; Pos<${#Num}; Pos++))
{
    let Alg=${Num:$Pos:1}*${Mul:$Pos:1} # Pode-se fazer o mesmo usando cut
    Alg=$((Alg>9 ? Alg-9 : Alg))        # Se Numero > 9 soma seus algarísmos
    let Soma+=Alg
}
echo "Operadora do cartão é $Oper
E o DV é $(((10-Soma%10)%10))"
