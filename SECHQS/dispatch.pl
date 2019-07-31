#!/bin/sh
fichier_moy=fnal

nbligne=`sed -n '$=' ./fnal`





for var2 in `seq 1 "$nbligne"`
do
#rm lignetemp

sed -n "$var2"p ./"$fichier_moy">temp
aaa=`awk '{print $0}' temp`
bbb=`awk '{print $1}' temp`
ccc=`awk '{print $2}' temp`
ddd=`awk '{print $3}' temp`
eee=`awk '{print $4}' temp`
fff=`awk '{print $5}' temp`
ggg=`awk '{print $6}' temp`
hhh=`awk '{print $7}' temp`
iii=`awk '{print $8}' temp`

./cloud.pl $aaa $bbb $ccc $ddd $eee $fff $ggg $hhh $iii
#${test[2]} ${test[3]} ${test[4]}




done


