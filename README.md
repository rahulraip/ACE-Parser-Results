# ACE-Parser-Results


Main work of ACE / Objective:
To parse a sentence and give information about it in a human readable format.

Implementation of ACE Parser:

Installation:

Users can download the ready-to-run ACE binary from the official site of Answer Contraint Engine, together with the appropriate ERG (English Resource Grammar) image.

http://sweaglesw.org/linguistics/ace/

We have used 'Linux 64-bit' Ready-to-run ACE binaries 
And ERG 2018 (linux 64- bit ) as Precompiled grammar image.

After downloading the required files, the main thing to use ACE is to first of all is setting up the path of ACE binary file in the '.bashrc' file.

Usage:

Command used for generating the parsed output:
./ace -g /home/user/Downloads/ace-0.9.31/erg-files/erg-2018-x86-64-0.9.31.dat -1Tf 

After executing the above command, it will prompt you to type a sentence (in terminal) and will give you the parsed sentence result showing the details about the sentence and words used in it such as relation with arguments, POS (Part of Speech) tag of each word, their tenses, etc.

To generate the output of the parsed sentence in a separate text file, the command used is:
./ace -g /home/user/Downloads/ace-0.9.31/erg-files/erg-2018-x86-64-0.9.31.dat -1Tf < input_file > output_file

The input_file should consist of the sentence which is to be parsed.
The output_file should be an empty file to store the output result.

Basically the format of output genarated is a MRS (Minimal Recursion Semantics) Output. So it is necessary to have knowlegde about the Minimal Recursion Semantics Representation.

Example of the parsed sentence:

SENT: She is learning English.
[ LTOP: h0
INDEX: e2 [ e SF: prop TENSE: pres MOOD: indicative PROG: + PERF: - ]
RELS: < [ pron<0:3> LBL: h4 ARG0: x3 [ x PERS: 3 NUM: sg GEND: f IND: + PT: std ] ]
 [ pronoun_q<0:3> LBL: h5 ARG0: x3 RSTR: h6 BODY: h7 ]
 [ _learn_v_1<7:15> LBL: h1 ARG0: e2 ARG1: x3 ARG2: x8 [ x PERS: 3 NUM: sg IND: + ] ]
 [ proper_q<16:24> LBL: h9 ARG0: x8 RSTR: h10 BODY: h11 ]
 [ named<16:24> LBL: h12 CARG: "English" ARG0: x8 ] >
HCONS: < h0 qeq h1 h6 qeq h4 h10 qeq h12 >
ICONS: < > ]



Terms used in ACE parser's parsed sentence:
LTOP: 
INDEX: shows the main verb used in the sentence  as e2, shows the tense of the sentence.
RELS: It shows the relation between the arguments of the sentence, the numbering of the alphabets of words (denotes the starting and ending point of the words including spaces and puntuation marks.)
HCONS: It handles the predicate
ICONS:

In semantic, predication is a relation between a predicate and a set of arguments. In syntax, it is often used for the relation between subject and predicate.

The main thing in the generated parsed sentence is to understand the relation of words or arguments of the sentence.

Understanding the output:

First of all we have to find the main verb used in the sentence.
In the index section the main verb is shown as 'e2'. That means the word associated with e2 is the main verb. 
In above example main verb is 'learning' and can be checked by looking to the arg0 (argument 0) value.

The relation further can be understood with the help of ARG values associated with the words.
 [ _learn_v_1<7:15> LBL: h1 ARG0: e2 ARG1: x3 ARG2: x8 [ x PERS: 3 NUM: sg IND: + ] ]
 
In above line, ARG0: e2 defines that it is the main verb. ARG1: x3 shows that 'learn' is related to x3 which is nothing but 'she'. Futher ARG2: x8 denotes the relation with the word 'English'.


ACE COMMAND LINE OPTIONS:

ACE parser comes with various "command line options" by using which we can get more information about the sentences.
Some of the command line options that we have used are listed below along with its explaination.

1.--report-labels
This option prints the constituency parse tree of the input sentence in ACE parser.
For example:
("S" ("NP" ("NP" ("she"))) ("VP" ("V" ("is")) ("VP" ("V" ("V" ("learning"))) ("NP" ("N" ("N" ("N" ("english."))))))))


