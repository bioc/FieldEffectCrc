\docType{data}
\name{cohort_B}
\alias{cohort-B}
\alias{cohortB}
\alias{cohort B from Dampier et al.}
\title{cohort B from Dampier et al.}

\description{
  Salmon-generated transcript-level abundance estimates
  summarized to gene level using \code{tximport} along with raw counts,
  gene lengths, and clinical annotations for 30 human primary
  colorectal tumors and matched normal tissue samples represented
  as a \code{SummarizedExperiment}. Abundance estimates derived from
  paired-end RNA-seq.
}

\format{
  A \code{SummarizedExperiment} object containing 3 \code{assays} of matrices, each
  37,361 rows x 30 columns. Each row is a gene and each column is a sample.

  The \code{SummarizedExperiment} object also includes a \code{colData}
  \code{S4Vectors::DFrame} object with 30 rows and 27 columns. Each row is a sample
  and each column is a field. The fields are described below.

  \itemize{
    \item {dirName}: name of directory into which raw data for sample was downloaded, serves as unique identifier
    \item {projId}: NCBI BioProject identifier for projects registered in the BioProject database, or common name of projects listed in other databases
    \item {subId}: subject identifier
    \item {sampId}: sample identifier
    \item {sampType}: sample type, which indicates the phenotype of the sample
    \item {dist_cm}: relative distance in centimeters from tumor from which given sample was obtained, NA for healthy samples and tumor-adjacent samples without measurements, 0 for tumor samples
    \item {sex}: reported sex of subject, NA for missing values
    \item {race}: reported ancestry of subject, NA for missing values
    \item {tStage}: stage of tumor associated with sample, NA for healthy samples and tumor or tumor-adjacent samples with missing values
    \item {ageAtDiagDays}: age in days at time of diagnosis (for subjects with tumors) or biopsy collection (for healthy subjects), NA for missing values
    \item {daysToDeath}: time in days from diagnosis to death for subjects with tumors, NA for survivors in TCGA data set and missing values in other data sets
    \item {sampSite}: anatomic subsite, where right refers to cecum and ascending, transverse refers to transverse, left refers to descending and sigmoid, rectum refers to rectum, NA for missing values
    \item {wt_kg}: subject weight in kilograms, NA for missing values
    \item {ht_cm}: subject height in centimeters, NA for missing values
    \item {rnaMethod}: method of enriching for mRNA during library preparation, either polyA for oligo(dT) selection or riboD for ribosomal depletion
    \item {rin}: RNA integrity number for sample, NA for missing values
    \item {format}: RNA sequencing read format, paired for paired-end, single for single-end
    \item {sequencer}: identifier of instrument used for sequencing, taken from FASTQ header, NA for missing values
    \item {platform}: name of Illumina instrument model used for sequencing
    \item {study}: name assigned to data set for purpose of identifying data source
    \item {percDup}: duplication level of reads on a single-end basis as measured by FastQC, presented as a percentage of total single-end reads per individual FASTQ file
    \item {percGc}: GC content as a percentage of all nucleotides sequenced as measured by FastQC
    \item {seqLen}: length in nucleotides of reads (for single-end) or fragments (for paired-end) for a given sample
    \item {rdProc}: number of reads processed by Salmon, where processed means an attempt at quasi-mapping was performed
    \item {rdMap}: number of reads quasi-mapped to the transcriptome by Salmon
    \item {percMap}: reads quasi-mapped to the transcriptome as a percentage of all reads processed
    \item {data}: abbreviated name of repository from which raw FASTQ files were downloaded, gdc means Genomic Data Commons, sradbg means Sequence Read Archive via dbGaP, srapub means Sequence Read Archive directly, bcuva means BarcUVa-Seq
  }
}

\source{See \code{inst/scripts/make-data.R} for full details on generating this dataset from source files.}

\references{Dampier, C.H., Devall, M., Jennelle, L.T., Diez-Obrero, V., Plummer, S.J., Moreno, V., Casey, G. (2020) Oncogenic features in histologically normal mucosa: novel insights into field effect from a mega-analysis of colorectal transcriptomes. Clinical and Translational Gastroenterology.}

\author{Chris Dampier}

\keyword{datasets}
