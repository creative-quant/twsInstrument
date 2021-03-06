\name{extract_future}
\alias{extract_future}
\title{Extract root \code{future} from \code{future_series}}
\usage{
  extract_future(x, future_id, assign_i = FALSE,
    overwrite = FALSE, identifiers = list(), ...)
}
\arguments{
  \item{x}{\code{\link[FinancialInstrument]{future_series}},
  or name of
  \code{\link[FinancialInstrument]{future_series}} from
  which to extract
  \code{\link[FinancialInstrument]{future}}}

  \item{future_id}{Can be any string to use as
  \code{primary_id} of the newly created
  \code{\link[FinancialInstrument]{future}}. Alternatively,
  it can be \dQuote{root}, \dQuote{exchange_id}, or
  \dQuote{marketName}. If \code{future_id} is missing, or
  if it is \dQuote{root}, it will become the root as
  determined by a call to
  \code{\link[FinancialInstrument]{parse_id}}.  If it is
  \dQuote{exchange_id}, or \dQuote{marketName} and either
  of those fields exist in the \code{future_series}, the
  value of that field will be used as the \code{future_id}}

  \item{assign_i}{should the future instrument be stored in
  the \code{.instrument} environment?}

  \item{overwrite}{TRUE/FALSE if an instrument already
  exists by the same name, should it be overwritten?
  (Default=FALSE)}

  \item{identifiers}{list of identifers to add to the
  \code{future}}

  \item{...}{any other parameters to pass through to
  \code{instrument}}
}
\value{
  a \code{\link[FinancialInstrument]{future}} object unless
  called with \code{assign_i=TRUE} in which case the
  \code{future} will be stored and only the
  \code{primary_id} will be returned.
}
\description{
  Construct a \code{future} from a \code{future_series}
}
\details{
  Use this if you have defined a future_series object using
  \code{define_futures}, or deleted the root \code{future}
  and you would like to define the root.
}
\examples{
\dontrun{
s <- front_future("ES")
rm_futures("ES") #delete the root that front_future automatically created
extract_future(s)
extract_future(s, extra_field="custom") # can add any extra arbitrary fields

currency(c("USD", "AUD"))
define_futures("AUD", "GLOBEX", "201112", include_expired=1)
extract_future("AUD_Z1") # not assigned
extract_future("AUD_Z1", assign_i=TRUE) #root stored in "..AUD"
getInstrument("AUD") #Oh no, that's the curreny
getInstrument("AUD", type='future') #specify type to get the root

extract_future("AUD_Z1", future_id='X6A', assign_i=TRUE, identifiers=list(CME='6A'))
getInstrument("6A")

# The next line would replace "AUD" the currency with a future
# extract_future("AUD_Z1", future_id='AUD', assign_i=TRUE, identifiers=list(CME='6A'), overwrite=TRUE)
}
}
\author{
  Garrett See
}
\seealso{
  \code{\link[FinancialInstrument]{instrument}},
  \code{\link[FinancialInstrument]{future}},
  \code{\link[FinancialInstrument]{future_series}}
}

