\name{FieldEffectCrc-package}

\alias{FieldEffectCrc-package}
\alias{FieldEffectCrc}

\title{Tumor, tumor-adjacent normal, and healthy colorectal transcriptomes available
as a \code{SummarizedExperiment} object.}

\description{
  Processed RNA-seq data for 1,139 human primary colorectal tissue samples
  across three phenotypes, including tumor, normal adjacent-to-tumor, and healthy,
  available as Synapse ID syn22237139 available at <https://www.synapse.org/#!Synapse:syn22237139/files/>.
  Data have been parsed into a \code{SummarizedExperiment} object available in
  \code{ExperimentHub} to facilitate reproducibility and extension of results from
  Dampier et al.
}

\details{
  See the vignette for examples of using these data in differential
  gene expression analysis.

  browseVignettes("FieldEffectCrc")

  Details of how the \code{SummarizedExperiment} objects were created from count
  matrices are available in the \code{inst/scripts/} directory of the source package
  in the \code{make-data.R} file.
}

\examples{
  library(ExperimentHub)
  hub <- ExperimentHub()
  x <- query(hub, c("FieldEffectCrc"))
  x
  ## download resource
  data = x[[1]]
}

\keyword{utilities}
