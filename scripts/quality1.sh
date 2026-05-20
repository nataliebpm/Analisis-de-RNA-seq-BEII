#!/bin/bash
#SBATCH --job-name=quality1
#SBATCH --output=quality1.log
#SBATCH --error=quality1.error
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=8G
#SBATCH --time=120:00:00

#Cargar modulo
module load fastqc/0.11.3

#Intrucciones

############# Iniciando proceso #################

for file in /mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/data/raw/*.fastq.gz; do fastqc $file -o /mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/quality1; done

################## fin del proceso ############
