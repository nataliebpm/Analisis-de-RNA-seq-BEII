#!/bin/bash
#SBATCH --job-name=reference
#SBATCH --output=reference.log
#SBATCH --error=reference.error
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=8G
#SBATCH --time=120:00:00

# Descargar genomas de referencia de ratón

####### Inicio de la descarga ########

output="/mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/reference"

mkdir -p "$output"

wget -P "$output" https://ftp.ensembl.org/pub/release-115/fasta/mus_musculus/cdna/Mus_musculus.GRCm39.cdna.all.fa.gz
wget -P "$output" https://ftp.ensembl.org/pub/release-115/fasta/mus_musculus/ncrna/Mus_musculus.GRCm39.ncrna.fa.gz

####### Fin de la descarga ######
