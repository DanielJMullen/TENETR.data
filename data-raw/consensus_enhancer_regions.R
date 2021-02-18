## Code to prepare `consensus_enhancer_regions` dataset goes here:

## Requires GenomicRanges:

## Get paths to all the .bed.gz files in the folder containing
## hg38 liftover files for chromHMM annotations from:
## https://egg2.wustl.edu/roadmap/data/byFileType/chromhmmSegmentations/ChmmModels/core_K27ac/jointModel/final/bed_hg38_lifted_over/

## Download each of the chromHMM bed files:

## Define the url containing files of interest (and others not wanted)
file_url <- 'https://egg2.wustl.edu/roadmap/data/byFileType/chromhmmSegmentations/ChmmModels/core_K27ac/jointModel/final/bed_hg38_lifted_over/'

## Read lines from the file
read_lines <- readLines(file_url)

## Get the files containing the annotations we want
read_lines_mnemonics <- grep('mnemonics', read_lines, value =TRUE)

## Extract the file name from the html script for mnemonics files with hg38 liftover:
read_lines_mnemonics_B <- sub(".*href=\"", "", read_lines_mnemonics)

read_lines_mnemonics_AB <- sub('\">.*', '', read_lines_mnemonics_B)

## Create complete urls to each of the mnemonics files with hg38 liftover:
mnemonics_urls <- paste(
  file_url,
  read_lines_mnemonics_AB,
  sep=''
)

## Create a directory to download the files:
destination_file <- './data-raw/chromhmm_mnemonics_files/'

dir.create(destination_file)

## Set the types of chromHMM annotations we are interested in:
## For enhancers this is the 4 strong enhancer types listed below:
## See https://egg2.wustl.edu/roadmap/web_portal/chr_state_learning.html
chromHMM_of_interest <- c(
  '7_EnhG1',
  '8_EnhG2',
  '9_EnhA1',
  '10_EnhA2'
)

## Assemble a data frame of peaks of interest:
for(i in mnemonics_urls){

  if(!exists("enhancer_peaks_df")){

    ## Get the name of where the file will be downloaded to:
    downloaded_mnemonic_file <- paste(
      destination_file,
      basename(i),
      sep=''
    )

    ## Download the mnemonics chromhmm file:
    if(!file.exists(downloaded_mnemonic_file)){

      download.file(
        i,
        downloaded_mnemonic_file
      )

    }

    ## If the enhancer peak file hasn't been created yet,
    ## load the first bed file:
    raw_bed_df <- read.delim(
      downloaded_mnemonic_file,
      header= FALSE,
      stringsAsFactors = FALSE
    )

    ## Set file start to be 1 indexed instead of 0:
    raw_bed_df$V2 <- raw_bed_df$V2+1

    ## Get just the regions that correspond to the annotations
    ## of interest and save them to enhancer_peak_df:
    enhancer_peaks_df <- raw_bed_df[
      raw_bed_df$V4 %in% chromHMM_of_interest,
      ]

  } else if(exists("enhancer_peaks_df")){

    ## Get the name of where the file will be downloaded to:
    downloaded_mnemonic_file <- paste(
      destination_file,
      basename(i),
      sep=''
    )

    ## Download the mnemonics chromhmm file:
    if(!file.exists(downloaded_mnemonic_file)){

      download.file(
        i,
        downloaded_mnemonic_file
      )

    }

    ## If the enhancer peak file hasn't been created yet,
    ## load the first bed file:
    raw_bed_df <- read.delim(
      downloaded_mnemonic_file,
      header= FALSE,
      stringsAsFactors = FALSE
    )

    ## Set file start to be 1 indexed instead of 0:
    raw_bed_df$V2 <- raw_bed_df$V2+1

    ## Get just the regions that correspond to the annotations
    ## of interest:
    regions_of_interest_bed_df <- raw_bed_df[
      raw_bed_df$V4 %in% chromHMM_of_interest,
      ]

    ## Combine those regions with the existing enhancer
    ## bed file:
    enhancer_peaks_df <- rbind(
      enhancer_peaks_df,
      regions_of_interest_bed_df
    )
  }
}

## Remove the column with the enhancer info from the final file:
enhancer_peaks_df$V4 <- NULL

## Remove unnecessary datasets:
rm(
  raw_bed_df,
  regions_of_interest_bed_df,
  i,
  destination_file,
  downloaded_mnemonic_file,
  file_url,
  mnemonics_urls,
  read_lines,
  read_lines_mnemonics,
  read_lines_mnemonics_B,
  read_lines_mnemonics_AB
)

## Get paths to all the .bed files in the folder containing eRNA data
## from all human cell lines and organs from
## http://enhancer.binf.ku.dk/presets/

## List the url containing the zipped directory with the eRNA datasets:
eRNA_file_url <- "http://enhancer.binf.ku.dk/presets/facet_expressed_enhancers.tgz"

## List the zipped directory where it will be located in data-raw:
eRNA_file_location <- paste(
  './data-raw/',
  basename(eRNA_file_url),
  sep=''
)

## List the unzipped directory where the files will be untarred to in data-raw:
eRNA_file_location_untar <- paste(
  './data-raw/',
  sub(
    '\\..*',
    '',
    x= basename(eRNA_file_location)
  ),
  sep=''
)

## Download the file to the data-raw folder:
if(!file.exists(eRNA_file_location_untar)){

  download.file(
    eRNA_file_url,
    eRNA_file_location
  )

}

