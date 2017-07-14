#! usr/bin/env/ python
import re
import sys
import copy

infile = open(sys.argv[1], "r")
outfile = open(sys.argv[2], "w")

for line in infile:
	locus = line.split("\t")
	locus = locus[0]
	if locus in ['HSPA4_14','HAGH_04','UQCRC1_11','SMAD7_05','MAP3K1_12','NDUFS2_14_c','CASP9_07','MDM2_04','CYP2W1_05','COX5A_05']:
		outfile.write(line)

