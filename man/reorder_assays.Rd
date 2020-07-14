\name{reorder_assays}
\alias{reorder_assays}
\title{Re-order the elements of the \code{assays} slot of a
  \code{SummarizedExperiment} object to make counts the first element}

\usage{
  reorder_assays(
    se,
    order = c("counts","abundance","length")
  )
}

\arguments{
  \item{se}{A \code{SummarizedExperiment} object with 3 assays as would be downloaded
    from the \code{FieldEffectCrc} package. An abundance (i.e. TPM) matrix is the first
    element after initial download.}
  \item{order}{A character vector of length 3 with strings arranged in the order of assays
    desired in the output. Default setting simply switches the order of counts and abundance
    to make counts the first element, as is commonly expected of \code{SummarizedExperiment}
    objects.}
}

\value{
  A \code{SummarizedExperiment} object.
}

\description{
  Simple helper function to switch the order of assays in a \code{SummarizedExperiment}
  object with 3 assays as would be downloaded from the \code{FieldEffectCrc} package.
  This function also rounds the counts assay to integer values. Useful for creating
  a \code{DESeqDataSet} directly from a downloaded \code{SummarizedExperiment}
  object with the \code{DESeqDataSet()} function.
}

\details{
  Meant to facilitate alternative uses of the \code{SummarizedExperiment} objects
  as explained in the \code{FieldEffectCrc} package vignette.

  browseVignettes("FieldEffectCrc")
}

\examples{

  ## move counts to the first assay slot
  hub <- ExperimentHub::ExperimentHub()
  r <- AnnotationHub::query(hub, c("FieldEffectCrc"))
  se <- r[["EH3526"]]
  se <- reorder_assays(se)
  se
  dds <- DESeq2::DESeqDataSet(se, design = ~ sampType)

}

\author{Chris Dampier}

\keyword{methods}
