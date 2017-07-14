#! usr/bin/env/ python
import re
import sys
import copy

infile = open(sys.argv[1], "r")
outfile = open(sys.argv[2], "w")

for line in infile:
	locus = line.split("\t")
	locus = locus[0]
	if locus in ['HSPA4','HAGH','UQCRC1','SMAD7','MAP3K1','NDUFS2','CASP9','MDM2','CYP2W1','COX5A']:
		outfile.write(line)
infile.close()
outfile.close()
