awk 'BEGIN { MinCons=99999 }
{
    if  ( $2 > MaxVel )     # Verdadeiro no 1o registro, pois MaxVel é criada com 0
    {
        CarVel=$1
        MaxVel=$2
    }
    if  ( $4 < MinCons )    # No 1o registro será verdadeira porque MinCons=99999
    {
        CarEcon=$1
        MinCons=$4
    }
}
    END {
        print "O",CarVel,"desenvolve",\     # A última \  foi para passar para a outra linha
               MaxVel,"km e\nO",CarEcon,"faz",MinCons, "km/l\n"
    }' carros
