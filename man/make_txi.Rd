\name{make_txi}
\alias{make_txi}
\title{Make a \code{tximport}-style list object from a
    \code{SummarizedExperiment}}

\usage{
  make_txi(
    se
  )
}

\arguments{
  \item{se}{A \code{SummarizedExperiment} object with three assays as would be
    downloaded from the \code{FieldEffectCrc} package.}
}

\value{
  A list object with 4 elements, including 3 matrices and a character string.
  The matrices are in the following order: abundance, counts, length. The
  character string specifies whether \code{tximport} has scaled the counts. None
  of the counts have been scaled in the \code{FieldEffectCrc} package.
}

\description{
  Simple helper function to make a \code{tximport}-style txi list object for
  downstream use, especially with \code{DESeq2} and the
  \code{DESeqDataSetFromTximport()} function.
}

\details{
  Meant to facilitate differential expression using \code{DESeq2} as explained
  in the \code{FieldEffectCrc} package vignette.

  browseVignettes("FieldEffectCrc")
}

\examples{

  ## make a txi object
  hub <- ExperimentHub::ExperimentHub()
  r <- AnnotationHub::query(hub, c("FieldEffectCrc"))
  se <- r[["EH3526"]]
  txi <- make_txi(se)
  str(txi)
  dds <- DESeq2::DESeqDataSetFromTximport(
            txi,
            SummarizedExperiment::colData(se),
            ~ sampType
          )
}

\author{Chris Dampier}

\keyword{methods}
