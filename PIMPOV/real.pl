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

for (my $j=1; $j<=$realisationmax;$j++){
for (my $i = $subcaseminb ; $i <= $subcasemaxb ; $i++){

my $vartemp=(10**(log($ncaminb)/log(10)+($i-1)*(log($ncamaxb)/log(10)-log($ncaminb)/log(10))/($disb)));
#num.case

my $cmd ='sed  s/subcase.*/subcase\ \ \ \ \ \ \ \ \ '.($i+$nmin).'/g num.'.$case.'>num.tmp;mv num.tmp num.'.$case.';touch data_'.($i+$nmin).';sed  s/deltap.*/deltap\ \ \ \ \ \ \ \ \ '.$vartemp.'/g num.'.$case.'>num.tmp' ;
system($cmd);
$cmd = 'sed  s/ndeltap.*/ndeltap\ \ \ \ \ \ \ \ \ '.$sizex*$sizey*$sizez.'/g num.tmp>num.tmp2' ;
system($cmd);

system('mv num.tmp2 num.'.$case);



				 #  $cmd='mkdir ./'.($i+$nmin);
				 #  system($cmd);

           my $num=sprintf("%04d", $i+$nmin);
           my $numr=sprintf("%04d", $j);
#$cmd = 'rm satxpercee_new;touch satxpercee_new;rm data_new;touch data_new;./arpovs;cat data_new>>data_'.($i+$nmin).';cat satxpercee_new>satxpercee_'.($i+$nmin).'_'.$j.';rm '.$case.'-'.$num.'*.[abpv]*;rm *.lgf *.tgz ';
$cmd = 'rm satxpercee_new;rm data_new;touch data_new;mpirun -np '.$nproc.' ./arpovs;cat data_new>>data_'.($i+$nmin).';rm '.$case.'-'.$num.'*.[apv]*;rm *.lgf *.tgz *.bgeo ';
			           system($cmd);

				 #  $cmd='mv *.vtp ./'.($i+$nmin).';mv satxpercee_'.($i+$nmin).'_'.$j.' ./'.$i;
			         #  system($cmd);


						        }

							             }









                                                     










