#!/usr/bin/perl
#Random DNA with Repeats Generator
#by Kevin Distor

use strict;
use warnings; 

my ($a, $b, $c, $d, $i, $ran1, $ran2, $ran3, $ran4,
  $t, $u, $v, $w, $x, $y, $z);

print "This is a program that generates random DNA. It then inserts repeats at random points in the generate sequnce. The repeats can be inserted in tandem, in clusters, independent of one another, or independently with slicing. Type at the prompt how you want the repeats to be inserted:\n \tTandem\n \tClusters \n \tIndependently\n \tIndepSlice\n";
chomp ($t = <>);

if ($t =~ m/Tandem/) {
print "This program generates random DNA. It then inserts random repeat types in tandem at random points of the DNA.\n";
print "How what is the length of Junk DNA(NT Length)?\n";
$i = <> ;
print "How many CRM repeats do you want to insert?\n";
$w = <>;
print "How many CentC repeats do you want to insert?\n";
$x = <>;
print "How many Knob180 repeats do you want to insert?\n";
$y = <>;
print "How many Knob350 repeats do you want to insert?\n";
$z = <>;



open (CRM, "<CRMRepeats.txt");
open (CENTC, "<CentCRepeats.txt");
open (KNOB180, "<Knob180Repeats.txt");
open (KNOB350, "<Knob350Repeats.txt");
open (Output, '>Tandem.fasta');

print Output ">DNA with Repeats inserted in Tandem.\n";

$i = $i + 4;

my @chars=('A','G','C','T');
my $random_DNA;
foreach (1..$i) {
	$random_DNA.=$chars[rand @chars];
}

$ran1 = int(rand($i));
$ran2 = int(rand($i)); 
$ran3 = int(rand($i));
$ran4 = int(rand($i));

do {
	$ran2 = int(rand($i));
	$ran3 = int(rand($i));
	$ran4 = int(rand($i));
	} until(($ran1 != $ran2) && ($ran1 != $ran3) &&($ran1 != $ran4) &&($ran2 != $ran3) && ($ran2 != $ran4) && ($ran3 != $ran4));
	
substr($random_DNA, $ran1, 1) = "1";
substr($random_DNA, $ran2, 1) = "2";
substr($random_DNA, $ran3, 1) = "3";
substr($random_DNA, $ran4, 1) = "4";

my @valuesCRM = <CRM>;
my $random_CRM;
foreach (1..$w) {
	$random_CRM.=$valuesCRM[rand @valuesCRM];
	chomp $random_CRM;
}

my @valuesCentC = <CENTC>;
my $random_CentC;
foreach (1..$x) {
	$random_CentC.=$valuesCentC[rand @valuesCentC];
	chomp $random_CentC;
}

my @valuesKnob180 = <KNOB180>;
my $random_Knob180;
foreach (1..$y) {
	$random_Knob180.=$valuesKnob180[rand @valuesKnob180];
	chomp $random_Knob180;
}

my @valuesKnob350 = <KNOB350>;
my $random_Knob350;
foreach (1..$z) {
	$random_Knob350.=$valuesKnob350[rand @valuesKnob350];
	chomp $random_Knob350;
}

$random_DNA =~ s/1/$random_CRM/g;
$random_DNA =~ s/2/$random_CentC/g;
$random_DNA =~ s/3/$random_Knob180/g;
$random_DNA =~ s/4/$random_Knob350/g;

print Output "$random_DNA";
}

if ($t =~m/Cluster/) {
print "This program generates random DNA. It then inserts repeat types into random clusters of the DNA.\n";
print "How what is the length of Junk DNA(NT Length)?\n";
$i = <>;
print "How many clusters for each repeat do you want?\n";
$v = <>;
print "How many CRM repeats do you want to insert?\n";
$w = <>;
print "How many CentC repeats do you want to insert?\n";
$x = <>;
print "How many Knob180 repeats do you want to insert?\n";
$y = <>;
print "How many Knob350 repeats do you want to insert?\n";
$z = <>;


open (CRM, "<CRMRepeats.txt");
open (CENTC, "<CentCRepeats.txt");
open (KNOB180, "<Knob180Repeats.txt");
open (KNOB350, "<Knob350Repeats.txt");
open (Output, '>Cluster.fasta');

print Output ">DNA with Repeats inserted in Clusters.\n";

$i = $i + 4*$v;

my @chars=('A','G','C','T');
my $random_DNA;
foreach (1..$i) {
	$random_DNA.=$chars[rand @chars];
}

foreach (1..$v){
substr($random_DNA, rand($i), 1) = "1";
substr($random_DNA, rand($i), 1) = "2";
substr($random_DNA, rand($i), 1) = "3";
substr($random_DNA, rand($i), 1) = "4";
}

$a = $w%$v;
if ($a != 0) {
	print "Number of CRMs doesn't divide evenly into clusters\n";
}
$w = $w/$v;
my @valuesCRM = <CRM>;
my $random_CRM;
foreach (1..$w) {
	$random_CRM.=$valuesCRM[rand @valuesCRM];
	chomp $random_CRM;
}

$b = $x%$v;
if ($b != 0) {
	print "Number of CRMs doesn't divide evenly into clusters\n";
}
$x = $x/$v;
my @valuesCentC = <CENTC>;
my $random_CentC;
foreach (1..$x) {
	$random_CentC.=$valuesCentC[rand @valuesCentC];
	chomp $random_CentC;
}

$c = $y%$v;
if ($c != 0) {
	print "Number of Knob180s doesn't divide evenly into clusters\n";
}
$y = $y/$v;
my @valuesKnob180 = <KNOB180>;
my $random_Knob180;
foreach (1..$y) {
	$random_Knob180.=$valuesKnob180[rand @valuesKnob180];
	chomp $random_Knob180;
}

$d = $z%$v;
if ($d != 0) {
	print "Number of Knob350s doesn't divide evenly into clusters\n";
}
$z = $z/$v;
my @valuesKnob350 = <KNOB350>;
my $random_Knob350;
foreach (1..$z) {
	$random_Knob350.=$valuesKnob350[rand @valuesKnob350];
	chomp $random_Knob350;
}

$random_DNA =~ s/1/$random_CRM/g;
$random_DNA =~ s/2/$random_CentC/g;
$random_DNA =~ s/3/$random_Knob180/g;
$random_DNA =~ s/4/$random_Knob350/g;

print Output "$random_DNA";
}

