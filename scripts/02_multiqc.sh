#!/bin/bash

# Activate your conda environment for MultiQC
source ~/miniconda3/etc/profile.d/conda.sh
conda activate multiqc

# Create QC report directory
INDIR="results/qc/"
OUTDIR="results/multiqc/"
mkdir -p $OUTDIR

# Run MultiQC on fastqc report files in raw_reads
echo "Running MultiQC on FastQC reports..."
multiqc $INDIR -o $OUTDIR
echo "MultiQC analysis complete!"

