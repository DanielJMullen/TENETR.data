# Create new package. Directory must not exist.
# This also creates a new RStudio project.
devtools::create("/Users/iaolabdanielmullen/Desktop/TENETR.data")

# Set up the data-raw directory and data processing script
# You can use any name you want
usethis::use_data_raw(name = 'consensus_enhancer_regions')
usethis::use_data_raw(name = 'gencode_v22_annotations')
usethis::use_data_raw(name = 'hm450_hg38_annotations')

# This script in the R directory will contain the documentation.
# You can use any name you want.
file.create("R/data.R")

# # Initialize git repository (optional)
# usethis::use_git()

## Initialize documentation of the datasets:
sinew::makeOxygen(consensus_enhancer_regions, add_fields = "source")
sinew::makeOxygen(gencode_v22_annotations, add_fields = "source")
sinew::makeOxygen(hm450_hg38_annotations, add_fields = "source")