if ($t =~ m/Independently/) {
print "This program generates random DNA. It then inserts repeats indpendently at random points in the sequence.\n";
print "How what is the length of Junk DNA(NT Length)?\n";
$i = <>;
print "How many CRM repeats do you want to insert?\n";
$w = <>;
print "How many CentC repeats do you want to insert?\n";
$x = <>;
print "How many Knob180 repeats do you want to insert?\n";
$y = <>;
print "How many Knob350 repeats do you want to insert?\n";
$z = <>;
$u = 1;


open (CRM, "<CRMRepeats.txt");
open (CENTC, "<CentCRepeats.txt");
open (KNOB180, "<Knob180Repeats.txt");
open (KNOB350, "<Knob350Repeats.txt");
open (Output, '>Indep.fasta');

print Output ">DNA with Repeats inserted independently of one another.\n";
$i = $i + $w + $x + $y + $z;

my @chars=('A','G','C','T');
my $random_DNA;
foreach (1..$i) {
	$random_DNA.=$chars[rand @chars];
}

foreach (1..$w){
substr($random_DNA, rand($i), 1) = "1";
}
foreach (1..$x){
substr($random_DNA, rand($i), 1) = "2";
}
foreach (1..$y){
substr($random_DNA, rand($i), 1) = "3";
}
foreach (1..$z){
substr($random_DNA, rand($i), 1) = "4";
}


my @valuesCRM = <CRM>;
my $random_CRM;
foreach (1..$u) {
	$random_CRM.=$valuesCRM[rand @valuesCRM];
	chomp $random_CRM;
}

my @valuesCentC = <CENTC>;
my $random_CentC;
foreach (1..$u) {
	$random_CentC.=$valuesCentC[rand @valuesCentC];
	chomp $random_CentC;
}

my @valuesKnob180 = <KNOB180>;
my $random_Knob180;
foreach (1..$u) {
	$random_Knob180.=$valuesKnob180[rand @valuesKnob180];
	chomp $random_Knob180;
}

my @valuesKnob350 = <KNOB350>;
my $random_Knob350;
foreach (1..$u) {
	$random_Knob350.=$valuesKnob350[rand @valuesKnob350];
	chomp $random_Knob350;
}

$random_DNA =~ s/1/$random_CRM/g;
$random_DNA =~ s/2/$random_CentC/g;
$random_DNA =~ s/3/$random_Knob180/g;
$random_DNA =~ s/4/$random_Knob350/g;

print Output "$random_DNA";
}

if ($t =~ m/IndepSlice/) {
print "This program generates random DNA. It then inserts random repeat types at random points of the DNA with slicing allowed.\n";
print "How what is the length of Junk DNA(NT Length)?\n";
$i = <> ;
print "How many CRM repeats do you want to insert?\n";
$w = <>;
print "How many CentC repeats do you want to insert?\n";
$x = <>;
print "How many Knob180 repeats do you want to insert?\n";
$y = <>;
print "How many Knob350 repeats do you want to insert?\n";
$z = <>;

open (CRM, "<CRMRepeats.txt");
open (CENTC, "<CentCRepeats.txt");
open (KNOB180, "<Knob180Repeats.txt");
open (KNOB350, "<Knob350Repeats.txt");
open (Output, '>IndepSlice.fasta');

print Output ">DNA with Repeats inserted independently of one another with repeats being allowed to slice each other.\n";

my @chars=('A','G','C','T');
my $random_DNA;
foreach (1..$i) {
	$random_DNA.=$chars[rand @chars];
}

my @valuesCRM = <CRM>;
my $random_CRM;
$random_CRM.=$valuesCRM[rand @valuesCRM];
chomp $random_CRM;


my @valuesCentC = <CENTC>;
my $random_CentC;
$random_CentC.=$valuesCentC[rand @valuesCentC];
chomp $random_CentC;


my @valuesKnob180 = <KNOB180>;
my $random_Knob180;
$random_Knob180.=$valuesKnob180[rand @valuesKnob180];
chomp $random_Knob180;


my @valuesKnob350 = <KNOB350>;
my $random_Knob350;
$random_Knob350.=$valuesKnob350[rand @valuesKnob350];
chomp $random_Knob350;

$i = $i + $w + $x + $y + $z;
foreach (1..$y) {
	$a = int(rand($i));
	substr($random_DNA, $a, 1) = "$random_Knob180";
	}
foreach (1..$z) {
	$b = int(rand($i));
	substr($random_DNA, $b, 1) = "$random_Knob350";
	}
foreach (1..$x) {
	$c = int(rand($i));
	substr($random_DNA, $c, 1) = "$random_CentC";
	}
foreach (1..$w) {
	$d = int(rand($i));
	substr($random_DNA, $d, 1) = "$random_CRM";
	}

print Output "$random_DNA";
}
