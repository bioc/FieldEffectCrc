reorder_assays <- function(se,order=c("counts","abundance","length")) {
  l <- as.list(SummarizedExperiment::assays(se))
  tmp <- list()
  for (each in names(l)) {
    tmp[[each]] <- l[[each]]
  }
  for (i in seq_len(length(order))) {
    if (order[i] == "counts") {
      l[[i]] <- round(tmp[[order[i]]])
    } else {
      l[[i]] <- tmp[[order[i]]]
    }
  }
  names(l) <- order
  SummarizedExperiment::assays(se) <- l
  return(se)
}
