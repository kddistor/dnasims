#!/bin/bash
#Bash Script to generate CentC in tandem, CRMs in clusters files
DNASIM_PATH=/home/kvdistor/dnasim/
SIMSEQ_PATH=/home/kvdistor/simseq_master/examples/
MOSAIKBIN_PATH=/home/kvdistor/mosaik/bin/
for m in {200..770..63}   #CentC to insert
do
for n in {10..19..1}		#CRM to insert
do
dnasim_dir													
perl CentCRandomDNAGen.pl $j 200 3 > dna10MBCRM$n.CentC$m$j.txt  
tail dna10MBCRM$n.CentC$m$j.txt -n 1 >> dna10MBCRM$n.CentC$m.csv
sed -i '$ d' dna10MBCRM$n.CentC$m$j.txt
echo "$j"
mv ${DNASIM_PATH}dna10MBCRM$n.CentC$m$j.txt ${SIMSEQ_PATH}dna10MBCRM$n.CentC$m$j.txt
simseq_dir
#Convert .txt fasta to .sam		
java -jar -Xmx2048m ~/jars/SimSeq.jar -1 100 -2 100 -n 500000 -o dna10MBCRM$n.CentC$m$j.sam -error hiseq_mito_default_bwa_mapping_mq10_1.txt -error2 hiseq_mito_default_bwa_mapping_mq10_2.txt -r dna10MBCRM$n.CentC$m$j.txt
mv ${SIMSEQ_PATH}dna10MBCRM$n.CentC$m$j.sam ${DNASIM_PATH}dna10MBCRM$n.CentC$m$j.sam
dnasim_dir
#Convert .sam to .fq
perl Sam_to_Fastq.pl dna10MBCRM$n.CentC$m$j.sam dna10MBCRM$n.CentC$m$j.fq x
mv ${DNASIM_PATH}dna10MBCRM$n.CentC$m$j.fq ${MOSAIKBIN_PATH}dna10MBCRM$n.CentC$m$j.fq
rm dna10MBCRM$n.CentC$m$j.sam
mosaik_dir
#Convert .fq to .dat
./MosaikBuild -q dna10MBCRM$n.CentC$m$j.fq -out dna10MBCRM$n.CentC$m$j.dat -st illumina 
rm dna10MBCRM$n.CentC$m$j.fq
#Convert .dat to .align
./MosaikAligner -in dna10MBCRM$n.CentC$m$j.dat -out dna10MBCRM$n.CentC$m$j.align -ia CentCRef.dat -hs 8 -mmp .2 -act 15 -p 16 -minp 0.3 -mhp 100
rm dna10MBCRM$n.CentC$m$j.dat
#Convert .align to .sorted
./MosaikSort -in dna10MBCRM$n.CentC$m$j.align  -out dna10MBCRM$n.CentC$m$j.sorted -nu
rm dna10MBCRM$n.CentC$m$j.align
#Convert .sorted to .assembled
./MosaikAssembler -in dna10MBCRM$n.CentC$m$j.sorted -ia CentCRef.dat -out dna10MBCRM$n.CentC$m$j.assembled
rm dna10MBCRM$n.CentC$m$j.sorted
#Parse for information >> dna10MBCRM$n.CentC$m.csv
#rm dna10MBCRM$n.CentC$m$j.assembled
done
done
