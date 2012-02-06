\name{factorialMpfr}
\alias{factorialMpfr}
\title{Factorial 'n!'  in Arbitrary Precision}
\description{
  Efficiently compute \eqn{n!} in arbitrary precision,
  using the MPFR-internal implementation.
  This is mathematically (but not numerically) the same as
  \eqn{\Gamma(n+1)}{Gamma(n+1)}.
}
\usage{
factorialMpfr(n, precBits = max(2, ceiling(lgamma(n+1)/log(2))))
}
\arguments{
  \item{n}{non-negative integer (vector).}
  \item{precBits}{desired precision in bits (\dQuote{binary digits});
    the default sets the precision high enough for the result to be \emph{exact}.}
}
\value{
  a number of (S4) class \code{\linkS4class{mpfr}}.
}
\seealso{
  \code{\link{factorial}} and \code{\link{gamma}} in base \R;
  \code{chooseMpfr()} and \code{\link{pochMpfr}()} (on the same page).
}
\examples{
factorialMpfr(200)

n <- 1000:1010
f1000 <- factorialMpfr(n)
stopifnot(1e-15 > abs(as.numeric(1 - lfactorial(n)/log(f1000))))

## Note that---astonishingly--- measurements show only
## *small* efficiency gain of ~ 10\% : over using the previous "technique"
system.time(replicate(8, f1e4 <- factorialMpfr(10000)))
system.time(replicate(8, f.1e4 <- factorial(mpfr(10000,
                            prec=1+lfactorial(10000)/log(2)))))
}
\keyword{arith}