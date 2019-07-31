#!/usr/bin/perl -w
use strict;
use warnings;
#nombre de processeur
my $nprocb=1;

my $disb=50;

#Discretisation de la plage de debit
my $subcaseminb=1;
my $subcasemaxb=$disb;


system('rm ./moyenneca');
#gather

for (my $f = 1 ; $f<= 1 ; $f++){
for (my $e = $subcaseminb ; $e <= $subcasemaxb ; $e++){
my $cmd='awk -f ./ca.awk ./data_'.$e.'>>./moyenneca;';
	system($cmd);
}
}
