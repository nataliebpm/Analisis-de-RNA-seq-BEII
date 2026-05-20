#!/bin/bash
#SBATCH --job-name=quality2
#SBATCH --output=quality2.log
#SBATCH --error=quality2.error
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=8G
#SBATCH --time=120:00:00

# Cargar módulo
module load anaconda3/2025.06

# Activar el ambiente
source /cm/shared/apps/anaconda3/2025.06/etc/profile.d/conda.sh
conda activate multiqc-1.5

# Directorios
input="/mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/quality1"
output="/mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/quality2"

######## Inicio del analisis ###########

multiqc "$input" -o "$output"

####### Fin del analisis  ##############
