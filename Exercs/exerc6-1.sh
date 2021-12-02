#!/bin/bash
#  Exercício 1 do capítulo 6
#  Parte um texto nos espaços para caberem numa largura
#+ Recebe os seguintes parâmetros:
    #+ $1 = Tamanho máximo no qual o texto será partido
    #+ $* = O texto que será partido
    #+ Obs: O texto só será partido nos espaços em branco
    #+ Por ser feita para programador, a função não
    #+ critica se existe espaço antes do tamanho definido
Larg=$1
shift     #  Jogou fora a largura. Agora ficou só o texto
LinParc=  #  Linha parcial aquela que terá o tamanho < que $1
LinTot=   #  Linha completa à qual agregaremos cada LinParc
for Palavra in $@
do
    (( ${#LinParc} + ${#Palavra} > $Larg)) && {
        LinTot+="$LinParc\n"
        LinParc=
    }
    LinParc+="$Palavra "
done

LinTot+="$LinParc"
echo -e "$LinTot"
