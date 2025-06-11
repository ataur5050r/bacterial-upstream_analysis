#!/bin/bash

# Activate your conda environment for MultiQC
source ~/miniconda3/etc/profile.d/conda.sh
conda activate multiqc

# Create QC report directory
mkdir -p results/combine_qc/

# Run MultiQC on fastqc report files in raw_reads
echo "Running MultiQC on FastQC reports..."
multiqc results/qc/ -o results/combine_qc/
echo "MultiQC analysis complete!"

