if [[ -p /dev/stdin ]]; then   # -p Arquivo tipo named pipe
    echo "[[ -p /dev/stdin ]] é verdadeiro
        Recebi $(cat -)"        # - é o conteúdo de StdIn
else
    echo "[[ -p /dev/stdin ]] é falso"
fi
