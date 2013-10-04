#!/bin/bash
#Bash Script to generate CentC files
DNASIM_PATH=/home/kvdistor/dnasim/
SIMSEQ_PATH=/home/kvdistor/simseq_master/examples/
MOSAIKBIN_PATH=/home/kvdistor/mosaik/bin/
alias simseq_dir='cd /home/kvdistor/simseq_master/examples/'
alias mosaik_dir='cd /home/kvdistor/mosaik/bin/'
alias dnasim_dir='cd /home/kvdistor/dnasim/'
for (( j=4968800; j<=9968800; j+=1000000))  #length of Junk DNA to insert
do
dnasim_dir													
perl CentCRandomDNAGen.pl $j 200 3 > CentCGenConst$j.txt  #Generate DNA files
tail CentCGenConst$j.txt -n 1 >> CentCGenConst.csv
sed -i '$ d' CentCGenConst$j.txt
echo "$j"
mv ${DNASIM_PATH}CentCGenConst$j.txt ${SIMSEQ_PATH}CentCGenConst$j.txt
simseq_dir
#Convert .txt fasta to .sam		
java -jar -Xmx2048m ~/jars/SimSeq.jar -1 100 -2 100 -n 500000 -o CentCGenConst$j.sam -error hiseq_mito_default_bwa_mapping_mq10_1.txt -error2 hiseq_mito_default_bwa_mapping_mq10_2.txt -r CentCGenConst$j.txt
mv ${SIMSEQ_PATH}CentCGenConst$j.sam ${DNASIM_PATH}CentCGenConst$j.sam
dnasim_dir
#Convert .sam to .fq
perl Sam_to_Fastq.pl CentCGenConst$j.sam CentCGenConst$j.fq x
mv ${DNASIM_PATH}CentCGenConst$j.fq ${MOSAIKBIN_PATH}CentCGenConst$j.fq
rm CentCGenConst$j.sam
mosaik_dir
#Convert .fq to .dat
./MosaikBuild -q CentCGenConst$j.fq -out CentCGenConst$j.dat -st illumina 
rm CentCGenConst$j.fq
#Convert .dat to .align
./MosaikAligner -in CentCGenConst$j.dat -out CentCGenConst$j.align -ia CentCRef.dat -hs 8 -mmp .2 -act 15 -p 16 -minp 0.3 -mhp 100
rm CentCGenConst$j.dat
#Convert .align to .sorted
./MosaikSort -in CentCGenConst$j.align  -out CentCGenConst$j.sorted -nu
rm CentCGenConst$j.align
#Convert .sorted to .assembled
./MosaikAssembler -in CentCGenConst$j.sorted -ia CentCRef.dat -out CentCGenConst$j.assembled
rm CentCGenConst$j.sorted
#Parse for information >> CentCGenConst.csv
rm CentCGenConst$j.assembled
done
