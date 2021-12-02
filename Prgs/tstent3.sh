if  [[ -s /dev/stdin ]]; then   # /dev/stdin tem tamanho > zero
    echo "[[ -s /dev/stdin ]] é verdadeiro
        Recebi $(cat -)"        # - é o conteúdo de StdIn
else
    echo "[[ -s /dev/stdin ]] é falso"
fi
