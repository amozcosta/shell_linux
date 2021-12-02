#!/bin/bash
#  Capítulo 5 exercício 1
#  Pesquisa um arquivo por parâmetro passado
#+ e depois faz um loop para envio de e-mail

#  Primeiramente vejamos se o parâmetro passado é
#+ numérico, ou seja OL, ou não, quando seria máquina
if expr $1 + 0 >/dev/null 2>&1
then            # if bem sucedido então é numérico
    Reg=$(grep "^$1	" ArqOLs) || {  # Após $1 tem <TAB> 
        echo $0: Informe n⁰ OL ou nome MÁQUINA >&2
        exit 1
    }
    echo Recebi parâmetro numérico      #  Esta linha pode ser apagada
else    # De erro no expr então $1 é alfa, ou seja máquina
    Reg=$(grep "	$1	" ArqOLs) || {  # $1 entre <TABs> 
        echo $0: Informe n⁰ OL ou nome MÁQUINA >&2
        exit 2
    }
    echo Recebi parâmetro alfabetico    #  Esta linha pode ser apagada
fi
#  Se o programa não abortou, o registro está em $Reg
#+ então vamos trabalhá-lo:
Maquina=$(cut -f2 <<< "$Reg")      #  As aspas são para que os <TAB>
Operadores=$(cut -f3 <<< "$Reg")   #+ não se transformem em espaços
#  Como os operadores são uma lista separada
#+ por espaços, o indicado é um loop de for:
for Operador in $Operadores
do
    echo Enviando e-mail para $Operador
    # mail $Operador@$Maquina < ARQUIVO
    #  Se vc estivesse nessa rede, bastaria descomentar
    #+ a linha do mail e escolher o nome do ARQUIVO
done
