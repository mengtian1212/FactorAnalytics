\name{predict.FundamentalFactorModel}
\alias{predict.FundamentalFactorModel}
\title{predict method for FundamentalFactorModel object}
\usage{
  \method{predict}{FundamentalFactorModel} (object,
    newdata, new.assetvar, new.datevar)
}
\arguments{
  \item{object}{fit "FundamentalFactorModel" object}

  \item{newdata}{An optional data frame in which to look
  for variables with which to predict.  If omitted, the
  fitted values are used.}

  \item{new.assetvar}{Specify new asset variable in newdata
  if newdata is provided.}

  \item{new.datevar}{Speficy new date variable in newdata
  if newdata is provided.}
}
\description{
  Generic function of predict method for
  fitFundamentalFactorModel.
}
\details{
  \code{newdata} must be data.frame and contain date
  variable, asset variable and exact exposures names that
  are used in fit object by
  \code{fitFundamentalFactorModel}
}
\examples{
data(Stock.df)
fit.fund <- fitFundamentalFactorModel(exposure.names=c("BOOK2MARKET", "LOG.MARKETCAP")
                                     , data=stock,returnsvar = "RETURN",datevar = "DATE",
                                     assetvar = "TICKER",
                                     wls = TRUE, regression = "classic",
                                     covariance = "classic", full.resid.cov = FALSE)
# If not specify anything, predict() will give fitted value
pred.fund <- predict(fit.fund)

# generate random data
testdata <- stock[,c("DATE","TICKER")]
testdata$BOOK2MARKET <- rnorm(n=42465)
testdata$LOG.MARKETCAP <- rnorm(n=42465)
pred.fund2 <- predict(fit.fund,testdata,new.assetvar="TICKER",new.datevar="DATE")
}
\author{
  Yi-An Chen
}

