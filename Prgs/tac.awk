awk '{
    Registro [NR] = $0
}
END {
    for( i=NR; i>=1; i-- ) print Registro [i] 
}' telefones
