#!/bin/sh

#Give job a name
#PBS -N completeExons_depth.txt_t1

#-- We recommend passing your environment variables down to the
#-- compute nodes with -V, but this is optional
#PBS -V

#-- Specify the number of nodes and cores you want to use
#-- Hopper's standard compute nodes have a total of 20 cores each
#-- so, to use all the processors on a single machine, set your
#-- ppn (processors per node) to 20.
#PBS -l nodes=1:ppn=15,walltime=40:00:00 
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

cd /scratch/rlk0015/Telag/Results_CompleteExonList/MapToExons/WorkingDirectory

while read i;
do
samtools depth "${i}"_sorted.bam > "${i}"_depth.txt
done<samList
ls | grep "_depth.txt" |cut -d "_" -f 1 | sort | uniq > depthList

while read i
do
for f in "$i"_depth.txt
do
sed -i "s/$/\t$i/" $f; done
done<depthList

cat *_depth.txt > CompleteExons_depth.txt
for f in CompleteExons_depth.txt
do
sed -i "s/$/\tCompleteExons/" $f; done
