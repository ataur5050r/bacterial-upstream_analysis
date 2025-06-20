#!/bin/bash
# Activate your conda environment for mapping sequence
source ~/miniconda3/etc/profile.d/conda.sh
conda activate bwa-sam
# define sra_id of your read
SRA_ID=$(head -n 1 data/accession.txt)
#define necessery path
REF="data/reference/reference.fasta"
READ_F="data/raw_reads/${SRA_ID}_1.fastq"
READ_R="data/raw_reads/${SRA_ID}_2.fastq"
OUTDIR="results/mapping/"
#create the output directory
mkdir $OUTDIR
#index the refrence sequence
bwa index $REF
# Generate .fai index file for the reference
samtools faidx $REF
#map the sample against reference
bwa mem $REF $READ_F $READ_R > $OUTDIR/${SRA_ID}.sam
#converting .sam to .bam
samtools view -@ 20 -S -b $OUTDIR/${SRA_ID}.sam > $OUTDIR/${SRA_ID}.bam
#sort the bam file upon map(consider ram )
samtools sort -@ 2 -m 500M -o $OUTDIR/${SRA_ID}.sorted.bam $OUTDIR/${SRA_ID}.bam
#index the sorted bam file
samtools index $OUTDIR/${SRA_ID}.sorted.bam
echo "mapping complete , check out - $OUTDIR/${SRA_ID}.sorted.bam"
