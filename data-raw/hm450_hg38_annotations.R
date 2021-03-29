## Code to prepare 'hm450_hg38_annotations' dataset:

## Annotations come from:
## Zhou W, Laird PW and Shen H, Comprehensive characterization, annotation and innovative
## use of Infinium DNA Methylation BeadChip probes, Nucleic Acids Research 2017
## http://zwdzwd.github.io/InfiniumAnnotation
## File listed under: Plain Text Files (tab-delimited) -
## Basic hg38 annotation with suggested overall masking (MASK_general column) - HM450

## Set the file location for the hg38 manifest online:
file_url <- 'https://zwdzwd.s3.amazonaws.com/InfiniumAnnotation/20180909/HM450/HM450.hg38.manifest.tsv.gz'

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

## Get the true locations of the probes (initial columns represent 3 bases):
## Two key pieces of info to find CpG location: Probe type and probe
## "strand".
hm450_hg38_annotations$CpG_beg_TRUE <- as.integer(
  ifelse(
    hm450_hg38_annotations$probe_strand=='+',
    ifelse(
      hm450_hg38_annotations$designType=='I',
      hm450_hg38_annotations$probeEnd-1,
      hm450_hg38_annotations$probeEnd
    ),
    ifelse(
      hm450_hg38_annotations$designType=='I',
      hm450_hg38_annotations$probeBeg,
      hm450_hg38_annotations$probeBeg-1
    )
  )
)

hm450_hg38_annotations$CpG_end_TRUE <- as.integer(
  ifelse(
    hm450_hg38_annotations$probe_strand=='+',
    ifelse(
      hm450_hg38_annotations$designType=='I',
      hm450_hg38_annotations$probeEnd,
      hm450_hg38_annotations$probeEnd+1
    ),
    ifelse(
      hm450_hg38_annotations$designType=='I',
      hm450_hg38_annotations$probeBeg+1,
      hm450_hg38_annotations$probeBeg
    )
  )
)

## Move the new colunmns up in the order:
hm450_hg38_annotations <- hm450_hg38_annotations[
  ,
  c(
    1:3,
    c(ncol(hm450_hg38_annotations)-1,ncol(hm450_hg38_annotations)),
    c(4:(ncol(hm450_hg38_annotations)-2))
  )
]

## Clear workspace:
rm(file_url)
rm(manifest_file_location)

## Prepare the dataset:
usethis::use_data(hm450_hg38_annotations, overwrite = T)

