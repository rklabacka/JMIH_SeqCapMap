#!/bin/sh

#Give job a name
#PBS -N completeExons_mapToLoci_t2

#-- We recommend passing your environment variables down to the
#-- compute nodes with -V, but this is optional
#PBS -V

#-- Specify the number of nodes and cores you want to use
#-- Hopper's standard compute nodes have a total of 20 cores each
#-- so, to use all the processors on a single machine, set your
#-- ppn (processors per node) to 20.
#PBS -l nodes=3:ppn=15,walltime=40:00:00 
#-- Indicate if\when you want to receive email about your job
#-- The directive below sends email if the job is (a) aborted, 
#-- when it (b) begins, and when it (e) ends
#PBS -m abe rlk0015@auburn.edu

echo ------------------------------------------------------
echo -n 'Job is running on node '; cat $PBS_NODEFILE
echo ------------------------------------------------------
echo PBS: qsub is running on $PBS_O_HOST
echo PBS: originating queue is $PBS_O_QUEUE
echo PBS: executing queue is $PBS_QUEUE
echo PBS: working directory is $PBS_O_WORKDIR
echo PBS: execution mode is $PBS_ENVIRONMENT
echo PBS: job identifier is $PBS_JOBID
echo PBS: job name is $PBS_JOBNAME
echo PBS: node file is $PBS_NODEFILE
echo PBS: current home directory is $PBS_O_HOME
echo PBS: PATH = $PBS_O_PATH
echo ------------------------------------------------------

module load fastqc/11.5
module load gnu-parallel/20160322 
module load trimmomatic/0.36
module load bwa/0.7.15
module load samtools/1.3.1
module load picard/2.4.1

# #create working directory
# mkdir -p /scratch/rlk0015/Telag/Results_CompleteExonList/MapToLoci/WorkingDirectory
# echo "RLK_report: directory created: /scratch/rlk0015/Telag/Results_CompleteExonList/MapToLoci/WorkingDirectory"
# 
# # copy over clean PE fastq files
# cd /scratch/rlk0015/Telag/CleanedReads/PairedEnd
# ls *_trimmed.fastq | parallel -j+0  --eta 'cp {} /scratch/rlk0015/Telag/Results_CompleteExonList/MapToLoci/WorkingDirectory'
# echo "RLK_report: clean PE fastq files copied to /scratch/rlk0015/Telag/Results_CompleteExonList/MapToLoci/WorkingDirectory"

# move to working directory
cd /scratch/rlk0015/Telag/Results_CompleteExonList/MapToLoci/WorkingDirectory

# copy the reference to your current directory
cp /home/rlk0015/SeqCap/code/References/CompleteReferenceList/CompleteLoci_Randy.fa .
echo "RLK_report: reference copy complete"

# index reference
bwa index -p exons -a is CompleteLoci_Randy.fa
echo "RLK_report: reference index complete"

# create list with each paired individual
ls | grep "paired_trimmed.fastq" |cut -d "_" -f 1,2 | sort | uniq > pairedMapList
# while loop through the names in mapList
while read i
do
# map to ref
bwa mem -t 4 -M exons "$i"_R1_paired_trimmed.fastq "$i"_R2_paired_trimmed.fastq > "$i"_doubles.sam
done<pairedMapList
echo "RLK_report: map complete"

