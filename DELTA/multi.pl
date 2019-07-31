#!/usr/bin/perl -w
use strict;
use warnings;

###################################parametre du calcul############################################



#nom du cas test
my $case=$ARGV[0];

#plage de nombre capillaire
my $ncaminb=$ARGV[1];
my $ncamaxb=$ARGV[2];
my $disb=$ARGV[3];

#Discretisation de la plage de debit
my $subcaseminb=1;
my $subcasemaxb=$disb;


#nombre de realisation
my $realisationmin=1;
my $realisationmax=$ARGV[4];


#taille du réseaux
my $sizex=$ARGV[5];
my $sizey=$ARGV[6];
my $sizez=$ARGV[7];
#nombre de processeur
my $nprocb=$ARGV[8];
my $nmin=$ARGV[9];

#dossier de base
my $foldercaseinit='/'.$sizex.'x'.$sizey.'x'.$sizez.'_deb';


#copie du fichiers en fonction du nombre de processeurs accessible
#for (my $k= 2; $k<= $nprocb ; $k++){
#my $cmd='cp -r  ~'.$foldercaseinit.'/1 ~'.$foldercaseinit.'/'.$k;
#system($cmd);
#}


my $ncaminbtemp=$ncaminb;
my $ncamaxbtemp=$ncamaxb;


#execution
$ncaminb=$ncaminbtemp;
$ncamaxb=$ncaminbtemp*($ncamaxbtemp/$ncaminbtemp)**(1/$nprocb);
my $cmd='cd ~'.$foldercaseinit.'/1;./real.pl '.$case.' '.$ncaminb.' '.$ncamaxb.' '.$disb.' '.$realisationmax.' '.$sizex.' '.$sizey.' '.$sizez.' '.$nmin.'&';
system($cmd);

for (my $u= 2; $u<= $nprocb ; $u++){
$ncaminb=$ncaminbtemp*($ncamaxbtemp/$ncaminbtemp)**(($u-1)/$nprocb);
$ncamaxb=$ncaminbtemp*($ncamaxbtemp/$ncaminbtemp)**(($u)/$nprocb);
$cmd='cd ~'.$foldercaseinit.'/'.$u.';./real.pl '.$case.' '.$ncaminb.' '.$ncamaxb.' '.$disb.' '.$realisationmax.' '.$sizex.' '.$sizey.' '.$sizez.' '.$nmin.'&';
system($cmd);
}

open(PARAM,">param.txt");
print(PARAM $nprocb.' '.$subcaseminb.' '.$subcasemaxb);
close(PARAM);



