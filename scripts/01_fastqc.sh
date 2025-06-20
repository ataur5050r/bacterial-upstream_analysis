#!/bin/bash

# Activate your conda environment for FastQC
source ~/miniconda3/etc/profile.d/conda.sh
conda activate fastqc

# Create QC report directory
mkdir -p results/qc/

# Run FastQC on FASTQ files in raw_reads
fastq_files=$(ls data/raw_reads/*.fastq)

echo "Running FastQC on raw reads..."

for fq in $fastq_files
do
    echo "Processing $fq ..."
    fastqc $fq -o results/qc/
done

echo "FastQC analysis complete!"

