make_txi <- function(se) {
    txi <- as.list(SummarizedExperiment::assays(se))
    txi$countsFromAbundance <- "no"
    return(txi)
}
