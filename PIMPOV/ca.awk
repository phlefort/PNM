#! /usr/bin/awk -f

#BEGIN {
#    print "Démarrage du programme"
#    }

$10>0&&$10<1{
     total1+=$13;\
     total2+=$8;\
     total3+=$10;\
     total4+=$11;\
     total5+=$14;\
     total6+=$14;\
     total7+=1;
}
    END { print(total1/total7,total2/total7,total3/total7,total4/total7,total5/total7,total6/total7)}
#    printf($2, $3)}'
