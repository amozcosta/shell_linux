#!/bin/bash
# upperconv.sh
# Converte arquivo em maiúscula dando a saída em outro arquivo

if [ ! -r "$1" ]            # Posso ler arq de entrada?
then
    echo Informe arq. de entrada com direito de leitura >&2
    echo Uso: "$0 <Arq. Minusculas> <Arq. Maiúsculas>"  >&2
    exit 1
fi

if [ ! -w "$2" ]
then
    echo Informe arq. de saída com direito de gravação >&2
    echo Uso: $0 "<Arq. Minusculas> <Arq. Maiúsculas>" >&2
    exit 2
fi

exec 4<&0                   # Salva stdin no fd 4
exec < $1                   # Associa stdin  ao arq. em $1. Poderia ser: exec 0< $1

exec 7>&1                   # Salva stdout no fd 7
exec > $2                   # Associa stdout ao arq. em $2. Poderia ser: exec 1> $2

# -----------------------------------------------
    cat - | tr a-z A-Z      # Converte para maiúscula
#   ^^^^^	Hífen sempre representa stdin
#           ^^^^^^^^^^	Saída do tr para stdout
# -----------------------------------------------

exec 1>&7 7>&-              # Restaura stout e fecha fd 7
exec 0<&4 4<&-              # Restaura stdin e fecha fd 4

# Agora volta tudo ao normal: stdin é o teclado e
# e stdout é a tela. Veja:
echo \"$1\" foi escrito para \"$2\" em maiúsculas
read -n1 -p "Tecle algo para terminar: "
