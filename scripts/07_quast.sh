#!/bin/bash

# Activate your conda environment for quast
source ~/miniconda3/etc/profile.d/conda.sh
conda activate quast
# List of raw accessions to input and define output directory
INPUTDIR=("results/assembly")
OUTDIR=("results/quast")
sra_id=$(head -n 1 data/accession.txt)
# Create output  directory
mkdir -p $OUTDIR
# Run quast on contigs.fasta
echo "Running quast ..."
  quast.py $INPUTDIR/contigs.fasta -o $OUTDIR/
echo "assembly assesment for $sra_id complete check $OUTDIR!"

