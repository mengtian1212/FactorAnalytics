\name{plot.StatFactorModel}
\alias{plot.StatFactorModel}
\title{plot StatFactorModel object.}
\usage{
  \method{plot}{StatFactorModel} (x, variables,
    cumulative = TRUE, style = "bar",
    which.plot = c("none", "1L", "2L", "3L", "4L", "5L", "6L", "7L", "8L"),
    hgrid = FALSE, vgrid = FALSE, plot.single = FALSE,
    asset.name,
    which.plot.single = c("none", "1L", "2L", "3L", "4L", "5L", "6L", "7L", "8L", "9L", "10L", "11L", "12L", "13L"),
    max.show = 6, VaR.method = "historical", ...)
}
\arguments{
  \item{x}{fit object created by
  \code{fitStatisticalFactorModel}.}

  \item{variables}{Optional. An integer vector shows which
  variables are to be plotted. The default is to plot all
  the variables, or the number of variables explaining 90
  percent of the variance, whatever is bigger.}

  \item{cumulative}{Logical flag: if \code{TRUE}, the
  cumulative fraction of the variance is printed above each
  bar in the plot.}

  \item{style}{Charater. bar or lines can be chosen.}

  \item{which.plot}{integer indicating which plot to
  create: "none" will create a menu to choose. Defualt is
  none.\cr 1 = "Screeplot of Eigenvalues", \cr 2 = "Factor
  returns", \cr 3 = "FM Correlation", \cr 4 = "R
  square",\cr 5 = "Variance of Residuals", \cr 6 = "Factor
  Contributions to SD", \cr 7 = "Factor Contributions to
  ES", \cr 8 = "Factor Contributions to VaR" \cr}

  \item{hgrid}{Logic flag. Whether to plot horizontal grid
  or not. Defualt is \code{FALSE}.}

  \item{vgrid}{Logic flag. Whether to plot vertical grid or
  not. Defualt is \code{FALSE}.}

  \item{plot.single}{Plot a single asset of lm class.
  Defualt is \code{FALSE}.}

  \item{asset.name}{Name of the asset to be plotted.}

  \item{which.plot.single}{integer indicating which plot to
  create: "none" will create a menu to choose. Defualt is
  none. \cr 1 = time series plot of actual and fitted
  values, \cr 2 = time series plot of residuals with
  standard error bands,\cr 3 = time series plot of squared
  residuals, \cr 4 = time series plot of absolute
  residuals, \cr 5 = SACF and PACF of residuals, \cr 6 =
  SACF and PACF of squared residuals, \cr 7 = SACF and PACF
  of absolute residuals, \cr 8 = histogram of residuals
  with normal curve overlayed, \cr 9 = normal qq-plot of
  residuals,\cr 10= CUSUM plot of recursive residuals,\cr
  11= CUSUM plot of OLS residuals,\cr 12= CUSUM plot of
  recursive estimates relative to full sample estimates,\cr
  13= rolling estimates over 24 month window.}

  \item{max.show}{Maximum assets to plot. Default is 6.}

  \item{VaR.method}{Character, method for computing VaR.
  Valid choices are either
  "modified","gaussian","historical", "kernel". computation
  is done with the \code{VaR} in the PerformanceAnalytics
  package. Default is "historical".}

  \item{...}{Other variables for barplot method.}
}
\description{
  Generic function of plot method for
  fitStatisticFactorModel. Either plot all assets or choose
  a single asset to plot.
}
\examples{
\dontrun{
# load data for fitStatisticalFactorModel.r
# data from finmetric berndt.dat and folio.dat

data(stat.fm.data)
# pca
sfm.pca.fit <- fitStatisticalFactorModel(sfm.dat,k=10)
args(plot.StatFactorModel)
# plot all
plot(sfm.pca.fit)
# plot single asset
plot(sfm.pca.fit,plot.single=TRUE,asset.name="CITCRP")
}
}
\author{
  Eric Zivot and Yi-An Chen.
}

