dnasims
=======

DNA simulations. Perl script to generated simulated DNA with different ways of inserting TEs. Shell script to run pipeline of analysis included

# READ_ME - Dna Simulations
# by Kevin Distor
# University of California - Davis

#####################################################################################################
#	A series of scripts that generate DNA reads with known percentage of genetic elements inserted	#
#	Each script is not dependant on another since they do different functions.					 	#
#####################################################################################################

Scripts: 
1. RandomDNAGenMaster.pl	#Creates DNA with random DNA and repeats inserted randomly 
							in the sequence one of four ways:
								-In Tandem
								-In Clusters
								-Independantly of one another
								-Independantly of one another with repeats allowing to
								insert themseselves into other repeats.
							#Specify at the prompt how many of 4 repeats you want inserted
							and how you want them to be inserted. Length of junk dna to insert
							is also asked.

Dependencies:
	-Script and reference files should be in the same folder.

Modifications to files/script before using:
Line 29-32:
	-Change the name of the repeat reference file to be used. The script will grab the sequences
		from these files and insert them into the dna. Reference file format should 1 raw sequence
		of the repeat copy separated by a newline.
			ie
			CRMRepeats.txt
			AGCCCAGATAGATAGAGGGGG
			AGGTTTTCATCGGGTATATCTATCTACTACTATTGGATGTAGTATCTCATCTACT
			CAACACTTCTCTATCTACTATCATCTACTATCTATCTCTATC
Line 33:
	-Change name of the output file.



To invoke:
	-perl RandomDNAGenMaster.pl
	

										
										
#############################################################################################################################										
2.CentCRandomDNAGen.pl		#Creates DNA with CentC copies inserted randomly in tandem clusters. 				

Dependencies:
	-Script and reference files should be in the same folder.
	
Modifications to files/script before using:
Line 15:
	- Change the name of the repeat reference file to be used. The script will grab the sequences
		from these files and insert them into the dna. Reference file format should 1 raw sequence
		of the repeat copy separated by a newline.
			ie
			CRMRepeats.txt
			AGCCCAGATAGATAGAGGGGG
			AGGTTTTCATCGGGTATATCTATCTACTACTATTGGATGTAGTATCTCATCTACT
			CAACACTTCTCTATCTACTATCATCTACTATCTATCTCTATC
Line 16:
	-Change name of the output file.


To invoke:
	-perl CentCRandomDNAGen.pl <Length of Junk DNA> <Number of CentCs> <Number of Clusters>
	
#############################################################################################################################												
3.CentCConstGenBashPipe.sh		#Creates and maps constant amount of CentC reads inserted into variable 
								junk DNA length.
									Generates multiple files based on number of junk DNA
										inserted (lines 9)
									DNA generation uses script 2.
Algorithm/Process:
		-In the default script, a junk DNA sequence of 4968000 (line 9) will be generated with 200 centc's in 
		3 tandem inserted (line 12). This sequence will be run through an illumina simulator(line 190 before it is mapped
		with mosaik(lines 29-37)
		-The script will add 100,000 to the Junk DNA sequence (line 9) on the next run through.

Dependencies:
	-Mosaik 1.1				
	-SimSeq 				(https://github.com/jstjohn/SimSeq)
	-CentCRandomDNAGen.pl
	-Reference CentC file to be in the format as described in line 58-61 of this Readme.

Modifications to files/script before using:
Line 3-4:
	-Change the paths and put files where necessary.
		DNASIM_path should have:
			-CentCRandomDNAGen.pl
			-Reference CentC Files
Line 6-7:
	-Change alias and their paths. 
		Create line 6-8 in your .bash_profile 
			To do this:
				vim .bash_profile
				I
				Copy lines 6-8 somewhere in the file
				Esc + :q! to exit
Line 9:
	-Change length of Junk Dna to insert. Script will loop until it finishes generating all files.

Line 12:
	-Change DNA generation input and output file.
	
Line 19:
	-Change Simseq parameters. Documentation can be found on their site.
		Default parameters creates 500,000 reads of length 100 from generated DNA.

Line 31:
	-Change align methods. Documentation found in Mosaik Manual
		Default parameters are parameters that best capture CentC abundance.
