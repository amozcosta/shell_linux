if [[ ! -t 0 ]]; then
    echo "[[ ! -t 0 ]] é verdadeiro
        Recebi $(cat -)"        # - é o conteúdo de StdIn
else
    echo "[[ ! -t 0 ]] é falso"
fi
