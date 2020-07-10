###
### FieldEffectCrc
###


## libraries required

# lib.loc <- "/path/to/R/libraries"
# .libPaths(c(.libPaths(),lib.loc))
library(synapser)
library(SummarizedExperiment)


## overview of functions

  ## I. download and parse raw data files
  ## II. create SummarizedExperiment for each cohort


##  I. download and parse raw data files

  ## clinical annotations and expression matrices are hosted on synapse.org under
  ## project syn22237139, so a synapse ID is required to download the data

  ## data can be downloaded from the command line, with Python, through the
  ## synapse web interface, or with R using the synapser package

  ## the following function assumes the user has registered with synapse and has
  ## successfully installed synapser

  ## synapser installation
  # lib.loc <- "/path/to/R/libraries"
  # install.packages("synapser", repos=c("http://ran.synapse.org", "http://cran.fhcrc.org"),
  #   lib=lib.loc)


download_parse <- function(email, password, downloads) {

  ## login
  synLogin(email=email,password=password)

  ## annotations
  cat("\ndownloading and parsing annotation files ...\n")
  entity <- synGet("syn22242700", downloadLocation=downloads)
  filepath <- entity$path
  untar(filepath, exdir=downloads)
  ann <- list()
  for (cohort in c("A","B","C")) {
    f <- paste0(downloads,paste0("cohort_",cohort,".tsv"))
    ann[[cohort]] <- read.table(f, header=TRUE, sep="\t")
  }
  file.remove(filepath)

  ## expression
  cat("downloading and parsing expression files (this may take a while) ...\n")
  entity <- synGet("syn22242701", downloadLocation=downloads)
  filepath <- entity$path
  untar(filepath, exdir=downloads)
  expr <- list()
  for (cohort in c("A","B","C")) {
    expr[[cohort]] <- list()
    for (valtype in c("abundance","counts","length")) {
      f <- paste0(downloads,paste0("cohort_",cohort,"_",valtype,".tsv"))
      expr[[cohort]][[valtype]] <- data.matrix(read.table(f, header=TRUE, row.names=1, sep="\t"))
    }
  }
  file.remove(filepath)

  ## logout
  synLogout()

  ## cleanup
  cat("cleaning up downloaded and extracted files ...\n")
  for (cohort in c("A","B","C")) {
    f <- paste0(downloads,paste0("cohort_",cohort,".tsv"))
    file.remove(f)
    for (valtype in c("abundance","counts","length")) {
      f <- paste0(downloads,paste0("cohort_",cohort,"_",valtype,".tsv"))
      file.remove(f)
    }
  }

  cat("done !!!\n")
  return(setNames(list(ann,expr),c("ann","expr")))

}


##  II. create SummarizedExperiment for each cohort

  ## clinical annotations and expression matrices are loaded into the venerbale
  ## SummarizedExperiment class, which is a matrix-like container for rows of
  ## genomic features (e.g. genes) and columns of experimental units (e.g.
  ## samples)

  ## one data object per cohort as described in Fig 1 of the field effect
  ## manuscript is created and saved to a user-defined directory


create_se <- function(l, datadir) {
  cat("writing SummarizedExperiments to",datadir,"...\n")
  for (cohort in c("A","B","C")) {
    md <- list()
    md[["cohort"]] <- cohort
    md[["build"]] <- "GRCh38"
    md[["assay"]] <- "RNA-seq"
    md[["feature"]] <- "gene"
    se <- SummarizedExperiment(
            assays=l[["expr"]][[cohort]],
            colData=S4Vectors::DataFrame(l[["ann"]][[cohort]]),
            metadata=md
          )
    filepath <- paste0(datadir,"FieldEffectCrc_cohort_",cohort,"_SE.Rda")
    save(se, file=filepath)
  }
  cat("done writing SummarizedExperiments to",datadir,"!!!\n")
}


## make-data

email <- "useremail"  ## synapse email or username
password <- "userpassword"  ## synapse password
downloads <- "/path/to/downloads/"  ## local directory for downloaded files, must end with slash
l <- download_parse(email, password, downloads)

# datdir <- "inst/extdata/"
datadir <- "/path/to/data/"  ## local directory in which to store SE objects, must end with slash
create_se(l, datadir)