# map: Tonia's method
mv HTAdapter1*_doubles.sam ELF01_doubles.sam
mv HTAdapter2*_doubles.sam ELF02_doubles.sam
mv HTAdapter3*_doubles.sam ELF03_doubles.sam
mv HTAdapter4*_doubles.sam ELF04_doubles.sam
mv HTAdapter5*_doubles.sam ELF05_doubles.sam
mv HTAdapter6*_doubles.sam ELF06_doubles.sam
mv HTAdapter7*_doubles.sam ELF07_doubles.sam
mv HTAdapter8*_doubles.sam ELF08_doubles.sam
mv HTAdapter9*_doubles.sam ELF09_doubles.sam
mv HTAdapter10*_doubles.sam ELF10_doubles.sam
mv HTAdapter11*_doubles.sam ELF11_doubles.sam
mv HTAdapter12*_doubles.sam ELF12_doubles.sam
mv HTAdapter13*_doubles.sam ELF13_doubles.sam
mv HTAdapter14*_doubles.sam ELF14_doubles.sam
mv HTAdapter15*_doubles.sam ELF15_doubles.sam
mv HTAdapter16*_doubles.sam ELF16_doubles.sam
mv HTAdapter17*_doubles.sam MAH01_doubles.sam
mv HTAdapter18*_doubles.sam MAH02_doubles.sam
mv HTAdapter19*_doubles.sam MAH03_doubles.sam
mv HTAdapter20*_doubles.sam MAH04_doubles.sam
mv HTAdapter21*_doubles.sam MAH05_doubles.sam
mv HTAdapter22*_doubles.sam MAH06_doubles.sam
mv HTAdapter23*_doubles.sam MAH07_doubles.sam
mv HTAdapter24*_doubles.sam MAH08_doubles.sam
mv HTAdapter25*_doubles.sam MAH09_doubles.sam
mv HTAdapter26*_doubles.sam MAH10_doubles.sam
mv HTAdapter27*_doubles.sam MAH11_doubles.sam
mv HTAdapter28*_doubles.sam MAH12_doubles.sam
mv HTAdapter29*_doubles.sam MAH13_doubles.sam
mv HTAdapter30*_doubles.sam MAH14_doubles.sam
mv HTAdapter31*_doubles.sam MAH15_doubles.sam
mv HTAdapter32*_doubles.sam MAR01_doubles.sam
mv HTAdapter33*_doubles.sam MAR02_doubles.sam
mv HTAdapter34*_doubles.sam MAR03_doubles.sam
mv HTAdapter35*_doubles.sam MAR04_doubles.sam
mv HTAdapter36*_doubles.sam MAR05_doubles.sam
mv HTAdapter37*_doubles.sam MAR06_doubles.sam
mv HTAdapter38*_doubles.sam MAR07_doubles.sam
mv HTAdapter39*_doubles.sam MAR08_doubles.sam
mv HTAdapter40*_doubles.sam MAR09_doubles.sam
mv HTAdapter41*_doubles.sam MAR10_doubles.sam
mv HTAdapter42*_doubles.sam PAP01_doubles.sam
mv HTAdapter43*_doubles.sam PAP02_doubles.sam
mv HTAdapter44*_doubles.sam PAP03_doubles.sam
mv HTAdapter45*_doubles.sam PAP04_doubles.sam
mv HTAdapter46*_doubles.sam PAP05_doubles.sam
mv HTAdapter47*_doubles.sam PAP06_doubles.sam
mv HTAdapter48*_doubles.sam PAP07_doubles.sam
mv HTAdapter49*_doubles.sam PAP08_doubles.sam
mv HTAdapter50*_doubles.sam PAP09_doubles.sam
mv HTAdapter51*_doubles.sam PAP10_doubles.sam
mv HTAdapter52*_doubles.sam PAP11_doubles.sam
mv HTAdapter53*_doubles.sam PAP12_doubles.sam
mv HTAdapter54*_doubles.sam PAP13_doubles.sam
mv HTAdapter55*_doubles.sam PAP14_doubles.sam
mv HTAdapter56*_doubles.sam PAP15_doubles.sam
mv HTAdapter57*_doubles.sam STO01_doubles.sam
mv HTAdapter58*_doubles.sam STO02_doubles.sam
mv HTAdapter59*_doubles.sam STO03_doubles.sam
mv HTAdapter60*_doubles.sam STO04_doubles.sam
mv HTAdapter61*_doubles.sam STO05_doubles.sam
mv HTAdapter62*_doubles.sam STO06_doubles.sam
mv HTAdapter63*_doubles.sam STO07_doubles.sam
mv HTAdapter64*_doubles.sam STO08_doubles.sam
mv HTAdapter65*_doubles.sam STO09_doubles.sam
mv HTAdapter66*_doubles.sam STO10_doubles.sam
mv HTAdapter67*_doubles.sam STO11_doubles.sam
mv HTAdapter68*_doubles.sam STO12_doubles.sam
mv HTAdapter69*_doubles.sam STO13_doubles.sam
mv HTAdapter70*_doubles.sam STO14_doubles.sam
mv HTAdapter71*_doubles.sam STO15_doubles.sam
mv HTAdapter72*_doubles.sam STO17_doubles.sam
mv HTAdapter73*_doubles.sam STO18_doubles.sam
mv HTAdapter74*_doubles.sam STO19_doubles.sam
mv HTAdapter75*_doubles.sam STO20_doubles.sam
mv HTAdapter76*_doubles.sam STO21_doubles.sam
mv HTAdapter77*_doubles.sam SUM01_doubles.sam
mv HTAdapter78*_doubles.sam SUM02_doubles.sam
mv HTAdapter79*_doubles.sam SUM03_doubles.sam
mv HTAdapter80*_doubles.sam SUM04_doubles.sam
mv HTAdapter81*_doubles.sam SUM05_doubles.sam
mv HTAdapter82*_doubles.sam SUM06_doubles.sam
mv HTAdapter83*_doubles.sam SUM07_doubles.sam
mv HTAdapter84*_doubles.sam SUM08_doubles.sam
mv HTAdapter85*_doubles.sam SUM09_doubles.sam
mv HTAdapter86*_doubles.sam SUM10_doubles.sam
mv HTAdapter87*_doubles.sam SUM11_doubles.sam
mv HTAdapter88*_doubles.sam SUM12_doubles.sam
mv HTAdapter89*_doubles.sam SUM13_doubles.sam
mv HTAdapter90*_doubles.sam SUM15_doubles.sam
mv HTAdapter91*_doubles.sam SUM16_doubles.sam
mv HTAdapter92*_doubles.sam SUM17_doubles.sam
mv HTAdapter93*_doubles.sam SUM18_doubles.sam
mv HTAdapter94*_doubles.sam SUM19_doubles.sam
mv HTAdapter95*_doubles.sam SUM20_doubles.sam
mv HTAdapter96*_doubles.sam SUM21_doubles.sam

