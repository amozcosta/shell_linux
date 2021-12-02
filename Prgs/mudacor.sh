#!/bin/bash
tput sgr0
clear
# Carregando as 8 cores básicas para o vetor Cores
Cores=(Preto Vermelho Verde Marrom Azul Púrpura Ciano "Cinza claro")
# Listando o menu de cores
echo "
Opc        Cor
===        ==="
for ((i=1; i<=${#Cores[@]}; i++))
{
    printf "%s        %s\n" -$i- "${Cores[i-1]}"
}
CL=
until [[ $CL == [1-8] ]]
do
    read -p "
Escolha a cor da letra: " CL
done
CF=
until [[ $CF == [1-8] ]]
do
    read -p "
Escolha a cor de fundo: " CF
done
let CL-- ; let CF--   # A cor preta eh zero e nao um
tput setaf $CL; tput setab $CF
clear
read -p "Tecle algo para testar as cores que você criou: "
tput sgr0; clear
echo Quando quiser essas cores faça: tput setaf $CL\; tput setab $CF

