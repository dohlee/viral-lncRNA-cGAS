# viral-lncRNA-cGAS

This repository provides analysis codes and bioinformatics pipelines for article entitled "Viral long non-coding RNA sequestrates cGAS from HCMV DNA for immune evasion".

## Analysis codes and bioinformatics pipelines

This repository is organized into several directories:

**rna-seq-processing**

*Related to Fig. 1b, 1c and 1d*

This directory contains the pipeline for processing and quantifying gene expression levels from RNA-seq data. Given raw total RNA-seq data, sequencing reads were preprocessed with `trim-galore` and aligned to hg38 reference genome with `STAR`. RNA expression levels were quantified using `RSEM` with reference built from GENCODE v32 release.

**deg-analysis**

*Related to Fig. 1b, 1c and 1d*

This directory contains R scripts and an analysis notebook for differentially expressed genes (DEG) analysis. DEGs were identified using `DEseq2`. Functional enrichment analyses were conducted using `Enrichr` module in python library `gseapy`.