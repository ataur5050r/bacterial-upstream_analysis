#!/bin/bash
# Activate your conda environment for mapping sequence
source ~/miniconda3/etc/profile.d/conda.sh
conda activate bwa-sam
# define sra_id of your reads and outdir
SRA_ID=("SRR33893847")
OUTDIR="results/varient_calling"
#create a varient calling directory
mkdir -p results/varient_calling/
#copy and paste the reference grnome 
cp data/reference/reference.fasta $OUTDIR/
#index the reference genome
samtools faidx $OUTDIR/reference.fasta
#identify the variants in our test sample
freebayes -f $OUTDIR/reference.fasta results/mapping/${SRA_ID}.sorted.bam  > $OUTDIR/${SRA_ID}.vcf
# Compress and index the VCF
bgzip $OUTDIR/${SRA_ID}.vcf
tabix $OUTDIR/${SRA_ID}.vcf.gz

