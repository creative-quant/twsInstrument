\name{getIBEquities}
\alias{getIBEquities}
\title{requests historical data for stocks from IB}
\usage{
  getIBEquities(symbols, tws, barSize = "1 min",
    duration = "5 D", env = .GlobalEnv)
}
\arguments{
  \item{symbols}{character vector}

  \item{tws}{twsConnection object}

  \item{barSize}{see details for valid values}

  \item{duration}{timespan request covers}

  \item{env}{environment to put data in; also the
  environment to look for twsConnection object if not
  supplied}
}
\value{
  called for its side effect
}
\description{
  A wrapper to request historical data for several symbols
  at once
}
\details{
  gets Open, High, Low, Close, Volume, etc. for TRADES

  The below is taken from reqHistoricalData help page, see
  that help for more.

  Legal \code{barSize} settings are \sQuote{1
  secs},\sQuote{5 secs},\sQuote{15 secs}, \sQuote{30
  mins},\sQuote{1 min},\sQuote{2 mins}, \sQuote{3
  mins},\sQuote{5 mins},\sQuote{15 mins}, \sQuote{30
  mins},\sQuote{1 hour},\sQuote{1 day}, \sQuote{1
  week},\sQuote{1 month},\sQuote{3 months}, and \sQuote{1
  year}.

  The duration string must be of the form \sQuote{n S}
  where the last character may be any one of \sQuote{S}
  (seconds), \sQuote{D} (days), \sQuote{W} (weeks),
  \sQuote{M} (months), and \sQuote{Y} (year). At present
  the limit for years is 1.
}
\examples{
\dontrun{
getIBEquities(c('SPY','DIA'))
}
}
\author{
  Garrett See
}
\seealso{
  reqHistoricalData, reqHistory, getBAT, getBAThistory
}

