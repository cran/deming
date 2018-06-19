\name{pbreg}
\alias{pbreg}
\title{Passing-Bablock regressin}
\description{
Passing-Bablock regression is a robust regression method for two variables
that is symmetric in x and y.}
\usage{
pbreg(formula, data, subset, weights, na.action, conf=.95,
     nboot = 0, method=1, eps=sqrt(.Machine$double.eps),
     x = FALSE, y = FALSE, model = TRUE)
}

\arguments{
  \item{formula}{a model formula with a single continuous response on the left
  and a single continuous predictor on the right.}
  \item{data}{
  an optional data frame, list or environment containing the variables in the model.
  }
  \item{subset}{an optional vector specifying a subset of observations to be 
  		   used in the fitting process.}
  \item{weights}{an optional vector of weights to be used in the fitting process. 
  		    Should be NULL or a numeric vector.} I
  \item{na.action}{a function which indicates what should happen when the data 
  contain NAs. The default is set by the na.action setting of \code{options}.
  The 'factory fresh' default for R is \code{na.omit}, the
  \code{na.exclude} option is often useful.}

  \item{conf}{the width of the computed confidence limit}
  \item{nboot}{number of bootstrap samples used to compute standard
    errors and/or confidence limits.}
  \item{method}{which of 3 related methods to use for the computation}
  \item{eps}{the tolerance used to detect tied values in x and y}
  \item{x,y, model}{logicals. If TRUE the corresponding components of the fit 
  (the model frame, the model matrix, or the response) is returned.}
}
\details{
  There are 3 related estimators under this heading. 
  Method 1 is the original Passing-Bablock (1983) method, which is equal
  to a Theil-Sen estimate symmetric about the y=x line.  Method 2 is
  the first extended method of the 1988 paper, designed to be scale invariant.
  Method 3 is the second extended method from
  the 1985 paper, the "scissors" estimate which is symmetric about both
  the x and y axes, and is also scale invariant.

  The default confidence interval estimate is based on that derived by
  Sen, which is in turn based on the relationship to Kendall's tau.
  A theoretical justification of this approach for methods 2 and 3 is
  lacking, and we recommend a bootstrap based confidence interval based
  on 500-1000 replications.
}
\value{
  pbreg returns an object of \code{class} "pbreg".
  The generic accessor functions
  \code{coef}, \code{fitted} and \code{residuals}
  extract the relevant components.
}
\references{
  Passing, H. and Bablock, W. (1983).
    A new biometrical procedure for testing the equality of measurements 
    from two different analytical methods. Application of linear 
    regression procedures for method comparison studies in Clinical Chemistry, 
    Part I. J. Clin. Chem. Clin. Biochem. 21:709-720.

  Passing, H.  and Bablock, W. (1984).
    Comparison of several regression procedures for method comparison
    studies and determination of sample size. Application of linear 
    regression procedures for method comparison studies in Clinical Chemistry, 
    Part II. J. Clin. Chem. Clin. Biochem. 22:431-435.

  Bablock, W., Passing, H., Bender, R. and 
    Schneider, B. (1988).
    A general regression procedure for method transformations.
    Application of linear 
    regression procedures for method comparison studies in Clinical Chemistry, 
    Part III. J. Clin. Chem. Clin. Biochem. 26:783-790.
 }
\author{Terry Therneau}
\seealso{\code{\link{deming}}}

\examples{
afit1 <- pbreg(aes ~ aas, data= arsenate)
afit2 <- pbreg(aas ~ aes, data= arsenate)
rbind(coef(afit1), coef(afit2))  # symmetric results
1/coef(afit1)[2]
}

\keyword{ models }
\keyword{ regression }
\keyword{ robust }