# create list with each sam file
 ls | grep "_doubles.sam" |cut -d "_" -f 1 | sort | uniq > readGroupList
 # while loop through the names in readGroupList
 while read i
 do
 # add read groups
 java -Xmx8g -jar /tools/picard-tools-2.4.1/picard.jar AddOrReplaceReadGroups I="$i"_doubles.sam O="$i"_IDed.sam RGID="$i"_HTAdapter          RGLB=SeqCap2012 RGPL=illumina RGPU="$i" RGSM="$i"
 done<readGroupList
 echo "RLK_report: readGrouping complete"

# make .sam files list for Samtools processing
ls | grep "_IDed.sam" |cut -d "_" -f 1 | sort | uniq  > samList
# loop through .sam files
while read i;
do
# convert .sam to .bam & sort. ex: HTAdapter84_CACCTTAC_L003_R1.sam –> HTAdapter84_CACCTTAC_L003_R1_sorted.bam
samtools view -@ 2 -bS "$i"_IDed.sam | samtools sort -@ 2 -o "$i"_sorted.bam
# index the sorted .bam
samtools index "$i"_sorted.bam
# tally mapped reads & calcuate the stats
samtools idxstats "$i"_sorted.bam > "$i"_counts.txt
samtools flagstat "$i"_sorted.bam > "$i"_stats.txt
samtools depth ${wd}${i} > ${wd}${i}.depth.txt |awk '{sum+=$3} END {print sum/NR}' > "$i"_avgDepth.txt
done<samList

# make results directory & move results
mkdir -p /home/rlk0015/SeqCap/Results_CompleteExonList/MapToLoci/stats
mkdir -p /home/rlk0015/SeqCap/Results_CompleteExonList/MapToLoci/counts
mkdir -p /home/rlk0015/SeqCap/Results_CompleteExonList/MapToLoci/avgDepth

# cp results to respective directories
cp *stats.txt /home/rlk0015/SeqCap/Results_CompleteExonList/MapToLoci/stats
cp *counts.txt /home/rlk0015/SeqCap/Results_CompleteExonList/MapToLoci/counts
cp *depth.txt /home/rlk0015/SeqCap/Results_CompleteExonList/MapToLoci/avgDepth

