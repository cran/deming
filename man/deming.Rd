\name{deming}
\alias{deming}
\title{Fit a generalized Deming regression}
\description{
 Find the MLE line relating x and y when both are measured with
error.  When the variances of x and y are constant and equal, this is the
special case of Deming regression.
}
\usage{
deming(formula, data, subset, weights, na.action, cv=FALSE,
       xstd, ystd, stdpat, conf=.95, jackknife=TRUE, dfbeta=FALSE,
       id, x=FALSE, y=FALSE, model=TRUE)
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
  The 'factory fresh' default is \code{na.omit}, the \code{na.exclude} option
  is often useful.}

  \item{xstd}{optional, the variable name of a vector that contains explicit
     error values for each of the predictor values. This data overrides
    the \code{cv} option if both are present.}
  \item{ystd}{optional, the variable name of a vector that contains explicit
     error values for each of the response values. This data overrides
    the \code{cv} option if both are present.}
  \item{cv}{constant coefficient of variation?  The default of
    false corresponds to ordinary Deming regression, i.e., an assumption
    of constant error.  A value of \code{cv=TRUE} corresponds to the
    assumption of constant coefficient of variation. }
  \item{stdpat}{pattern for the standard deviation, see comments below.
    If this is missing the default is based on the \code{cv} option.}
  \item{conf}{confidence level for the confidence interval}
  \item{jackknife}{compute a jackknife estimate of variance.}
  \item{dfbeta}{return the dfbeta matrix from the jackknife
    computation.}
  \item{id}{grouping values for the grouped jackknife}
  \item{x,y, model}{logicals. If TRUE the corresponding components of the fit 
  (the model frame, the model matrix, or the response) is returned.}
}
\details{
Ordinary least squares regression minimizes the sum of distances between
the y values and the regression line, Deming regression minimizes the
sum of distances in both the x and y direction.
As such it is often appropriate when both x and y are measured with
error.  A common use is in comparing two assays, each of which is designed
to quantify the same compound.

The standard deviation of the x variate variate will often be of the form
\eqn{\sigma(c + dx)}{s(c+dx)} for c and d some constants,
where \eqn{\sigma}{s} is the overal scale factor; similarly for y with
constants e and f.
Ordinary Deming regression corresponds to c=1 and d=0, i.e., constant
variation over the range of the data.
A more realistic assumption for many laboratory measurments is c=0 and
d=1, i.e., constant coefficient of variation.
Laboratory tests are often assumed to have constant coefficient of
variation rather than constant variance.

There are 3 ways to specify the variation.  The first is to directly
set the pattern of (c,d,e,f) for the $x$ and $y$ standard deviations.
If this is omitted, a default of (0,1,0,1) or (1,0,1,0) is chosen, based
on whether the code{cv} option is TRUE or FALSE, respectively.
As a third option, the user can specifiy \code{xstd} and \code{ystd}
directly as vectors of data values.  In this last case any values for
the \code{stdpat} or \code{ccs} options are ignored.
Note that the two calls \code{deming(y ~ x, cv=TRUE)} and
\code{deming(y ~ x, xstd=x, ystd=y)} are subtly different.  In the first
the standard deviation values are based on the data, and in the second
they will be based on the fitted values.  The two outcomes will often be
nearly identical.

Although a \code{cv} option of TRUE is often much better
justified than an assumption of constant variance,
assumpting a perfectly constant CV can also be questionable.
Most actual biologic assays will have both a constant and a
proportional component of error, with the former becoming dominant for values
near zero and the latter dominant elsewhere.
If all of the results are far from zero, however, the constant part may
be ignored.

Many times an assay will be done in duplicate, in which case the paired
results can have correlated errors due to sample handling or
manipulation that preceeds splitting it into separate aliquots for
assay, and the ordinary variance will be too small (as it also is when
the duplicate values are averaged together before fitting the regression
line.)  A correct grouped jackknife estimate of variance is obtained in
this case by setting \code{id} to a vector of sample identifiers.
}
\value{
  a object of class 'deming' containing the components:
  \item{coefficient}{the coefficient vector, containing the intercept and 
slope.}
  \item{variance}{The jackknife or bootstrap estimate of variance}
  \item{ci}{bootstrap confidence intervals, if nboot >0}
  \item{dfbeta}{pptionally, the dfbeta residuals.  A 2 column matrix,
each row is the change in the coefficient vector if that observation is
removed from the data.}
}

\references{
 BD Ripley and M Thompson, Regression techniques for the detection
of analytical bias, Analyst 112:377-383, 1987.

 K Linnet, Estimation of the linear relationship between the
measurements of two methods with proportional errors.  
Statistics in Medicine 9:1463-1473, 1990.
}
\author{Terry Therneau}
\examples{
# Data from Ripley and Thompson
fit <- deming(aes ~ aas, data=arsenate, xstd=se.aas, ystd=se.aes)
print(fit)
\dontrun{
            Coef se(coef) lower 0.95 upper 0.95
Intercept 0.1064   0.2477    -0.3790     0.5919
Slope     0.9730   0.1430     0.6928     1.2532

   Scale= 1.358 
}
plot(1:30, fit$dfbeta[,2]) #subject 22 has a large effect on the slope

# Constant proportional error fit (constant CV)
fit2 <- deming(new.lot ~ old.lot, ferritin, cv=TRUE,
                subset=(period==3))
}
\keyword{models, regression}
