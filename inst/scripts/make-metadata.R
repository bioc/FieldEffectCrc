###
### FieldEffectCrc metadata
###

meta <- data.frame(
    Title = c(
        paste("cohort A from Dampier et al."),
        paste("cohort B from Dampier et al."),
        paste("cohort C from Dampier et al.")
    ),
    Description = c(
        paste("Salmon-generated transcript-level abundance estimates",
              "summarized to gene level using tximport along with raw counts,",
              "gene lengths, and clinical annotations for 834 human primary",
              "colorectal tissue samples across three phenotypes, including tumor,",
              "normal adjacent-to-tumor, and healthy, represented as a",
              "SummarizedExperiment. Abundance estimates derived from",
              "paired-end RNA-seq."),
        paste("Salmon-generated transcript-level abundance estimates",
              "summarized to gene level using tximport along with raw counts,",
              "gene lengths, and clinical annotations for 30 human primary",
              "colorectal tumors and matched normal tissue samples represented",
              "as a SummarizedExperiment. Abundance estimates derived from",
              "paired-end RNA-seq."),
        paste("Salmon-generated transcript-level abundance estimates",
              "summarized to gene level using tximport along with raw counts,",
              "gene lengths, and clinical annotations for 275 human primary",
              "colorectal tissue samples across three phenotypes, including tumor,",
              "normal adjacent-to-tumor, and healthy, represented as a",
              "SummarizedExperiment. Abundance estimates derived from",
              "single-end RNA-seq.")
    ),
    BiocVersion = rep("3.12", 3),
    Genome = rep("GRCh38", 3),
    SourceType = rep("tar.gz", 3),
    SourceUrl = rep("https://www.synapse.org/#!Synapse:syn22237139/files/", 3),
    SourceVersion = rep("v1", 3),
    Species = rep("Homo sapiens", 3),
    TaxonomyId = 9606,
    Coordinate_1_based = TRUE,
    DataProvider = "Synapse",
    Maintainer = "Chris Dampier <chd5n@virginia.edu>",
    RDataClass = "SummarizedExperiment",
    DispatchClass = "Rda",
    RDataPath = c("FieldEffectCrc/FieldEffectCrc_cohort_A_SE.Rda",
                  "FieldEffectCrc/FieldEffectCrc_cohort_B_SE.Rda",
                  "FieldEffectCrc/FieldEffectCrc_cohort_C_SE.Rda"),
    Tags = ""  ## auto-generated from DESCRIPTION
)

write.csv(meta, file="inst/extdata/metadata.csv", row.names=FALSE)
