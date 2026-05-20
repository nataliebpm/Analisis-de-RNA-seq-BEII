#!/bin/bash

#SBATCH --job-name=trimmed_qc2
#SBATCH --output=/mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/script/out_logs/qc2_%j.out
#SBATCH --error=/mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/script/out_logs/qc2_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=8G
#SBATCH --time=120:00:00

## --- Analisis de Fastqc ---
# 1. Cargar el módulo de fastqc
module load fastqc/0.11.3

# 2. Correr el analisis
for file in /mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/data/processed/TRIM_results/*.fq.gz; do 
  fastqc $file -o /mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/quality2; 
  done

# ---- Analisis de multiqc ---
# 1. Cargar el módulo de Anaconda
module load anaconda3/2025.06

# 2. Activar el ambiente específico dentro de Anaconda
source activate multiqc-1.5
cd /mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/quality2

# 3. Ejecutar el comando dentro del ambiente
multiqc .
