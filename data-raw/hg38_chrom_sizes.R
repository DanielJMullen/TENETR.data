## Code to prepare 'hg38_chrom_sizes' dataset:

## Annotations come from:
## http://hgdownload.cse.ucsc.edu/goldenpath/hg38/bigZips/
## Specifically the hg38.chrom.sizes file

## Get url for the chrom sizes file:
chrom_sizes_url <- 'http://hgdownload.cse.ucsc.edu/goldenpath/hg38/bigZips/hg38.chrom.sizes'

## Define location of the chrom sizes file in the data-raw folder:
chrom_sizes_file_location <- paste(
  './data-raw/',
  basename(chrom_sizes_url),
  sep=''
)

## If the chrom sizes file has not already been downloaded, download it:
if(!file.exists(chrom_sizes_file_location)){

  download.file(
    chrom_sizes_url,
    chrom_sizes_file_location
  )

}

## Load the chrom sizes file:
hg38_chrom_sizes <- read.delim(
  chrom_sizes_file_location,
  header= FALSE,
  stringsAsFactors = FALSE
)

## Add column names to the file:
colnames(hg38_chrom_sizes) <- c(
  'chromosome',
  'size'
)

## Clear workspace:
rm(chrom_sizes_file_location)
rm(chrom_sizes_url)

## Prepare the dataset:
usethis::use_data(hg38_chrom_sizes, overwrite = T)
