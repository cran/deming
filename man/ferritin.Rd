\name{ferritin}
\alias{ferritin}
\alias{ferritin2}
\docType{data}
\title{Validation of a ferritin assay}
\description{For each of seven periods in which there was a new
  batch of reagent, a small set of patient samples was assayed for ferritin
  content using both the old and new batches.
}
\usage{data(ferritin)}
\format{
  A data frame with 162 observations on the following 4 variables.
  \describe{
    \item{\code{sample}}{sample identifier}
    \item{\code{period}}{the transition number, 1 to 7}
    \item{\code{old.lot}}{assay result using the old lot of the reagent}
    \item{\code{new.lot}}{assay result using the new lot}
  }
}
\details{
  The samples from each period are distinct.  
  In the second data set \code{ferritin2} outliers have been
  added to the data for period 2, excess noise added to one lot in
  period 4, and deterministic laboratory error to period 6.
}
\source{Blinded data from a clinical laboratory.}

\examples{
data(ferritin)
temp <- ferritin[ferritin$period <4,]
plot(temp$old.lot, temp$new.lot, type='n', log='xy',
     xlab="Old lot", ylab="New Lot")
text(temp$old.lot, temp$new.lot, temp$period,
         col=temp$period)
}
\keyword{datasets}
