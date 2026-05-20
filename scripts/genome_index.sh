#!/bin/bash
#SBATCH --job-name=index
#SBATCH --output=index.log
#SBATCH --error=index.error
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=8G
#SBATCH --time=120:00:00

# Cargar módulo
module load kallisto/0.45.0

# Entrada y salida
input="/mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/reference"
output="/mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/kallisto_quant"

mkdir -p "$output"

######## Inicio del análisis #######

kallisto index -i "$output/transcripts.idx" "$input/Mus_musculus.GRCm39.cdna.all.fa.gz"

##### Fin del análisis ###########
