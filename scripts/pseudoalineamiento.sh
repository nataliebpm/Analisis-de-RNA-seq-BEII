#!/bin/bash
#SBATCH --job-name=pseudoalineamiento
#SBATCH --output=pseudoalineamiento.log
#SBATCH --error=pseudoalineamiento.error
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=8G
#SBATCH --time=120:00:00

# cargar modulo
module load kallisto/0.45.0

# rutas
index="/mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/kallisto_quant/transcripts.idx"
input="/mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/data/processed/TRIM_results"
output="/mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/kallisto_quant/pseudoalineamiento"

for file in ${input}/*_1_trimmed.fq.gz
do
  base=$(basename "$file" _1_trimmed.fq.gz)
  file_1="${input}/${base}_1_trimmed.fq.gz"
  file_2="${input}/${base}_2_trimmed.fq.gz"

  kallisto quant --index "$index" \
                 --output-dir "${output}/${base}" \
                 --threads 8 "$file_1" "$file_2"
done
