## 🧬 Análisis de RNAseq: "Bulk mRNA-seq data from wild-type and prostate cancer-developing mice reveal a reprogramming of the estrogen and androgen responses after carcinogenesis"

---

### 👥 Equipo 1

| Nombre | Usuario GitHub |
|--------|:---------------:|
| Gutierrez Piñon Ernesto | [@egutierrez](https://github.com/usuario1) |
| Pineda Morán Natalie Berenice | [@npineda](https://github.com/nataliebpm) |
| Pinto Sanchez Alejandro | [@apinto](https://github.com/AlejandroPintoS) |
| Reyes Ramírez Mónica | [@mreyes](https://github.com/MonykRey) |

---

### 📋 Información del Curso

| Datos | Información |
|-------|:---------:|
| 📅 **Fecha** | 20 Mayo 2026 |
| 📚 **Materia** | Bioinformática y Estadística II |
| 🎓 **Semestre** | 4° Semestre |
| 🏫 **Institución** | *ENESJ Lic. Ciencias Genómicas* |

---


## Introducción

Este proyecto presenta un análisis de expresión diferencial de genes utilizando datos de RNA-seq, descargados de SRA y pertenecientes al artículo "Bulk mRNA-seq data from wild-type and prostate cancer-developing mice reveal a reprogramming of the estrogen and androgen responses after carcinogenesis". En este artículo se busca estudiar cómo las hormonas sexuales —andrógenos y estrógenos— modulan la expresión génica en la próstata normal y en la próstata tumoral, y entender los cambios transcriptómicos que ocurren tras la carcinogénesis, sin embargo para este proyecto se realizó el análisis diferencial de genes únicamente utilizando muestras de próstata en un estado normal. 

Se analizaron 4 réplicas biológicas de tejido de próstata de ratones para cada una de las siguientes condiciones: *próstata normal-estradiol vs. próstata normal-vehículo*, siendo en total 8 muestras analizadas. Estas muestras fueron obtenidas de tejido extraído de ratones de al menos 24 semanas de edad, castrados previamente para asegurar privación hormonal y fueron recolectadas 24 horas después de las inyecciones hormonales. 

| SRA Run ID | GSM ID | Condición | Tratamiento | Réplica | Tipo de lectura |
|---|---|---|---|---|---|
| SRR27790670 | GSM8047494 | Próstata normal | Estradiol | Tratamiento 1 | Paired-end |
| SRR27790671 | GSM8047493 | Próstata normal | Estradiol | Tratamiento 2 | Paired-end |
| SRR27790672 | GSM8047492 | Próstata normal | Estradiol | Tratamiento 3 | Paired-end |
| SRR27790673 | GSM8047491 | Próstata normal | Estradiol | Tratamiento 4 | Paired-end |
| SRR27790674 | GSM8047490 | Próstata normal | Vehículo (control) | Control 1 | Paired-end |
| SRR27790675 | GSM8047488 | Próstata normal | Vehículo (control) | Control 2 | Paired-end |
| SRR27790676 | GSM8047486 | Próstata normal | Vehículo (control) | Control 3 | Paired-end |
| SRR27790677 | GSM8047484 | Próstata normal | Vehículo (control) | Control 4 | Paired-end |

***Enlace al reporte renderizado***: 

---

## Pipeline

1. Script:`download_RNAdata.sh`

	- a) Descargar datos de NCBI en SRA, b) Descargar metadatos
	
	- Se descargaron los archivos de secuencia cruda FASTQ de las 8 muestras en el cluster utilizando la página de SRA del BioProject donde se almacenan los datos del artículo, se descargaron un total de 16 archivos de SRA ya que eran PE-reads. 

2. Script: `quality1.sh`

	- a) Análisis de control de calidad de datos crudos utilizando FASTQC

3. Script: `quality2.sh`

	- a) Análisis de control de calidad de datos crudos utilizando MultiQC
	
4. Script: `trimm_adapters.sh`

	- a) Eliminar adaptadores y realizar filtrado de los archivos crudos de SRA utilizando Trimmomatic (trimmomatic/0.33)
	
	- Durante este análisis se generaron 32 archivos FASTQ de las secuencias procesadas, ya que Trimmomatic genera 2 archivos procesados `(*_trimmed.fq.gz, *_unpaired.fq.gz)` por cada archivo FASTQ de secuencias crudas

5. Script: `qc2_trimmed.sh`

	- a) Análisis de control de calidad de secuencias filtradas utilizando FASTQC, b) Análisis de control de calidad utilizando MultiQC

6. Script: `reference.sh`

	- a) Descargar genomas de referencia de ratón (cdna, ncrna) de NCBI

7. Script: `genome_index.sh`

	- a) Indexar genoma de *Mus musculus* utilizando Kallisto (kallisto/0.45.0)

8. Script: `pseudoalineamiento.sh`

	- a) Realizar alineamiento de las secuencias utilizando Kallisto (kallisto/0.45.0)

9. Script: `RNA_seq_analisis.Rmd`

	- a) Carga de datos (tximport + anotación GTF), b) Normalización (rlog, z-score), c) Visualización exploratoria (PCA), d) Evaluación de batch effect, e) Expresión diferencial (DESeq2 + apeglm), f) Volcano Plot, g) Análisis funcional (gPRofiler)

### 📁 Estructura del Repositorio en GitHub

- `out_logs`: reportes de todos los out logs de los jobs de slurm utilizados para el análisis 

