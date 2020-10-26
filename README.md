# TENETR.data package
### Contains data objects for TENET R package (under construction)

#### Last updated: 10/26/2020

## Citation
Mullen DJ et al. TENET 2.0: identification of key transcriptional regulators and enhancers in lung adenocarcinoma. Plos Genetics 2020 16(9): e1009023. https://doi.org/10.1371/journal.pgen.1009023

Rhie SK et al. Identification of activated enhancers and linked transcription factors in breast, prostate, and kidney tumors by tracing enhancer networks using epigenetic traits. Epigenetics Chromatin 2016 Nov 9;9:50. PMID: 27833659

## 1. TENETR.data Installation

##### Installation is best performed using devtools R package (https://www.r-project.org/nosvn/pandoc/devtools.html)

```diff
if (!require("ggplot2", quietly = TRUE)){
  install.packages('ggplot2')
}

devtools::install_github('DanielJMullen/TENETR.data')

```

Note: Installation of TENETR.data can up to a few minutes to install
