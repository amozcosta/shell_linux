#!/bin/bash 
# Separa animais selvagens e domésticos 
declare -A Animais 
Animais[cavalo]=doméstico           # Criando vetor para teste
Animais[zebra]=selvagem             # Criando vetor para teste
Animais[gato]=domésticoi            # Criando vetor para teste
Animais[tigre]=selvagemi            # Criando vetor para teste
Animais[urso pardo]=selvagem        # Criando vetor para teste
for Animal in "${!Animais[@]}"      # Percorrendo vetor pelo índice
do 
   if [[ "${Animais[$Animal]}" == selvagem ]] 
   then 
       Sel=("${Sel[@]}" "$Animal")  # Gerando vetor p/ selvagens
   else 
       Dom=("${Dom[@]}" "$Animal")  # Gerando vetor p/ domésticos
   fi 
done 
#  Operador condicional, usado para descobrir qual
#+ vetor tem mais elementos. Veja detalhes na seção
#+ O interpretador aritmético do Shell
Maior=$((${#Dom[@]}>${#Sel[@]}?${#Dom[@]}:${#Sel[@]})) 
clear 
tput bold; printf "%-15s%-15s\n" Domésticos Selvagens; tput sgr0 
for ((i=0; i<$Maior; i++)) 
{ 
   tput cup $[1+i] 0; echo ${Dom[i]} 
   tput cup $[1+i] 14; echo ${Sel[i]} 
}
