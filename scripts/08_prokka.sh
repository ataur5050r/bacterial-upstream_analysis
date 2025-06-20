#!/bin/bash

# Activate your conda environment for Prokka
source ~/miniconda3/etc/profile.d/conda.sh
conda activate prokka

# Define input/output directories
INPUTDIR="results/assembly"
OUTDIR="results/annotation"

# Get the first SRA ID
sra_id=$(head -n 1 data/accession.txt)

# Create output directory
mkdir -p "$OUTDIR"

# Run Prokka
echo "Prokka running..."
prokka --outdir "$OUTDIR/$sra_id" \
       --prefix "$sra_id" \
       --cpus 4 \
       "$INPUTDIR/contigs.fasta"

echo "Annotation for $sra_id complete. Check $OUTDIR/$sra_id!"

