## Code to prepare 'consensus_open_chromatin_regions' dataset goes here:

## Requires GenomicRanges, rtracklayer,

## First, aquire the bed file for the hg19
## DNaseI Hypersensitive Site Master List (125 cell types) from ENCODE/Analysis

## Read in the URL of interest:
file_url <- 'http://hgdownload.soe.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeAwgDnaseMasterSites/wgEncodeAwgDnaseMasterSites.bed.gz'

## Interpret the url:
gzcon_url <- gzcon(
  url(
    file_url
  )
)

## Pull text from the file:
txt <- readLines(gzcon_url)

## Load the text as a data frame:
consensus_open_chromatin_df <- read.table(
  textConnection(txt),
  sep='\t',
  header= FALSE,
  stringsAsFactors = FALSE,
  skipNul = TRUE,
  fill= TRUE
)

## Get only the first three columns of info:
consensus_open_chromatin_df_final <- consensus_open_chromatin_df[c(1:3)]

## Add a dummy strand column with only astrisks:
consensus_open_chromatin_df_final$strand <- rep(
  '*',
  nrow(consensus_open_chromatin_df_final)
)

## Change the column names:
colnames(consensus_open_chromatin_df_final) <- c(
  'chromosome',
  'start',
  'end',
  'strand'
)

## Convert the dataframe into a granges object:
consensus_open_chromatin_granges <- GenomicRanges::makeGRangesFromDataFrame(
  df= consensus_open_chromatin_df_final,
  keep.extra.columns = FALSE,
  starts.in.df.are.0based = TRUE
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
hg38_consensus_open_chromatin_granges <- rtracklayer::liftOver(
  consensus_open_chromatin_granges,
  chain
)

## Convert the granges list object to a normal granges object:
hg38_consensus_open_chromatin_granges <- unlist(hg38_consensus_open_chromatin_granges)

## Convert the liftover granges back into a dataframe:
consensus_open_chromatin_regions <- data.frame(
  'chromosome'= as.character(
    GenomicRanges::seqnames(hg38_consensus_open_chromatin_granges)
  ),
  'start'= GenomicRanges::start(hg38_consensus_open_chromatin_granges),
  'end'= GenomicRanges::end(hg38_consensus_open_chromatin_granges),
  'strand'= GenomicRanges::strand(hg38_consensus_open_chromatin_granges),
  stringsAsFactors = FALSE
)

## Clear workspace:
rm(
  list=setdiff(
    ls(),
    "consensus_open_chromatin_regions"
  )
)

## Prepare the dataset:
usethis::use_data(consensus_open_chromatin_regions, overwrite = T)