- `scripts`: jobs de slurm, incluyendo aquellos para la descarga de datos de SRA, descarga del genoma de referencia, análisis de FastQC y MultiQC, Trimming de datos, pseudoalineamiento y el archivo .Rmd sobre el análisis diferencial de genes. 

- `quality`: reporte de análisis de control de calidad (realizado con FastQC y MultiQC) sobre los 16 archivos de las secuencias crudas, y después del filtrado utilizando Trimmomatic. 

- `DEG_results`: contiene las matrices de conteos y los archivos de formato necesarios para el análisis de expresión diferencial de genes, así como los gráficos generados a partir de dicho análisis.

- `README.md` 

- `Final_Bioproject_Report`: Reporte renderizado en formato html


### 📁 Estructura del Repositorio en el Cluster

```
Equipo1/
├── script/
│   └── out_logs/
├── data/
│   ├── raw/
│   └── processed/
│       ├── TRIM_results/
│       └── UNPAIR_results/
├── quality1/
│   ├── fastQC_analysis/
│   └── multiQC_analysis/
│       └── multiqc_data/
├── quality2/
│   └── multiqc_data/
├── reference/
├── kallisto_quant/
│   └── pseudoalineamiento/
│       ├── SRR27790670/
│       ├── SRR27790671/
│       ├── SRR27790672/
│       ├── SRR27790673/
│       ├── SRR27790674/
│       ├── SRR27790675/
│       ├── SRR27790676/
│       └── SRR27790677/
├── DEG_results/
└── TRIM_results/
```

El repositorio principal comienza en el directorio de "Equipo1". 

Después se crearon diferentes repositorios de acuerdo a los análisis realizados: 

1. `script`: ejecutables `.sh` para realizar el análisis de FastQC, MultiQC, Trimming, pseudoalineamiento, descarga de datos de NCBI. Este directorio también incluye los archivos `.log` y `.err` de cada script, en el directorio `out_log`

2. `data/`: 

	- `raw/`: datos crudos descargados de la página de [SRA del Bioproject](https://www.ncbi.nlm.nih.gov/Traces/study/?acc=PRJNA1071175&o=acc_s%3Aa), se descargaron un total de 16 secuencias ya que eran formato PE

	- `processed/`: datos posteriores al Trimming, se obtuvieron un total de 32 secuencias `(*_trimmed.fq.gz, *_unpaired.fq.gz)`. 
		
		- `TRIM_results`: son las lecturas que pasaron el filtrado de calidad junto con su pareja. Ambas lecturas del par siguen juntas y sincronizadas. 

		- `UNPAIR_results`: son lecturas que pasaron el filtrado de calidad, pero cuya pareja fue descartada (por baja calidad o por quedar muy corta). 

3. `quality1/`: análisis de FastQC y MultiQC sobre las lecturas crudas

4. `quality2/`: análisis de FastQC y MultiQC sobre las lecturas procesadas por Trimmomatic

5. `reference/`: datos del genoma de referencia de ratón, descargados desde NCBI

6. `kallisto_quant/`:

	- `pseudoalineamiento/`: almacena los datos sobre cuantificación de transcritos y conteos en formato `.tsv` y `.h5`, y los metadatos del proceso (parámetros y reads procesadas) en formato `.json`

	- `transcripts.idx`: índice para hacer el pseudoalineamiento de cada muestra

7. `DEG_results`: 

8. `TRIM_results`: resultado de las lecturas que pasaron el filtrado de calidad junto con su pareja. Ambas lecturas del par siguen juntas y sincronizadas; este directorio contiene la misma información que el ubicado en `data/processed/` solo que se añadió a la estructura de directorios como uno independiente

## 📦 Requisitos y Dependencias

### Software

| Herramienta | Versión | Uso |
|-------------|---------|-----|
| FastQC | v.0.11.3 | Control de calidad |
| MultiQC | v.1.5 | Control de calidad
| Trimmomatic | v.0.33 | Trimming |
| Kallisto | v.0.45.0 | Pseudoalineamiento |
| R | - | Análisis estadístico |

### Módulos del cluster

```
module load fastqc/0.11.3
module load anaconda3/2025.06
  source activate multiqc-1.5
module load trimmomatic/0.33
module load kallisto/0.45.0
```

## 📚 Referencias

- Lafront, C., Germain, L., & Audet-Walsh, É. (2024). Bulk mRNA-seq data from wild-type and prostate cancer-developing mice reveal a reprogramming of the estrogen and androgen responses after carcinogenesis. *Data in Brief*, *57*, 110870. https://doi.org/10.1016/j.dib.2024.110870

- Ramírez-de-Arellano, A., Pereira-Suárez, A. L., Rico-Fuentes, C., López-Pulido, E. I., Villegas-Pineda, J. C., & Sierra-Diaz, E. (2022). Distribution and effects of estrogen receptors in prostate cancer: Associated molecular mechanisms. Frontiers in Endocrinology, 12, 811578. https://doi.org/10.3389/fendo.2021.811578

- Belluti, S., Imbriano, C., & Casarini, L. (2023). Nuclear estrogen receptors in prostate cancer: From genes to function. Cancers, 15(18), 4653. https://doi.org/10.3390/cancers15184653

- Richter, C. A., Taylor, J. A., Ruhlen, R. L., Welshons, W. V., & Vom Saal, F. S. (2007). Estradiol and bisphenol A stimulate androgen receptor and estrogen receptor gene expression in fetal mouse prostate mesenchyme cells. Environmental Health Perspectives, 115(6), 902–908. https://doi.org/10.1289/ehp.9804
