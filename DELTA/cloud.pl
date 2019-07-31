#!/usr/bin/perl -w
use strict;
use warnings;


#nom du cas test
my $case='kr';




#my $realisationmax=1;


#taille du réseaux
my $sizex=$ARGV[0]+1;
#my $sizex=5;
my $sizey=$ARGV[1];
#my $sizey=5;
my $sizez=$ARGV[2];
#my $sizez=1;
#nombre de realisation
my $realisationmin=$ARGV[3];

my $realisationmax=$ARGV[4];
#my $realisationmax=1;


#nombre maximum diterations
my $maxiter=$sizex*$sizey*$sizez;

#dossier
my $foldercaseinit='/'.$sizex.'x'.$sizey.'x'.$sizez.'_delta';

##############################modification des fichiers du cas test initial##############################
#num.case
my $cmd = 'sed  s/ndeltap.*/ndeltap\ \ \ \ \ \ \ \ \ '.$maxiter.'/g num.'.$case.'>num.tmp' ;
system($cmd);
system('mv num.tmp num.'.$case);
#struct.case
$cmd = 'sed  s/Dimensions.*/Dimensions\ \ \ \ \ \ \ \ \ '.$sizex.'\ \ '.$sizey.'\ \ '.$sizez.'/g struct.'.$case.'>struct.tmp' ;
system($cmd);
system('mv struct.tmp struct.'.$case);
#init.case
$cmd='echo imin...kmaxSat  1 1 1 '.$sizey.' 1 '.$sizez.' T>init.'.$case;
system($cmd);
#limi.case
$cmd='echo imin...kmaxTyp  1 1 1 '.$sizey.' 1 '.$sizez.' 0 >limi.'.$case;
system($cmd);
$cmd='echo imin...kmaxTyp 1 '.$sizex.' '.$sizey.' '.$sizey.' 1 '.$sizez.' 2 >>limi.'.$case;
system($cmd);
$cmd='echo imin...kmaxTyp '.$sizex.' '.$sizex.' 1 '.$sizey.' 1 '.$sizez.' 4 >>limi.'.$case;
system($cmd);
$cmd='echo imin...kmaxTyp 1 '.$sizex.' 1 '.$sizey.' '.$sizez.' '.$sizez.' 3 >>limi.'.$case;
system($cmd);












#####################################################################distribution sur darcy##########################################################
#plage de nombre capillaire
my $ncaminb=$ARGV[6];
my $ncamaxb=$ARGV[7];
#Discretisation de la plage de debit

my $disb=$ARGV[8];
my $nmin=0;
#proc 1

$cmd='mkdir -p ~'.$foldercaseinit.';' ;
system($cmd);

$cmd ='cp -r ./* ~'.$foldercaseinit.'/';
system($cmd);

my $nbproc=$ARGV[5];







#execution

$cmd='cd ~'.$foldercaseinit.'/;./real.pl '.$case.' '.$ncaminb.' '.$ncamaxb.' '.$realisationmin.' '.$realisationmax.' '.$sizex.' '.$sizey.' '.$sizez.' '.$nmin.' '.$nbproc.' '.$disb.'&';
#system($cmd);


