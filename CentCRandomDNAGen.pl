#!/usr/bin/perl
#Random DNA Generator CentC in Clusters
#by Kevin Distor

use strict;
use warnings; 

die: "usage: CentCRandomDNAGen.pl <Length of Junk DNA> <Number of CentCs> <Number of Clusters>" unless @ARGV == 3;

my $i = $ARGV[0];
my $x = $ARGV[1];
my $v = $ARGV[2];
my ($y, $z, $t);

open (CENTC, "<CentCRepeats.txt");
#open (Output, '>GenCentCConst5Mb.txt');

print ">DNA with CentC inserted in clusters and CRMs insterted randomly.\n";
#print Output ">DNA with CentC inserted in clusters and CRMs insterted randomly.\n";

$i = $i + $v;

my @chars=('A','G','C','T');
my $random_DNA;
foreach (1..$i) {
  $random_DNA.=$chars[rand @chars];
}

foreach (1..$v){
substr($random_DNA, rand($i), 1) = "1";
}

$t = $x/$v;
my @valuesCentC = <CENTC>;
my $random_CentC;
foreach (1..$x) {
	$random_CentC.=$valuesCentC[rand @valuesCentC];
	chomp $random_CentC;
	$y = length($random_CentC);
}

$random_DNA =~ s/1/$random_CentC/g;
$y = $y * $v;
$z = $y + $i;

print "$random_DNA\n";
#print Output "$random_DNA";
print "#Junk DNA $i, CentC $y, Total $z\n";
#print "#Length of CentC is $y\n";
#print "#Total length is $z\n";
