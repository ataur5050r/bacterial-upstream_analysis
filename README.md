# 🧬 Bacterial Upstream Analysis

A complete workflow for preparing bacterial whole genome sequencing (WGS) data for downstream analysis. This pipeline provides a step-by-step guideline — from downloading raw reads to functional annotation — using popular and conda-installable bioinformatics tools.

---

## 📁 Project Structure

All scripts should be run from the **base directory**:  
`/bacterial_upstream_analysis`

## 🛠️ Tools & Conda Environments

Each step requires a separate conda environment with the listed tool(s) installed using the **Bioconda** channel:

| Step                         | Tool(s)                                                     | Conda Env Name    |
|------------------------------|-------------------------------------------------------------|-------------------|
| Download raw reads           | `sra-tools`                                                 | `ncbi-sra`        |
| Quality control              | `fastqc`                                                    | `fastqc`          |
| Trimming                     | `trimmomatic`                                               | `trimmomatic`     |
| QC summary                   | `multiqc`                                                   | `multiqc`         |
| Mapping and variant calling  | `bwa`,`samtools`,`freebayes` ,`tabix`, `bcftools`,`bwa-sam` | `bwa-sam`         |
| Assembly                     | `spades`                                                    | `spades`          |
| Assembly evaluation          | `quast`                                                     | `quast`           |
| Annotation                   | `prokka`                                                    | `prokka`          |


---

### 🛠️ Setup Conda Environments

Create separate environments for each step/tool by running:

```bash
conda env create -f envs/ncbi-sra.yml
conda env create -f envs/fastqc.yml
conda env create -f envs/multiqc.yml
conda env create -f envs/trimmomatic.yml
conda env create -f envs/spades.yml
conda env create -f envs/quast.yml
conda env create -f envs/prokka.yml
conda env create -f envs/mapping.yml```

### 
To run:
```bash
./scripts/script_name.sh
```

---

## 🔗 Data Input

- **SRA Accessions** should be listed in:  
  `data/accession.txt`
- **Reference Genome** should be put in 
   `data/reference/`
   and should be renamed as **reference.fasta**
 
  

---

## ▶️ Script Execution 

Run the scripts in the following recommended order:

1. `00_download_sra.sh` – Download raw reads from Sequence Read Archive
2. `01_fastqc.sh` – Run quality control on raw reads
3. `02_multiqc.sh` – Summarize QC reports
4. `03_trimmomatic.sh` – Trim low-quality reads
5. `04_mapping.sh` – Map reads to reference genome
6. `05_variant_calling.sh` – Call variants against the reference genome
7. `06_assembly.sh` – Perform de-novo genome assembly
8. `07_quast.sh` – Evaluate the assembly
9. `08_prokka.sh` – Annotate the genome

---

## 💾 Access to Large Data Files

Due to GitHub's file size limits, raw FASTQ files, trimmed reads, and mapping output files (e.g., `.fastq`, `.bam`, `.sam`) are hosted on Google Drive.

👉 [Click here to access the files on Google Drive](https://drive.google.com/drive/folders/1SdJ1NSl9IxYnljLDFXzUNTZPxfkYiKsT?usp=drive_link)

---



