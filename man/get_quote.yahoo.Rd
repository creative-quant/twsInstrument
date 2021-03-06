\name{get_quote.yahoo}
\alias{get_quote.yahoo}
\title{Download current instrument quote from yahoo...}
\usage{
  get_quote.yahoo(Symbols, what = standardQuote(),
    waitTime = 30, ...)
}
\arguments{
  \item{Symbols}{Can be a vector of instrument names, or a
  character string of symbols, separated by semi-colons.}

  \item{what}{what should be retrieved}

  \item{waitTime}{time in seconds that is the longest
  you're willing to wait to get back a quote with a valid
  timestamp.}

  \item{\dots}{args to pass to
  \code{\link[FinancialInstrument]{getSymbols.FI}}}
}
\value{
  a data frame with rows matching the number of Symbols
  requested, and the columns matching the requested
  columns.
}
\description{
  Download current instrument quote from yahoo
}
\details{
  This \code{get_quote.yahoo} method is the same as Jeff
  Ryan's code for getQuote.yahoo (see also) except for two
  differences.  First, the quote requests are wrapped in a
  while loop.  If the timestamp of the receied quote has a
  year that is different than the current year (as reported
  by \code{Sys.time()}), it will keep trying until either
  the year in the quote is the same as the current year, or
  \code{waitTime} has passed. Thanks to Zachary Mayar for
  suggesting the change, and Samo Pahor for providing the
  specific patch for this code.  Second, if the
  \code{Symbols} are defined \code{instrument}s that have a
  \sQuote{yahoo} identifier.
}
\examples{
\dontrun{
ibak <- as.list(FinancialInstrument:::.instrument) #backup instruments
rm_instruments()
# create some instruments and give them 'yahoo' identifiers
synthetic("SPX", currency("USD"), identifiers=list(yahoo="^GSPC"))
future("ES", currency("USD"), multiplier=50, underlying_id="SPX")
## figure out front month contract for ES
(fid <- future_id("ES", format(Sys.Date(), "\%b"), format(Sys.Date(), "\%y")))
(yahooid <- paste(format_id(fid, sep=""), "CME", sep="."))
## define future_series, adding yahoo identifier
future_series(fid, identifiers=list(yahoo=yahooid))
s <- c("SPX", "SPY", "ES_M12")
get_quote.yahoo(s)
get_quote(s, src='yahoo') #same
## restore previous instrument environment
reloadInstruments(ibak)
}
}
\references{
  \url{http://r.789695.n4.nabble.com/getQuote-problem-tt3689746.html}
}
\seealso{
  \code{\link[quantmod]{getQuote}},
  \code{\link{get_quote.IB}}
}

