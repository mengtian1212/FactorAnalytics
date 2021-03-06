\name{factorModelCovariance}
\alias{factorModelCovariance}
\title{Compute Factor Model Covariance Matrix.}
\usage{
  factorModelCovariance(beta, factor.cov, resid.variance)
}
\arguments{
  \item{beta}{\code{N x K} matrix of factor betas, where
  \code{N} is the number of assets and \code{K} is the
  number of factors.}

  \item{factor.cov}{\code{K x K} factor return covariance
  matrix.}

  \item{resid.variance}{\code{N x 1} vector of asset
  specific residual variances from the factor model.}
}
\value{
  \code{N x N} return covariance matrix based on factor
  model parameters.
}
\description{
  Compute asset return covariance matrix from factor model.
}
\details{
  The return on asset \code{i} is assumed to follow the
  factor model \cr \code{R(i,t) = alpha + t(beta)*F(t) +
  e(i,t), e(i,t) ~ iid(0, sig(i)^2)} \cr where \code{beta}
  is a \code{K x 1} vector of factor exposures. The return
  variance is then \cr \code{var(R(i,t) =
  t(beta)*var(F(t))*beta + sig(i)^2}, \cr and the \code{N x
  N} covariance matrix of the return vector \code{R} is \cr
  \code{var(R) = B*var(F(t))*t(B) + D} \cr where B is the
  \code{N x K} matrix of asset betas and \code{D} is a
  diagonal matrix with \code{sig(i)^2} values along the
  diagonal.
}
\examples{
\dontrun{
# Time Series model

data(managers.df)
factors    = managers.df[,(7:9)]
fit <- fitTimeSeriesFactorModel(assets.names=colnames(managers.df[,(1:6)]),
                                factors.names=c("EDHEC.LS.EQ","SP500.TR"),
                                data=managers.df,fit.method="OLS")
factors    = managers.df[,(7:8)]
factorModelCovariance(fit$beta,var(factors),fit$resid.variance)

# Statistical Model
data(stat.fm.data)
sfm.pca.fit <- fitStatisticalFactorModel(sfm.dat,k=2)
#' factorModelCovariance(t(sfm.pca.fit$loadings),var(sfm.pca.fit$factors),sfm.pca.fit$resid.variance)

sfm.apca.fit <- fitStatisticalFactorModel(sfm.apca.dat,k=2)

factorModelCovariance(t(sfm.apca.fit$loadings),
                       var(sfm.apca.fit$factors),sfm.apca.fit$resid.variance)

 # fundamental factor model example
 #'
 data(stock)
# there are 447 assets
exposure.names <- c("BOOK2MARKET", "LOG.MARKETCAP")
beta.mat <- subset(stock,DATE == "2003-12-31")[,exposure.names]
beta.mat1 <- cbind(rep(1,447),beta.mat1)
fit.fund <- fitFundamentalFactorModel(exposure.names=c("BOOK2MARKET", "LOG.MARKETCAP")
                                     , data=stock,returnsvar = "RETURN",datevar = "DATE",
                                     assetvar = "TICKER",
                                     wls = TRUE, regression = "classic",
                                     covariance = "classic", full.resid.cov = FALSE)
ret.cov.fundm <- factorModelCovariance(beta.mat1,fit.fund$factor.cov$cov,fit.fund$resid.variance)
fit.fund$returns.cov$cov == ret.cov.fundm
}
}
\author{
  Eric Zivot and Yi-An Chen.
}
\references{
  Zivot, E. and J. Wang (2006), \emph{Modeling Financial
  Time Series with S-PLUS, Second Edition},
  Springer-Verlag.
}

