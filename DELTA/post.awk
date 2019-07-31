#! /usr/bin/awk -f

#BEGIN {
#    print "Démarrage du programme"
#    }

    { total+=$1;\
    total2+=$2;\
    total3+=$3;\
    total4+=$4;\
    total5+=$5;\
    moycal1+=(log($4)/log(10))**2;\
    moycal2+=log($4)/log(10);
}
    END {
    print(total/NR, total2/NR, total3/NR, total4/NR,total5/NR,(((moycal1/NR-(moycal2/NR)**2)**2)**(0.5))**(0.5))}
#    printf($2, $3)}'
