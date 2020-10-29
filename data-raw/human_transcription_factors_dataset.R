## Code to prepare 'human_transcription_factors_dataset' object:

## Annotations come from:
## Lambert SA, Jolma A, Campitelli LF, Das PK, Yin Y, Albu M, Chen X, Taipale J, Hughes TR, Weirauch MT.(2018)
## The Human Transcription Factors. Cell. 172(4):650-665. doi: 10.1016/j.cell.2018.01.029. Review.
## http://humantfs.ccbr.utoronto.ca/download.php
## File listed under: Current lists of human TFs and their motifs (v1.01) -
## 1. Human TFs - Full Database

## Get url for the manifest file:
tf_file_url <- 'http://humantfs.ccbr.utoronto.ca/download/v_1.01/DatabaseExtract_v_1.01.txt'

## Read in the file directly from the url:
human_transcription_factors_dataset <- read.delim(
  tf_file_url,
  stringsAsFactors = FALSE
)

## Remove the first column of numbered rows:
human_transcription_factors_dataset$X <- NULL

## Remove the url to clear the environment:
rm(tf_file_url)

## Prepare the dataset:
usethis::use_data(human_transcription_factors_dataset, overwrite = T)

