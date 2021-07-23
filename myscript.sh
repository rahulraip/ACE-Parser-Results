#!/bin/bash


#Before running this program, follow these steps.
#Step1: Create input file containing a sentence to be parsed.
#Step2: Write names of input and ace output file below.
#Step3: In S15.py file, write the name of output file of ace on line number 15 (e.g ./sample_output)
#Step4: Change path in below code,  according to your system.

#ace: provide input and output file name for ACE.
sentence_input="inputfile.txt"	
sentence_output="outputfile1"	

echo "Your ACE folder's location is:"
which ace
#Note: Place the input sentence file in Ace folder or copy it and give path of ace folder.
cp $sentence_input /home/rahul/Downloads/download_folder/ace-0.9.31

cd
#add path of ace directory.
cd /home/rahul/Downloads/download_folder/ace-0.9.31 
 
./ace -g /home/rahul/Downloads/download_folder/ace-0.9.31/erg-files/erg-2018-x86-64-0.9.31.dat -1Tf < $sentence_input > $sentence_output

cp $sentence_output FILE

#Path of FILE directory where S15.py and other files are stored.
cd /home/rahul/Downloads/download_folder/ace-0.9.31/FILE

#Give name of final output file for S15.py file.
S15_output="final_output1"

#write the name of output file of ace on line number 15 and run it.
python3 S15.py > $S15_output
gedit $S15_output

