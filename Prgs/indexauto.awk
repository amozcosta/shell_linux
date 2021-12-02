awk '{
    Registros [$1] = $0
    Velocidades [$1] = $2                           # $1 =  modelo e $2 = vel. máx.
}
END {
    for (Modelo in Velocidades)
        print Modelo, "\t", Velocidades [Modelo]    # \t representa um <TAB> 
}' carros
