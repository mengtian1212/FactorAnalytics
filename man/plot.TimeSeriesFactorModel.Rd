\name{plot.TimeSeriesFactorModel}
\alias{plot.TimeSeriesFactorModel}
\title{plot TimeSeriesFactorModel object.}
\usage{
  \method{plot}{TimeSeriesFactorModel} (x,
    colorset = c(1:12), legend.loc = NULL,
    which.plot = c("none", "1L", "2L", "3L", "4L", "5L", "6L", "7L"),
    max.show = 6, plot.single = FALSE, asset.name,
    which.plot.single = c("none", "1L", "2L", "3L", "4L", "5L", "6L", "7L", "8L", "9L", "10L", "11L", "12L", "13L"),
    VaR.method = "historical")
}
\arguments{
  \item{x}{fit object created by
  \code{fitTimeSeriesFactorModel}.}

  \item{colorset}{Defualt colorset the same as
  \code{barplot}.}

  \item{legend.loc}{Plot legend or not. Defualt is
  \code{NULL}.}

  \item{which.plot}{Integer indicates which plot to create:
  "none" will create a menu to choose. Defualt is none.\cr
  1 = "Fitted factor returns", \cr 2 = "R square", \cr 3 =
  "Variance of Residuals",\cr 4 = "FM Correlation",\cr 5 =
  "Factor Contributions to SD",\cr 6 = "Factor
  Contributions to ES",\cr 7 = "Factor Contributions to
  VaR"}

  \item{max.show}{Maximum assets to plot. Default is 6.}

  \item{plot.single}{Plot a single asset of lm class.
  Defualt is \code{FALSE}.}

  \item{asset.name}{Name of the asset to be plotted.}

  \item{which.plot.single}{Integer indicates which plot to
  create: "none" will create a menu to choose. Defualt is
  none.\cr 1 = time series plot of actual and fitted
  values,\cr 2 = time series plot of residuals with
  standard error bands, \cr 3 = time series plot of squared
  residuals, \cr 4 = time series plot of absolute
  residuals,\cr 5 = SACF and PACF of residuals,\cr 6 = SACF
  and PACF of squared residuals,\cr 7 = SACF and PACF of
  absolute residuals,\cr 8 = histogram of residuals with
  normal curve overlayed,\cr 9 = normal qq-plot of
  residuals,\cr 10= CUSUM plot of recursive residuals,\cr
  11= CUSUM plot of OLS residuals,\cr 12= CUSUM plot of
  recursive estimates relative to full sample estimates,\cr
  13= rolling estimates over 24 month window.}

  \item{VaR.method}{Character, method for computing VaR.
  Valid choices are either
  "modified","gaussian","historical", "kernel". computation
  is done with the \code{VaR} in the PerformanceAnalytics
  package. Default is "historical".}
}
\description{
  Generic function of plot method for
  fitTimeSeriesFactorModel. Either plot all assets or
  choose a single asset to plot.
}
\examples{
\dontrun{
# load data from the database
data(managers.df)
fit.macro <- fitTimeseriesFactorModel(assets.names=colnames(managers.df[,(1:6)]),
                                factors.names=c("EDHEC.LS.EQ","SP500.TR"),
                                data=managers.df,fit.method="OLS")
# plot of all assets and show only first 4 assets.
plot(fit.macro,max.show=4)
# single plot of HAM1 asset
plot(fit.macro, plot.single=TRUE, asset.name="HAM1")
}
}
\author{
  Eric Zivot and Yi-An Chen.
}

