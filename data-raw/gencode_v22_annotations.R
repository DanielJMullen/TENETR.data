## Code to prepare 'gencode_v22_annotations' dataset:

## Requires rtracklayer for this script to run:
## rtracklayer is not necessary for end user:

## Load in the information from the gencode release 22 gtf (GRCh38.p2)
## Downloaded from: https://www.gencodegenes.org/human/release_22.html
## Selecting the gtf file for 'Comprehensive gene annotation':

## Get url for the gtf file:
file_url <- 'ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_22/gencode.v22.annotation.gtf.gz'

## Define location of the gtf file in the data-raw folder:
gtf_file_location <- paste(
  './data-raw/',
  basename(file_url),
  sep=''
)

## If the gtf file has not already been downloaded, download it:
if(!file.exists(gtf_file_location)){

  download.file(
    file_url,
    gtf_file_location
  )

}

gtf <- rtracklayer::import(gtf_file_location)

## Transform into a data frame:
gencode_v22_annotations <- as.data.frame(gtf)

## Clear the workspace:
rm(gtf)
rm(file_url)
rm(gtf_file_location)

## Let's convert the factors into characters:
gencode_v22_annotations$seqnames <- as.character(gencode_v22_annotations$seqnames)
gencode_v22_annotations$strand <- as.character(gencode_v22_annotations$strand)
gencode_v22_annotations$source <- as.character(gencode_v22_annotations$source)
gencode_v22_annotations$type <- as.character(gencode_v22_annotations$type)
gencode_v22_annotations$score <- as.character(gencode_v22_annotations$score)

## Prepare the dataset:
usethis::use_data(gencode_v22_annotations, overwrite = T)