2.--rooted-derivations 
This includes the root in the tree derivation
For example:
 (root_strict ("S" ("NP" ("NP" ("she"))) ("VP" ("V" ("is")) ("VP" ("V" ("V" ("learning"))) ("NP" ("N" ("N" ("N" ("english.")))))))))

3.-q
This option actually supresses i.e. skips the print of the input sentence in the MRS output.
For example:
A dog barks.
[ LTOP: h0
INDEX: e2 [ e SF: prop TENSE: pres MOOD: indicative PROG: - PERF: - ]
RELS: < [ _a_q<0:1> LBL: h4 ARG0: x3 [ x PERS: 3 NUM: sg IND: + ] RSTR: h5 BODY: h6 ]
 [ _dog_n_1<2:5> LBL: h7 ARG0: x3 ]
 [ _bark_v_1<6:12> LBL: h1 ARG0: e2 ARG1: x3 ] >
HCONS: < h0 qeq h1 h5 qeq h7 >
ICONS: < > ]
In above example it is suppressing the printing of  the input sentence (SENT: A dog barks.)

4.-R
She is learning English.
NOTE: 1 readings, added 1325 / 489 edges to chart (186 fully instantiated, 101 actives used, 136 passives used)	RAM: 5705k

5.-T 
This option does not allows the parser to print  trees, it only prints MRS output.

6.-f
The -f option to ask ACE to print each MRS EP on its own line, for legibility.


ACE Parser Limitations:

It cannot handle the sentences which comes with the weird grammatical constructions phenomena such as gapping in sentence.
For example: 
"Ram went to Nagpur and Mohan Hyderabad."
In above sentence, the first half of it (i.e Ram went to Nagpur) is grammatically correct but in "Mohan Hyderabad" it contains gap between 'Mohan' and 'Hyderabad'. So ACE Parser fails to identify the relation between 'Mohan' and 'Hyderabad' and marks it as a compound word.

Parsed in ACE parser:

SENT: Ram went to Nagpur and Mohan Hyderabad.
[ LTOP: h0
INDEX: e2 [ e SF: prop TENSE: past MOOD: indicative PROG: - PERF: - ]
RELS: < [ udef_q<0:3> LBL: h4 ARG0: x3 [ x PERS: 3 NUM: sg ] RSTR: h5 BODY: h6 ]
 [ _ram_n_1<0:3> LBL: h7 ARG0: x3 ]
 [ _go_v_1<4:8> LBL: h1 ARG0: e2 ARG1: x3 ]
 [ _to_p_dir<9:11> LBL: h1 ARG0: e8 [ e SF: prop TENSE: untensed MOOD: indicative PROG: - PERF: - ] ARG1: e2 ARG2: x9 [ x PERS: 3 NUM: pl ] ]
 [ udef_q<12:39> LBL: h10 ARG0: x9 RSTR: h11 BODY: h12 ]
 [ proper_q<12:18> LBL: h13 ARG0: x14 [ x PERS: 3 NUM: sg IND: + ] RSTR: h15 BODY: h16 ]
 [ named<12:18> LBL: h17 CARG: "Nagpur" ARG0: x14 ]
 [ _and_c<19:22> LBL: h19 ARG0: x9 ARG1: x14 ARG2: x20 [ x PERS: 3 NUM: sg IND: + ] ]
 [ proper_q<23:39> LBL: h21 ARG0: x20 RSTR: h22 BODY: h23 ]
 [ compound<23:39> LBL: h24 ARG0: e25 [ e SF: prop TENSE: untensed MOOD: indicative PROG: - PERF: - ] ARG1: x20 ARG2: x26 [ x PERS: 3 NUM: sg IND: + PT: notpro ] ]
 [ proper_q<23:28> LBL: h27 ARG0: x26 RSTR: h28 BODY: h29 ]
 [ named<23:28> LBL: h30 CARG: "Mohan" ARG0: x26 ]
 [ named<29:39> LBL: h24 CARG: "Hyderabad" ARG0: x20 ] >
HCONS: < h0 qeq h1 h5 qeq h7 h11 qeq h19 h15 qeq h17 h22 qeq h24 h28 qeq h30 >
ICONS: < > ]
NOTE: 1 readings, added 2271 / 660 edges to chart (261 fully instantiated, 162 actives used, 189 passives used)	RAM: 9238k

To overcome these limitations the input is given in such a way by changing the construction of sentence that ACE parser could handle it.

