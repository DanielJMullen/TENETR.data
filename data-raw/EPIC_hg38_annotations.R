## Get url for the manifest file:
file_url <- 'https://zwdzwd.s3.amazonaws.com/InfiniumAnnotation/20180909/epic/epic.hg38.manifest.tsv.gz'

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
epic_hg38_annotations <- read.delim(
  manifest_file_location,
  stringsAsFactors = FALSE
)

## Redefine class of the probeEnd variable:
epic_hg38_annotations$probeEnd <- as.integer(epic_hg38_annotations$probeEnd)

## Get the true locations of the probes (initial columns represent 3 bases):
## Two key pieces of info to find CpG location: Probe type and probe
## "strand".
epic_hg38_annotations$CpG_beg_TRUE <- as.integer(
  ifelse(
    epic_hg38_annotations$probe_strand=='+',
    ifelse(
      epic_hg38_annotations$designType=='I',
      epic_hg38_annotations$probeEnd-1,
      epic_hg38_annotations$probeEnd
    ),
    ifelse(
      epic_hg38_annotations$designType=='I',
      epic_hg38_annotations$probeBeg,
      epic_hg38_annotations$probeBeg-1
    )
  )
)

epic_hg38_annotations$CpG_end_TRUE <- as.integer(
  ifelse(
    epic_hg38_annotations$probe_strand=='+',
    ifelse(
      epic_hg38_annotations$designType=='I',
      epic_hg38_annotations$probeEnd,
      epic_hg38_annotations$probeEnd+1
    ),
    ifelse(
      epic_hg38_annotations$designType=='I',
      epic_hg38_annotations$probeBeg+1,
      epic_hg38_annotations$probeBeg
    )
  )
)

## Move the new colunmns up in the order:
epic_hg38_annotations <- epic_hg38_annotations[
  ,
  c(
    1:3,
    c(ncol(epic_hg38_annotations)-1,ncol(epic_hg38_annotations)),
    c(4:(ncol(epic_hg38_annotations)-2))
  )
]

## Clear workspace:
rm(file_url)
rm(manifest_file_location)

## Prepare the dataset:
usethis::use_data(epic_hg38_annotations, overwrite = T)
