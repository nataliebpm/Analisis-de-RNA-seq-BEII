#!/bin/bash
#SBATCH --job-name=download_rawdata
#SBATCH --output=download_rawdata.log
#SBATCH --error=download_rawdata.error
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --mem=32G
#SBATCH --time=120:00:00

cd /mnt/data/bioinfo-estadistica-2/RNAseq_2026/equipos/Equipo1/data/raw

wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR277/071/SRR27790671/SRR27790671_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR277/072/SRR27790672/SRR27790672_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR277/077/SRR27790677/SRR27790677_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR277/074/SRR27790674/SRR27790674_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR277/070/SRR27790670/SRR27790670_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR277/076/SRR27790676/SRR27790676_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR277/074/SRR27790674/SRR27790674_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR277/076/SRR27790676/SRR27790676_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR277/070/SRR27790670/SRR27790670_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR277/075/SRR27790675/SRR27790675_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR277/072/SRR27790672/SRR27790672_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR277/073/SRR27790673/SRR27790673_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR277/077/SRR27790677/SRR27790677_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR277/071/SRR27790671/SRR27790671_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR277/073/SRR27790673/SRR27790673_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR277/075/SRR27790675/SRR27790675_2.fastq.gz

 

