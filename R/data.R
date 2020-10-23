#' @title Consensus enhancer regions dataset
#' 
#' @description A dataset containing consensus enhancer regions for numerous cell types annotated to the hg38 human genome. Based on 18-state chromHMM annotations from 98 cell types and 112 eRNA datasets.
#' 
#' @docType data
#' 
#' @format A data frame with 406154 rows and 4 variables:
#' \describe{
#'   \item{\code{chromosome}}{character Chromosome location of peaks}
#'   \item{\code{start}}{integer 1-based start location of peaks}
#'   \item{\code{end}}{integer 1-based end location of peaks}
#'   \item{\code{strand}}{integer Placeholder for strand information} 
#'}
#' @source \url{https://egg2.wustl.edu/roadmap/web_portal/chr_state_learning.html http://enhancer.binf.ku.dk/presets/}
"consensus_enhancer_regions"
#' @title GENCODE v22 .gtf file
#' 
#' @description A dataset containing information for the GENCODE v22 (GRCh38.p2) .gtf file loaded using tracklayer's import function
#' 
#' @docType data
#' 
#' @format A data frame with 2563671 rows and 27 variables:
#' \describe{
#'   \item{\code{seqnames}}{character Chromosome location of genes}
#'   \item{\code{start}}{integer 1-based start location of genes}
#'   \item{\code{end}}{integer 1-based end location of genes}
#'   \item{\code{width}}{integer Total width of the region}
#'   \item{\code{strand}}{character Strand the region is contained on}
#'   \item{\code{source}}{character Name of the program that generated this feature, or the data source (HAVANA, ENSEMBL)}
#'   \item{\code{type}}{character Type of feature defined by the region (gene,transcript,exon,CDS,UTR,start_codon,stop_codon,Selenocysteine)}
#'   \item{\code{score}}{character Placeholder for score information (not used for this type of data)}
#'   \item{\code{phase}}{integer Genomic phase (for CDS features only)}
#'   \item{\code{gene_id}}{character Ensembl gene ID (ENSG########### followed by a single digit after a period indicating gene version number)}
#'   \item{\code{gene_type}}{character Gene biotype (see: https://www.gencodegenes.org/pages/biotypes.html)}
#'   \item{\code{gene_status}}{character Status of the gene (KNOWN, NOVEL, PUTATIVE)}
#'   \item{\code{gene_name}}{character Name of the gene}
#'   \item{\code{level}}{character Gene level for verification of the loci (1: verified loci, 2: manually annotated loci, 3: automatically annotated loci)}
#'   \item{\code{havana_gene}}{character Gene ID in the Havana database (OTTHUMGXXXXXXXXXXX.X)}
#'   \item{\code{transcript_id}}{character Ensembl transcript ID (ENST########### followed by a single digit after a period indicating transcript version number)}
#'   \item{\code{transcript_type}}{character Transcript biotype (see: https://www.gencodegenes.org/pages/biotypes.html)}
#'   \item{\code{transcript_status}}{character Status of the transcript (KNOWN, NOVEL, PUTATIVE)}
#'   \item{\code{transcript_name}}{character Name of the transcript (Gene name with number of transcript appended)}
#'   \item{\code{tag}}{character Notes special elements of interest(see: https://www.gencodegenes.org/pages/tags.html)}
#'   \item{\code{transcript_support_level}}{character Transcripts score according to how well mRNA and EST alignments match over its full length (1: all splice junctions of the transcript are supported by at least one non-suspect mRNA, 2: the best supporting mRNA is flagged as suspect or the support is from multiple ESTs, 3: the only support is from a single EST, 4: the best supporting EST is flagged as suspect, 5: no single transcript supports the model structure, NA: the transcript was not analyzed)}
#'   \item{\code{havana_transcript}}{character Transcript ID in the Havana database (OTTHUMGXXXXXXXXXXX.X)}
#'   \item{\code{exon_number}}{character For exons, lists the number of that exon in the given gene}
#'   \item{\code{exon_id}}{character Ensembl exon ID (ENSE########### followed by a single digit after a period indicating exon version number)}
#'   \item{\code{ont}}{character pseudogene (or other) ontology ids (PGO:XXXXXXX and others)}
#'   \item{\code{protein_id}}{character Ensembl protein ID (ENSP########### followed by a single digit after a period indicating protein version number}
#'   \item{\code{ccdsid}}{character official CCDS protein ID (CCDS#####.#)} 
#'}
#' @source \url{https://www.gencodegenes.org/human/release_22.html}
"gencode_v22_annotations"
#' @title HumanMethylation450 BeadChip Array hg38 annotations
#' 
#' @description Human genome hg38 annotations for probes on the hm450 array from: “Comprehensive characterization, annotation and innovative use of Infinium DNA Methylation BeadChip probes”
#' 
#' @docType data
#' 
#' @format A data frame with 485577 rows and 59 variables:
#' \describe{
#'   \item{\code{CpG_chrm}}{character Chromosome location of target CpG}
#'   \item{\code{CpG_beg}}{integer 1-based start location of target CpG}
#'   \item{\code{CpG_end}}{integer 1-based end location of target CpG}
#'   \item{\code{CpG_beg_TRUE}}{integer 1-based start location of target CpG dinucleotide}
#'   \item{\code{CpG_end_TRUE}}{integer 1-based end location of target CpG dinucleotide}
#'   \item{\code{probe_strand}}{character Indicates orientation of probe relative to target CpG (consistent with orientation column)}
#'   \item{\code{probeID}}{character Address of the probe in form: 'cg########'}
#'   \item{\code{address_A}}{integer Address of probe A on the chip designated by the original manifest}
#'   \item{\code{address_B}}{integer Address of probe B on the chip designated by the original manifest}
#'   \item{\code{channel}}{character Listing of channel type for probe ("Both" for type II probes and "Grn"/"Red" for type I probes)}
#'   \item{\code{designType}}{character Listing of probe design type (either "I" or "II")}
#'   \item{\code{nextBase}}{character The actual extension base (on the probe strand) after bisulfite conversion ("A" or "C" or "T")}
#'   \item{\code{nextBaseRef}}{character The extension base (on the hybridized DNA) before bisulfite conversion ("A", "C", "G" or "T")}
#'   \item{\code{probeType}}{character Type of probe ("cg","ch", or "rs")}
#'   \item{\code{orientation}}{character Specifies whether the probe is positioned upstream or downstream of target}
#'   \item{\code{probeCpGcnt}}{integer Number of additional CpGs in the probe (not counting the interrogated CpG)}
#'   \item{\code{context35}}{integer the number of CpGs in the [-35bp, +35bp] window}
#'   \item{\code{probeBeg}}{integer Mapped start position of the probe}
#'   \item{\code{probeEnd}}{integer Mapped end position of the probe}
#'   \item{\code{ProbeSeq_A}}{character The probe sequence for allele A}
#'   \item{\code{ProbeSeq_B}}{character The probe sequence for allele B}
#'   \item{\code{gene}}{character Nearby gene annnotations according to GENCODE v22}
#'   \item{\code{gene_HGNC}}{character Nearby gene annotations according to GENCODE v22 compatible with HGNC}
#'   \item{\code{chrm_A}}{character Chromosome location of probe A (excluding decoy chromosomes)}
#'   \item{\code{beg_A}}{integer Start location of probe A (excluding decoy chromosomes)}
#'   \item{\code{flag_A}}{integer Flag for mapping of probe A (excluding decoy chromosomes) (0: mapped to forward strand, 4: unmapped, 16: mapped to reverse strand)}
#'   \item{\code{mapQ_A}}{integer Mapping quality of probe A (excluding decoy chromosomes) (0-60, 60= best quality)}
#'   \item{\code{cigar_A}}{character Cigar output of probe A (excluding decoy chromosomes)}
#'   \item{\code{NM_A}}{integer Mismatch count of probe A (excluding decoy chromosomes)}
#'   \item{\code{chrm_B}}{character Chromosome location of probe B (excluding decoy chromosomes) (excluding decoy chromosomes)}
#'   \item{\code{beg_B}}{integer Start location of probe B (excluding decoy chromosomes)}
#'   \item{\code{flag_B}}{integer Flag for mapping of probe B (excluding decoy chromosomes) (0: mapped to forward strand, 4: unmapped, 16: mapped to reverse strand)}
#'   \item{\code{mapQ_B}}{integer Mapping quality of probe B (excluding decoy chromosomes) (0-60, 60= best quality)}
#'   \item{\code{cigar_B}}{character Cigar output of probe B (excluding decoy chromosomes)}
#'   \item{\code{NM_B}}{integer Mismatch count of probe B (excluding decoy chromosomes)}
#'   \item{\code{wDecoy_chrm_A}}{character Chromosome location of probe A}
#'   \item{\code{wDecoy_beg_A}}{integer Start location of probe A}
#'   \item{\code{wDecoy_flag_A}}{integer Flag for mapping of probe A (0: mapped to forward strand, 4: unmapped, 16: mapped to reverse strand)}
#'   \item{\code{wDecoy_mapQ_A}}{integer Mapping quality of probe A (0-60, 60= best quality)}
#'   \item{\code{wDecoy_cigar_A}}{character Cigar output of probe A}
#'   \item{\code{wDecoy_NM_A}}{integer Mismatch count of probe A}
#'   \item{\code{wDecoy_chrm_B}}{character Chromosome location of probe B}
#'   \item{\code{wDecoy_beg_B}}{integer Start location of probe B}
#'   \item{\code{wDecoy_flag_B}}{integer Flag for mapping of probe B (0: mapped to forward strand, 4: unmapped, 16: mapped to reverse strand)}
#'   \item{\code{wDecoy_mapQ_B}}{integer Mapping quality of probe B (0-60, 60= best quality)}
#'   \item{\code{wDecoy_cigar_B}}{character Cigar output of probe B}
#'   \item{\code{wDecoy_NM_B}}{integer Mismatch count of probe B}
#'   \item{\code{posMatch}}{logical Not applicable to this dataset}
#'   \item{\code{MASK_mapping}}{logical Whether the probe is masked for mapping reason. Probes retained have high quality (>=40 on 0-60 scale) consistent (with designed MAPINFO) mapping (for both in the case of type I) without INDELs}
#'   \item{\code{MASK_typeINextBaseSwitch}}{logical Whether the probe has a SNP in the extension base that causes a color channel switch from the official annotation (described as color-channel-switching, or CCS SNP in the reference)}
#'   \item{\code{MASK_rmsk15}}{logical Whether the 15bp 3'-subsequence of the probe overlap with repeat masker, this MASK is NOT recommended}
#'   \item{\code{MASK_sub40_copy}}{logical Whether the 40bp 3'-subsequence of the probe is non-unique}
#'   \item{\code{MASK_sub35_copy}}{logical Whether the 35bp 3'-subsequence of the probe is non-unique}
#'   \item{\code{MASK_sub30_copy}}{logical Whether the 30bp 3'-subsequence of the probe is non-unique}
#'   \item{\code{MASK_sub25_copy}}{logical Whether the 25bp 3'-subsequence of the probe is non-unique}
#'   \item{\code{MASK_snp5_common}}{logical Whether 5bp 3'-subsequence (including extension for typeII) overlap with any of the common SNPs from dbSNP (global MAF can be under 1 percent)}
#'   \item{\code{MASK_snp5_GMAF1p}}{logical Whether 5bp 3'-subsequence (including extension for typeII) overlap with any of the SNPs (with global MAF >1 percent)}
#'   \item{\code{MASK_extBase}}{logical Probes masked for extension base inconsistent with specified color channel (type-I) or CpG (type-II) based on mapping}
#'   \item{\code{MASK_general}}{logical Recommended general purpose masking merged from "MASK.sub30.copy", "MASK.mapping", "MASK.extBase", "MASK.typeINextBaseSwitch" and "MASK.snp5.GMAF1p"} 
#'}
#' @source \url{http://zwdzwd.github.io/InfiniumAnnotation}
"hm450_hg38_annotations"
#' @title Consensus open chromatin regions dataset
#' 
#' @description A dataset containing a master track of DNaseI hypersensitive sites from 125 seperate cell types from ENCODE lifted from the hg19 to the hg38 human genome. 
#' 
#' @docType data
#' 
#' @format A data frame with 2892942 rows and 4 variables:
#' \describe{
#'   \item{\code{chromosome}}{character Chromosome location of peaks}
#'   \item{\code{start}}{integer 1-based start location of peaks}
#'   \item{\code{end}}{integer 1-based end location of peaks}
#'   \item{\code{strand}}{integer Placeholder for strand information} 
#'}
#' @source \url{http://genome.ucsc.edu/cgi-bin/hgTrackUi?db=hg19&g=wgEncodeAwgDnaseMasterSites}
"consensus_open_chromatin_regions"