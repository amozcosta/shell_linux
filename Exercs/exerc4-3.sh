#!/bin/bash
#  Execício 3 do capítulo 4
#  Dá bom dia, boa tarde ou boa noite dependendo
#+ do horário do sistema
Hora=$(date +%H)
case $Hora in  # Poderia ser case $(date +%H) in
    0[0-9]|1[01]) echo Bom dia
                  ;;
          1[2-7]) echo Boa tarde
                  ;;
               *) echo Boa noite
                  ;;  # Este terminador (;;) antes do esac é opcional
esac