## Untar the eRNA file directory:
untar(
  eRNA_file_location,
  exdir= eRNA_file_location_untar
)

## Remove the old .tgz file that was downloaded:
unlink(eRNA_file_location)

## List the paths to each of the
eRNA_bed_file_paths <- list.files(
  path=eRNA_file_location_untar,
  pattern= "bed$",
  full.names= TRUE
)

## Assemble a data frame of peaks of interest:
for(i in eRNA_bed_file_paths){

  ## If a dataframe of the eRNA enhancer peaks hasn't been created:
  if(!exists("eRNA_enhancer_peaks_df")){

    ## Load the eRNA bed file:
    raw_bed_df <- read.delim(
      i,
      header= FALSE,
      stringsAsFactors = FALSE
    )

    ## Get just the chromosome, start, and end columns
    columns_of_interest_bed_df <- raw_bed_df[
      ,
      c(1:3)
      ]

    ## Set start to be 1 indexed:
    columns_of_interest_bed_df$V2 <- columns_of_interest_bed_df$V2+1

    ## Set this file to be the eRNA_enhancer_peaks_df:
    eRNA_enhancer_peaks_df <- columns_of_interest_bed_df

  ## If the dataset does already exist, add the new files to it:
  } else if(exists("enhancer_peaks_df")){

    ## Load the eRNA bed file:
    raw_bed_df <- read.delim(
      i,
      header= FALSE,
      stringsAsFactors = FALSE
    )

    ## Get just the chromosome, start, and end columns
    columns_of_interest_bed_df <- raw_bed_df[
      ,
      c(1:3)
    ]

    ## Set start to be 1 indexed:
    columns_of_interest_bed_df$V2 <- columns_of_interest_bed_df$V2+1

    ## Bind these columns to the existing dataset:
    eRNA_enhancer_peaks_df <- rbind(
      eRNA_enhancer_peaks_df,
      columns_of_interest_bed_df
    )
  }
}

## Set the column naes of the new eRNA dataframe:
colnames(eRNA_enhancer_peaks_df) <- c(
  'chromosome',
  'start',
  'end'
)

## Convert the eRNA dataframe into a granges object:
eRNA_enhancer_peaks_granges <- GenomicRanges::makeGRangesFromDataFrame(
  df= eRNA_enhancer_peaks_df,
  keep.extra.columns = FALSE,
  starts.in.df.are.0based = FALSE
)

## Download the hg19 to hg38 chain:
download.file(
  "http://hgdownload.cse.ucsc.edu/goldenpath/hg19/liftOver/hg19ToHg38.over.chain.gz",
  "./data-raw/hg19.hg38.chain.gz"
)

## Uncompress the chain file:
R.utils::gunzip("./data-raw/hg19.hg38.chain.gz")

## Import the chain file:
chain <- rtracklayer::import.chain("./data-raw/hg19.hg38.chain")

## Perform the liftover of the open chromatin peaks to hg38:
eRNA_enhancer_peaks_granges_hg38 <- rtracklayer::liftOver(
  eRNA_enhancer_peaks_granges,
  chain
)

## Convert the granges list object to a normal granges object:
eRNA_enhancer_peaks_granges_hg38_granges <- unlist(eRNA_enhancer_peaks_granges_hg38)

## Convert the liftover granges back into a dataframe:
eRNA_enhancer_peaks_df <- data.frame(
  'chromosome'= as.character(
    GenomicRanges::seqnames(eRNA_enhancer_peaks_granges_hg38_granges)
  ),
  'start'= GenomicRanges::start(eRNA_enhancer_peaks_granges_hg38_granges),
  'end'= GenomicRanges::end(eRNA_enhancer_peaks_granges_hg38_granges),
  'strand'= GenomicRanges::strand(eRNA_enhancer_peaks_granges_hg38_granges),
  stringsAsFactors = FALSE
)

## Combine the eRNA enhancer peaks with the previous enhancer peak dataset:
enhancer_peaks_df <- rbind(
  enhancer_peaks_df,
  eRNA_enhancer_peaks_df
)

## Add a dummy strand column with values equal to
## '*'
enhancer_peaks_df$V4 <- rep(
  '*',
  nrow(enhancer_peaks_df)
)

## Rename the columns in the enhancer peaks file:
colnames(enhancer_peaks_df) <- c(
  'chr',
  'start',
  'end',
  'strand'
)

## Convert the enhancer dataset loaded from the chromHMM .beds
## into a GenomicRagnes object:
enhancer_peaks_granges <- GenomicRanges::makeGRangesFromDataFrame(
  df= enhancer_peaks_df,
  keep.extra.columns = FALSE,
  starts.in.df.are.0based = FALSE
)

## Reduce the enhancer peak granges:
consensus_enhancer_regions <- GenomicRanges::reduce(enhancer_peaks_granges)

## Convert back into a data frame:
consensus_enhancer_regions <- data.frame(
  'chromosome'= as.character(
    GenomicRanges::seqnames(consensus_enhancer_regions)
  ),
  'start'= GenomicRanges::start(consensus_enhancer_regions),
  'end'= GenomicRanges::end(consensus_enhancer_regions),
  'strand'= GenomicRanges::strand(consensus_enhancer_regions),
  stringsAsFactors = FALSE
)

## Remove unnecessary datasets:
rm(
  list=setdiff(
    ls(),
    "consensus_enhancer_regions"
  )
)

## Prepare the dataset:
usethis::use_data(consensus_enhancer_regions, overwrite = T)
