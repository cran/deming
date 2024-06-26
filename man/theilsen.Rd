\name{theilsen}
\alias{theilsen}
\title{Theil-Sen regression}
\description{
Thiel-Sen regression is a robust regression method for two variables.
The symmetric option gives a variant that is symmentric in x and y.}
\usage{
theilsen(formula, data, subset, weights, na.action, conf=.95,
     nboot = 0, symmetric=FALSE, eps=sqrt(.Machine$double.eps),
     x = FALSE, y = FALSE, model = TRUE)
}

\arguments{
  \item{formula}{a model formula with a single continuous response on the left
  and a single continuous predictor on the right.}

  \item{data}{
    an optional data frame, list or environment containing the variables
    in the model.
  }
  \item{subset}{an optional vector specifying a subset of observations to be 
  		   used in the fitting process.}
  \item{weights}{an optional vector of weights to be used in the
		   fitting process.}
  \item{na.action}{a function which indicates what should happen when the data 
  contain NAs. The default is set by the na.action setting of \code{options}.}
  
   \item{conf}{the width of the computed confidence limit.} 
  \item{nboot}{number of bootstrap samples used to compute standard
    errors and/or confidence limits.  If this is 0 or missing then an
    asypmtotic formula is used.}
   \item{symmetric}{compute an estimate whose slope is symmetric in x
  and y.}
  \item{eps}{the tolerance used to detect tied values in x and y}
  \item{x,y, model}{logicals. If TRUE the corresponding components of the fit 
  (the model frame, the model matrix, or the response) is returned.}
}
\details{
  One way to characterize the slope of an ordinary least squares line
  is that \eqn{\rho(x, r)}{p(x, r)} =0, where where \eqn{\rho}{p} is the
  correlation coefficient and r is the vector of residuals from the
  fitted line.
  Thiel-Sen regression replaces \eqn{\rho}{p} with Kendall's
  \eqn{\tau}{tau}, a non-parametric alternative.
  It it resistant to outliers while retaining good statistical
  efficiency.

  The symmetric form of the estimate is based on solving the inverse
  equation: find that rotation of the original data such that
  \eqn{\tau(x,y)=0}{tau(x,y)=0} for the rotated data.
  (In a similar fashion,the rotation such the least squares slope is zero yields
  Deming regression.)
  In this case it is possible to have multiple solutions, i.e., slopes
  that yeild a 0 correlation, although this is rare unless the deviations
  from the fitted line are large.

  The default confidence interval estimate is based on the result of
  Sen, which is in turn based on the relationship to Kendall's tau and
  is essentially an inversion of the confidence interval for tau.
  The argument does not extend to the symmetric case, for which we
  recommend using a bootstrap confidence interval based on
  500-1000 replications.
}
\value{
  theilsen returns an object of \code{class} "theilsen" with components
  \item{coefficients}{the intercept and slope}
  \item{residuals}{residuals from the fitted line}
  \item{angle}{if the symmetric option is chosen, this contains all of the
    solutions for the angle of the regression line}
  \item{n}{number of data points}
  \item{model,x,y}{optional componets as specified by the x, y, and
    model arguments}
  \item{terms}{the terms object corresponding to the formula}
  \item{na.action}{na.action information, if applicable}
  \item{call}{a copy of the call to the function}
  
  The generic accessor functions
  \code{coef}, \code{residuals}, and \code{terms}
  extract the relevant components.
}
\references{
 Thiel, H. (1950), 
    A rank-invariant method of linear and polynomial regression analysis. 
    I, II, III, Nederl. Akad. Wetensch., Proc. 53: 386-392, 521-525, 1397-1412.

Sen, P.B. (1968), 
    Estimates of the regression coefficient based on Kendall's tau,
    Journal of the American Statistical Association 63: 1379-1389. 
}
\author{Terry Therneau}
\seealso{\code{\link{deming}}, \code{\link{pbreg}}}

\examples{
afit1 <- theilsen(aes ~ aas, symmetric=TRUE, data= arsenate)
afit2 <- theilsen(aas ~ aes, symmetric=TRUE, data= arsenate)
rbind(coef(afit1), coef(afit2))  # symmetric results
1/coef(afit1)[2]
}

\keyword{ models }
\keyword{ regression }
\keyword{ robust }
