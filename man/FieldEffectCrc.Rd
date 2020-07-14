\docType{package}
\name{FieldEffectCrc-package}
\alias{FieldEffectCrc-package}
\alias{FieldEffectCrc}
\title{Tumor, tumor-adjacent normal, and healthy colorectal transcriptomes available
as a \code{SummarizedExperiment} object}

\description{
  Processed RNA-seq data for 1,139 human primary colorectal tissue samples across
  three phenotypes, including tumor, normal adjacent-to-tumor, and healthy,
  available as Synapse ID syn22237139 hosted on Synapse:

  <https://www.synapse.org/#!Synapse:syn22237139/files/>

  Data have been parsed into three \code{SummarizedExperiment} objects available in
  \code{ExperimentHub} to facilitate reproducibility and extension of results from
  Dampier et al.
}

\details{
  Includes data as well as two simple helper functions to execute common manipulations
  of the data:

  \itemize{
    \item \code{make_txi}: makes a \code{tximport}-style list from a \code{SummarizedExperiment} object for downstream use
    \item \code{reorder_assays}: reorders the assays of a \code{SummarizedExperiment} object so that counts is the first assay
  }

  See the package vignette for examples of using these data in differential
  gene expression analysis.

  browseVignettes("FieldEffectCrc")

  Details of how the \code{SummarizedExperiment} objects were created from count
  matrices are available in the \code{inst/scripts/} directory of the source package
  in the \code{make-data.R} file.
}

\examples{

  ## load ExperimentHub package
  library(ExperimentHub)

  ## load hub
  hub <- ExperimentHub::ExperimentHub()

  ## list resources associated with package
  x <- ExperimentHub::listResources(hub,"FieldEffectCrc")
  x

  ## query hub for package resources
  r <- AnnotationHub::query(hub, c("FieldEffectCrc"))
  r

  ## download selected resource by position
  ## output is SummarizedExperiment
  data <- r[[1]]
  data

  ## download selected resource by hub id
  ## output is SummarizedExperiment
  data <- r[["EH3524"]]
  data

  ## download selected resource by filter
  ## output is list of SummarizedExperiments
  data <- ExperimentHub::loadResources(hub,"FieldEffectCrc","cohort A")
  data

  ## make a txi object
  se <- r[["EH3524"]]
  txi <- make_txi(se)
  str(txi)

  ## move counts to the first assay slot
  se <- r[["EH3524"]]
  se <- reorder_assays(se)
  se

}

\author{Chris Dampier}

\keyword{package}
