#! usr/bin/env/ python
import sys

infile = open(sys.argv[1], "r")
outfile = open(sys.argv[2], "w")

for line in infile:
    split_line = line.split("\t")
    locus = split_line[0]
    BP = int(split_line[1])
    if locus == "HSPA4":
        if BP > 11811 and BP < 11966:
            line = line.replace("HSPA4","HSPA4_14")
            outfile.write(line)
    elif locus == "HAGH":
        if BP > 3109 and BP < 3176:
            line = line.replace("HAGH","HAGH_04")
            outfile.write(line)
    elif locus == "UQCRC1":
        if BP > 8955 and BP < 9046:
            line = line.replace("UQCRC1","UQCRC1_11")
            outfile.write(line)
    elif locus == "SMAD7":
        if BP > 3428 and BP < 3930:
            line = line.replace("SMAD7","SMAD7_05")
            outfile.write(line)
    elif locus == "MAP3K1":
        if BP > 10100 and BP < 10194:
            line = line.replace("MAP3K1","MAP3K1_12")
            outfile.write(line)
    elif locus == "NDUFS2":
        if BP > 10402 and BP < 10681:
            line = line.replace("NDUFS2","NDUFS2_14_c")
            outfile.write(line)
    elif locus == "CASP9":
        if BP > 4941 and BP < 5089:
            line = line.replace("CASP9","CASP9_07")
            outfile.write(line)
    elif locus == "MDM2":
        if BP > 2508 and BP < 2594:
            line = line.replace("MDM2","MDM2_04")
            outfile.write(line)
    elif locus == "CYP2W1":
        if BP > 1519 and BP < 1698:
            line = line.replace("CYP2W1","CYP2W1_05")
            outfile.write(line)
    elif locus == "COX5A":
        if BP > 4077 and BP < 4232:
            line = line.replace("COX5A","COX5A_05")
            outfile.write(line)
infile = infile.close()
outfile = outfile.close()
