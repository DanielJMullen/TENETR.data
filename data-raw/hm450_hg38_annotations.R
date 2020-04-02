## Code to prepare 'hm450_hg38_annotations' dataset:

## Annotations come from:
## Zhou W, Laird PW and Shen H, Comprehensive characterization, annotation and innovative
## use of Infinium DNA Methylation BeadChip probes, Nucleic Acids Research 2017
## http://zwdzwd.github.io/InfiniumAnnotation
## File listed under: Plain Text Files (tab-delimited) -
## Basic hg38 annotation with suggested overall masking (MASK_general column) - hm450

## Get url for the manifest file:
file_url <- 'http://zwdzwd.io/InfiniumAnnotation/current/hm450/hm450.hg38.manifest.tsv.gz'

## Define location of the manifest file in the data-raw folder:
manifest_file_location <- paste(
  './data-raw/',
  basename(file_url),
  sep=''
)

## If the manifest file has not already been downloaded, download it:
if(!file.exists(manifest_file_location)){

  download.file(
    file_url,
    manifest_file_location
  )

}

## Load the annotation file:
hm450_hg38_annotations <- read.delim(
  manifest_file_location,
  stringsAsFactors = FALSE
)

## Redefine class of the probeEnd variable:
hm450_hg38_annotations$probeEnd <- as.integer(hm450_hg38_annotations$probeEnd)

## Set the start locations to be 1-indexed:
hm450_hg38_annotations$CpG_beg <- as.integer(hm450_hg38_annotations$CpG_beg+1)

## Clear workspace:
rm(file_url)
rm(manifest_file_location)

## Prepare the dataset:
usethis::use_data(hm450_hg38_annotations, overwrite = T)

