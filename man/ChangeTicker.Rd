\name{ChangeTicker}
\alias{ChangeTicker}
\title{Change the Symbol of data on disk}
\usage{
  ChangeTicker(old.ticker, new.ticker,
    base_dir = "/mnt/W/")
}
\arguments{
  \item{old.ticker}{character string. The ticker the stock
  used to have}

  \item{new.ticker}{character string. The ticker the stock
  has now}

  \item{base_dir}{the base directory that contains at least
  some of the following subdirectories: BID, ASK, TRADES,
  BAT, BAM.}
}
\value{
  called for side-effect
}
\description{
  When a stock changes its ticker symbol, this function can
  be used to change the name of the ticker associated with
  the data stored on disk.
}
\details{
  This will load all data stored for \code{old.ticker} and
  change the column names to use the new ticker.  Then it
  will save a copy of the data under the new ticker.  For
  now, nothing is deleted, but in the future an argument
  may be added to allow for that.
}
\note{
  This does not do anything with the \code{.instrument}
  environment.  You should update your instruments
  separately (e.g. change the primary_id to the
  \code{new.ticker} and add \code{old.ticker} as an
  identifier of the new instrument with
  \code{\link[FinancialInstrument]{add.identifier}}
}
\examples{
\dontrun{
# If you have data stored on disk for ERTS,
# this will save a copy of it in the EA directories
ChangeTicker("ERTS", "EA", "/mnt/W/")
}
}
\author{
  Garrett See
}
\seealso{
  \code{\link{reqTBBOhistory}},
  \code{\link[FinancialInstrument]{instrument_attr}} and
  \code{\link[FinancialInstrument]{add.identifier}} for
  updating the \code{.instrument} environment (see note
  section)
}

