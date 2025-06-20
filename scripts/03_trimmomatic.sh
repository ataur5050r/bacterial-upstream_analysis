#!/bin/bash

# Activate your conda environment for trimmomatic
source ~/miniconda3/etc/profile.d/conda.sh
conda activate trimmomatic

# Create trimmed sequence directory
INDIR="data/raw_reads"
OUTDIR="results/trimming"
mkdir -p $OUTDIR

# Define input-output paths and sample name
sra_id=$(head -n 1 data/accession.txt)
read_f_in="$INDIR/${sra_id}_1.fastq"
read_r_in="$INDIR/${sra_id}_2.fastq"
read_f_paired_out="$OUTDIR/${sra_id}_1_paired.fastq"
read_f_unpaired_out="$OUTDIR/${sra_id}_1_unpaired.fastq"
read_r_paired_out="$OUTDIR/${sra_id}_2_paired.fastq"
read_r_unpaired_out="$OUTDIR/${sra_id}_2_unpaired.fastq"

# Run trimmomatic on forward and reverse raw_reads
echo "Running trimmomatic ..."
trimmomatic PE -threads 4 \
  $read_f_in $read_r_in \
  $read_f_paired_out $read_f_unpaired_out \
  $read_r_paired_out $read_r_unpaired_out \
  LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:50

echo "trimming complete!"

