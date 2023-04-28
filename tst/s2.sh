#!/bin/bash

. $(pwd)/s1.sh

funcao1_file2 () {
    actual_script=$$	#PID do processo atual (do próprio script)
    last_background_script=$!	#PID do último processo em segundo plano

    while true; do
        echo "Actual Script: $actual_script"
        echo "Last background script: $last_background_script"
        sleep 20
        kill -9 $last_background_script > /dev/null 2>&1 && echo 'executado com sucesso' || exit 1
        exit 0
    done
}


funcao1_file1 &
funcao1_file2