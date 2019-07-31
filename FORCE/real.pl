#!/usr/bin/perl -w
use strict;
use warnings;




#paramètre physique
my $gamma=0.66125;

my $costheta=sqrt(2)/2;
my $mu=0.001;

#nom du cas test
my $case=$ARGV[0];

#plage de nombre capillaire
my $ncaminb=$ARGV[1];
my $ncamaxb=$ARGV[2];
my $disb=$ARGV[10];

#nombre de realisation
my $realisationmin=$ARGV[3];
my $realisationmax=$ARGV[4];
#Discretisation de la plage de debit
my $subcaseminb=$realisationmin;
my $subcasemaxb=$disb;





#taille du réseaux
my $sizex=$ARGV[5];
my $sizey=$ARGV[6];
my $sizez=$ARGV[7];



my $nmin=$ARGV[8];

my $nproc=$ARGV[9];
#execution

for (my $i = $subcaseminb ; $i <= $subcasemaxb ; $i++){

my $vartemp=(10**(log($ncaminb)/log(10)+($i-1)*(log($ncamaxb)/log(10)-log($ncaminb)/log(10))/($disb)));

#my $cmd ='sed  s/subcase.*/subcase\ \ \ \ \ \ \ \ \ '.($i+$nmin).'/g num.'.$case.'>num.tmp;mv num.tmp num.'.$case.';sed  s/qin.*/qin\ \ \ \ \ \ \ \ \ '.$vartemp.'/g fluid.'.$case.'>fluid.tmp;mv fluid.tmp fluid.'.$case.';touch data_'.($i+$nmin);
 #  system($cmd);
#num.case
my $cmd = 'sed  s/deltap.*/deltap\ \ \ \ \ \ \ \ \ '.$vartemp.'/g num.'.$case.'>num.tmp2' ;
system($cmd);
system('mv num.tmp2 num.kr');



#				   $cmd='mkdir ./'.($i+$nmin);
#				   system($cmd);

for (my $j=1; $j<=$realisationmax;$j++){
           my $num=sprintf("%04d", $i+$nmin);
           my $numr=sprintf("%04d", $j);
#$cmd = 'rm satxpercee_new;touch satxpercee_new;rm data_new;touch data_new;./arpovs;cat data_new>>data_'.($i+$nmin).';cat satxpercee_new>satxpercee_'.($i+$nmin).'_'.$j.';rm '.$case.'-'.$num.'*.[abpv]*;rm *.lgf *.tgz ';
$cmd = 'rm data_new;touch data_new;./arpovs;cat data_new>>data_'.$sizey.';rm '.$case.'-'.$num.'*.[apv]*;rm *.lgf *.tgz ';
			           system($cmd);



						        }

							             }









                                                     










