#!/bin/bash

# Activate your conda environment for spades
source ~/miniconda3/etc/profile.d/conda.sh
conda activate spades
# List of raw accessions to input and define output directory
INDIR=("results/trimming")
OUTDIR=("results/assembly")
sra_id=$(head -n 1 data/accession.txt)
# Create output  directory
mkdir -p $OUTDIR
# Run SPAdes with paired reads only
echo "Running spades ..."
  spades.py \
    -1 $INDIR/${sra_id}_1_paired.fastq \
    -2 $INDIR/${sra_id}_2_paired.fastq \
    -o ${OUTDIR} \
    --memory 4 \
    --only-assembler \
    --isolate \
    -k 21,33,55,77
echo "assembly for $sra_id complete check $OUTDIR!"

