#' @title Multiple cell type consensus enhancer region dataset
#' @description A dataset containing consensus enhancer regions for numerous cell types. Based on chromHMM annotations and eRNA datasets.
#' @format A data frame with 393892 rows and 4 variables:
#' \describe{
#'   \item{\code{chromosome}}{character Chromosome location of peaks}
#'   \item{\code{start}}{integer 1-based start location of peaks}
#'   \item{\code{end}}{integer 1-based end location of peaks}
#'   \item{\code{strand}}{integer Placeholder for strand information} 
#'}
#' @source \url{https://egg2.wustl.edu/roadmap/data/byFileType/chromhmmSegmentations/ChmmModels/core_K27ac/jointModel/final/bed_hg38_lifted_over/ https://egg2.wustl.edu/roadmap/web_portal/chr_state_learning.html#exp_18state}
"consensus_enhancer_regions"
#' @title GENCODE v22 .gtf file
#' @description A dataset containing information for the GENCODE v22 (GRCh38.p2) .gtf file
#' @format A data frame with 2563671 rows and 27 variables:
#' \describe{
#'   \item{\code{seqnames}}{character Chromosome location of genes}
#'   \item{\code{start}}{integer 1-based start location of genes}
#'   \item{\code{end}}{integer 1-based end location of genes}
#'   \item{\code{width}}{integer Total width of the region}
#'   \item{\code{strand}}{character Strand the region is contained on}
#'   \item{\code{source}}{character Havana or Ensembl annotation}
#'   \item{\code{type}}{character type of construct defined by the region}
#'   \item{\code{score}}{character NA}
#'   \item{\code{phase}}{integer NA}
#'   \item{\code{gene_id}}{character ENSG# ID followed by a single digit after a period}
#'   \item{\code{gene_type}}{character COLUMN_DESCRIPTION}
#'   \item{\code{gene_status}}{character COLUMN_DESCRIPTION}
#'   \item{\code{gene_name}}{character COLUMN_DESCRIPTION}
#'   \item{\code{level}}{character COLUMN_DESCRIPTION}
#'   \item{\code{havana_gene}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transcript_id}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transcript_type}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transcript_status}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transcript_name}}{character COLUMN_DESCRIPTION}
#'   \item{\code{tag}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transcript_support_level}}{character COLUMN_DESCRIPTION}
#'   \item{\code{havana_transcript}}{character COLUMN_DESCRIPTION}
#'   \item{\code{exon_number}}{character COLUMN_DESCRIPTION}
#'   \item{\code{exon_id}}{character COLUMN_DESCRIPTION}
#'   \item{\code{ont}}{character COLUMN_DESCRIPTION}
#'   \item{\code{protein_id}}{character COLUMN_DESCRIPTION}
#'   \item{\code{ccdsid}}{character COLUMN_DESCRIPTION} 
#'}
#' @source \url{http://somewhere.important.com/}
"gencode_v22_annotations"
#' @title DATASET_TITLE
#' @description DATASET_DESCRIPTION
#' @format A data frame with 485577 rows and 57 variables:
#' \describe{
#'   \item{\code{CpG_chrm}}{character Chromosome location of probes}
#'   \item{\code{CpG_beg}}{integer 1-based start location of peaks}
#'   \item{\code{CpG_end}}{integer 1-based end location of peaks}
#'   \item{\code{probe_strand}}{character Strand the probe is contained on}
#'   \item{\code{probeID}}{character Name of the probe in form: 'cg########'}
#'   \item{\code{address_A}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{address_B}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{channel}}{character COLUMN_DESCRIPTION}
#'   \item{\code{designType}}{character COLUMN_DESCRIPTION}
#'   \item{\code{nextBase}}{character COLUMN_DESCRIPTION}
#'   \item{\code{nextBaseRef}}{character COLUMN_DESCRIPTION}
#'   \item{\code{probeType}}{character COLUMN_DESCRIPTION}
#'   \item{\code{orientation}}{character COLUMN_DESCRIPTION}
#'   \item{\code{probeCpGcnt}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{context35}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{probeBeg}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{probeEnd}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{ProbeSeq_A}}{character COLUMN_DESCRIPTION}
#'   \item{\code{ProbeSeq_B}}{character COLUMN_DESCRIPTION}
#'   \item{\code{gene}}{character COLUMN_DESCRIPTION}
#'   \item{\code{gene_HGNC}}{character COLUMN_DESCRIPTION}
#'   \item{\code{chrm_A}}{character COLUMN_DESCRIPTION}
#'   \item{\code{beg_A}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{flag_A}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{mapQ_A}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{cigar_A}}{character COLUMN_DESCRIPTION}
#'   \item{\code{NM_A}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{chrm_B}}{character COLUMN_DESCRIPTION}
#'   \item{\code{beg_B}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{flag_B}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{mapQ_B}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{cigar_B}}{character COLUMN_DESCRIPTION}
#'   \item{\code{NM_B}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{wDecoy_chrm_A}}{character COLUMN_DESCRIPTION}
#'   \item{\code{wDecoy_beg_A}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{wDecoy_flag_A}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{wDecoy_mapQ_A}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{wDecoy_cigar_A}}{character COLUMN_DESCRIPTION}
#'   \item{\code{wDecoy_NM_A}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{wDecoy_chrm_B}}{character COLUMN_DESCRIPTION}
#'   \item{\code{wDecoy_beg_B}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{wDecoy_flag_B}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{wDecoy_mapQ_B}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{wDecoy_cigar_B}}{character COLUMN_DESCRIPTION}
#'   \item{\code{wDecoy_NM_B}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{posMatch}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{MASK_mapping}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{MASK_typeINextBaseSwitch}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{MASK_rmsk15}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{MASK_sub40_copy}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{MASK_sub35_copy}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{MASK_sub30_copy}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{MASK_sub25_copy}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{MASK_snp5_common}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{MASK_snp5_GMAF1p}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{MASK_extBase}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{MASK_general}}{logical COLUMN_DESCRIPTION} 
#'}
#' @source \url{http://somewhere.important.com/}
"hm450_hg38_annotations"