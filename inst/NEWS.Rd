\name{NEWS}
\title{NEWS file for the deming package}
\section{Changes in version 1.3}{
  \itemize{
    \item Version 1.2 had left a browser() call behind, which was
    encountered when doing regression through the origin.  Pointed out
    by Daniela Herold.  Add a no intercept regression to the test suite.
}}
\section{Changes in version 1.2}{
  \itemize{
    \item Add importFrom directive for calls to functions from "stats",
    per 2015/7/1 change in CRAN checks
    \item Fix bug for the case of no intercept and the presence of stdx
    and stdy: an "as.matrix" was needed for the lm.wfit call.
    \item Change the bootstrap to use residuals orthagonal to the fitted
    line.  This makes the functions rotationally invariant.
}}
\section{Changes in version 1.1}{
  \itemize{
    \item Add the id option to the deming function, to allow for group
    jackknife estimates of variance.
}}
