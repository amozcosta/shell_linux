#!/bin/bash
if [[ $# -ne 1 ]]
then
    echo "Uso: $0 <NÚMERO>" >&2
    exit 1 
fi
Saida=
(($1 % 3 == 0)) && Saida+=Ping     # Poderia ser (($1 % 3)) || Saida=${Saida}Ping
(($1 % 5 == 0)) && Saida+=Pang     # Poderia ser (($1 % 5)) || Saida+=Pang 
(($1 % 7 == 0)) && Saida+=Pong     # Poderia ser (($1 % 7)) || Saida+=Pong 
[[ -z $Saida ]] && echo $1 || echo $Saida     # Saida está vazia?
