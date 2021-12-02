#!/bin/bash
(($(tput cols) < 110)) && {
    clear; echo                     # Tela precisa de largura mínima de 110 caracteres
    exit 1
}
seq 5000 | xargs                    # Sujando a tela
Lin=$(($(tput lines) / 2))          # Calculando linha e coluna centrais da tela
Col=$(($(tput  cols) / 2))
tput cup $Lin; tput el; tput bold   # Posicionando e apagando a linha central
tput cup $Lin $((Col-55)); tput setaf 4 # Posicionando e colorindo para dar mensagem
echo "Em 10 segundos essa tela será fotografada e se apagará"
tput civis                          # Cursor invisível para melhorar apresentação
for ((i=10; i!=0; i--))
{
    tput cup $Lin $Col; tput el     # Posiciona no centro da tela e limpa núm anterior
    echo $i
    sleep 1
}
tput smcup                          # Tirando uma foto da tela
	tput cup $Lin $((Col-53))
echo "Dentro de 10 segundos a tela inicial será recuperada"
for ((; i<10; i++))
{
    tput cup $Lin $Col              # Posicionou no centro da tela
    echo $i
    sleep 1
}
tput rmcup                          # Restaurou a foto
tput cvvis;tput sgr0                # Restaurou o cursor e cor
