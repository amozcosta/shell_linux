#!/bin/bash
#  Exercício 1 do capítulo 7
#  Gera um vetor e lista-o usando seus próprios índices

Bichos=('Bicho papão' 'Burro quando foge' 'Galinho de Quintino' 'Leão de chácara')
Bichos+=([9]='Macaco de imitação')  #  Para gerar vetor esparso 
for Ind in ${!Bichos[@]}            #  Todos os índices do vetor
{
    echo -e "$Ind\t${Bichos[Ind]}"  #  Listando um a um pelo índice correpondente
}
