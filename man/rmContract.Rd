\name{rmContract}
\alias{rmContract}
\title{Remove local copies of twsContracts}
\usage{
  rmContract(x, env = .GlobalEnv)
}
\arguments{
  \item{x}{character name of a Symbol. Can also be an xts
  object. (See Details)}

  \item{env}{environment that holds (non-required) xts
  data.}
}
\value{
  called for side-effect
}
\description{
  Remove any local copies of a twsContract so that
  \code{getContract} will be forced to
  \code{\link[IBrokers]{reqContractDetails}}
}
\examples{
\dontrun{
define_stocks("SPY")
getContract("SPY") # == getInstrument("SPY")$IB
rmContract("SPY")
instrument_attr("SPY", "src", list(src="IBrokers", Contract=getContract("SPY")))
getContract("SPY") # == getSymbolLookup()[["SPY"]]$Contract
rmContract("SPY")
getContract("SPY") #has to look it up with reqContractDetails
}
}
\author{
  Garrett See
}
\seealso{
  \code{\link{getContract}},
  \code{\link[quantmod]{setSymbolLookup}},
  \code{\link{twsInstrument}},
  \code{\link{instrument_attr}}
}

