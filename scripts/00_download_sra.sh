#!/bin/bash

# Activate ncbi-sra conda environment

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ncbi-sra

# List of SRA accessions to download
mapfile -t ACCESSIONS < data/accession.txt

# Create output directory if it doesn't exist
mkdir -p data/raw_reads/

# Download raw reads with fasterq-dump and save in data/raw_reads/
for ACC in "${ACCESSIONS[@]}"
do
    echo "Downloading and converting $ACC ..."
    fasterq-dump --split-files $ACC -O data/raw_reads/
done

echo "All downloads completed!"

