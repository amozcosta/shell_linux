#!/bin/bash
#  Simula um tail
#  $1 → Arquivo
#+ $2 → Qtd linha (padrão 10)

Qtd=${2:-10}             # Se $2 não for informado Qdt=10
mapfile -t Vet < $1
printf "%s\n" "${Vet[@]: -$1}"
