\name{define_stocks}
\alias{define_stocks}
\title{Define stocks}
\usage{
  define_stocks(x = SP500desc, currency = "USD",
    file = NULL, use.yahoo = TRUE, use.IB = TRUE,
    addIBslot = TRUE)
}
\arguments{
  \item{x}{vector of instrument names, a data.frame, or a
  file. See details}

  \item{file}{Optional filename including path. if given,
  file will be read with read.csv. See details.}

  \item{use.yahoo}{Boolean. Should extra descriptive data
  be dowloaded from yahoo?}

  \item{use.IB}{Boolean. Should extra descriptive data and
  twsContract be downloaded from IB.}

  \item{addIBslot}{Boolean. Should the twsContract be added
  to the IB slot of instrument.}

  \item{currency}{the currency of the stocks. Can be left
  null}
}
\value{
  called for its side-effect.
}
\description{
  define stocks from a file or object
}
\details{
  Creates stock instruments

  If \code{file} is given, \code{x} will be ignored, and
  file will be read by read.csv If \code{file} is not
  provided, \code{x} will be used.

  \code{x} can be a vector of stock tickers or a
  data.frame.

  The file, or data.frame should contain contain a column
  for each of sQuotesymbol, sQuotedescription,
  sQuoteindustry.division, sQuoteindustry.group, and
  sQuoteindustry.sector.

  In addition to the information provided by the file or
  data.frame, if use.yahoo is set to TRUE, other
  descriptive data will be downloaded from Yahoo Finance
  via a call to getQuote.  These include: exchange,
  market.cap, avg.volume, EPS, EPS Estimate Current Year,
  EPS Estimate Next Year, book.value, EBITDA, and 52 week
  range.

  If use.IB is TRUE, it will add descriptive information
  from Interactive Brokers to the instruments.  Also, it
  will turn your instruments into twsInstruments, which
  just means that it will add an IB slot to the instruments
  and put their twsContracts in them.

  Currency can be left null if use.IB is true -- if using
  this package's version of the instrument function -- in
  which case, the currency will be determined by a call to
  IB via reqContractDetails.  If called with a currency
  that does not exist, it will be created.  (be careful,
  because there is no check to see if it is a valid
  currency...if you called it with \code{currency="BLAH"}
  it would create a BLAH currency).

  A slot will be added to the instrument describing how the
  instrument was defined, it will the name of the file or
  data.frame used, or one of sQuoteIB, sQuoteyahoo, or, if
  only a vector of symbols is given and \code{use.IB=FALSE}
  and \code{use.yahoo=FALSE} are used, sQuotehand. OR, a
  combination of those that were used separated by a
  semi-colon.
}
\note{
  \code{use.IB} should probably be FALSE if you are
  defining a large number of stocks. Running this function
  with \code{use.IB=TRUE} for a large number of stocks may
  cause a writeBin error
}
\examples{
\dontrun{
define_stocks(c('S','EE','SE','E'),"USD")

#stocks with different currencies
define_stocks(c('G','ARR','SEE','GSE'))
ls_currencies() #defined for us by define_stocks.

define_stocks(use.yahoo=FALSE,use.IB=FALSE,currency="USD") #uses SP500desc data.frame
define_stocks(use.IB=FALSE,currency="USD")
define_stocks(use.yahoo=FALSE)
define_stocks(currency="USD")
}
}
\author{
  Garrett See
}
\references{
  Yahoo! Finance \url{finance.yahoo.com} gummy-stuff.org
  \url{www.gummy-stuff.org/Yahoo-data.htm}
  InteractiveBrokers \url{www.interactivebrokers.com} IB
  API
  \url{http://interactivebrokers.com/php/apiUsersGuide/apiguide.htm}
}
\seealso{
  instrument, stock, update_instruments.yahoo,
  update_instruments.IB, yahooQF, getQuote, getQuote.yahoo,
  read.csv
}
\keyword{instrument}

