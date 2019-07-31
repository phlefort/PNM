#! /usr/bin/awk -f

#BEGIN {
#    print "Démarrage du programme"
#    }

$12>0&&$14!~ /Infinity/{
     total1+=$8;\
     total2+=$9;\
     total3+=$10;\
     total4+=$11;\
     total5+=$12;\
     total6+=$5;\
     total7+=$14;\
     total8+=1;
}
    END { print(total1/total8,total2/total8,total3/total8,total4/total8,total5/total8,total6/total8)}
#    printf($2, $3)}'
