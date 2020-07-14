test_cohortB <- function() {
  hub <- ExperimentHub::ExperimentHub()
  r <- AnnotationHub::query(hub, c("FieldEffectCrc"))
  se <- r[["EH3525"]]
  RUnit::checkEquals(dim(se)[1], 37361)
  RUnit::checkEquals(dim(se)[2], 30)
}

test_make_txi <- function() {
  hub <- ExperimentHub::ExperimentHub()
  r <- AnnotationHub::query(hub, c("FieldEffectCrc"))
  se <- r[["EH3525"]]
  txi <- make_txi(se)
  RUnit::checkEquals(is(txi)[1], "list")
}

test_reorder_assays <- function() {
  hub <- ExperimentHub::ExperimentHub()
  r <- AnnotationHub::query(hub, c("FieldEffectCrc"))
  se <- r[["EH3525"]]
  se <- reorder_assays(se)
  RUnit::checkEquals(names(SummarizedExperiment::assays(se))[1], "counts")
}
