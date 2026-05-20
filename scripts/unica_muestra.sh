#!/bin/bash
#SBATCH --job-name=quality1_674
#SBATCH --output=quality1_674.log
#SBATCH --error=quality1_674.error
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=8G
#SBATCH --time=120:00:00

# Cargar módulo
module load fastqc/0.11.3

############# Iniciando proceso #################

fastqc /mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/data/raw/SRR27790674_1.fastq.gz \
       -o /mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/quality1/ \
       -t 8

################## fin del proceso ############
