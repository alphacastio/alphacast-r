% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_dataframe.R
\name{get_dataframe}
\alias{get_dataframe}
\title{Get dataframe}
\usage{
get_dataframe(dataset_id, alphacast_api_key, long = FALSE)
}
\arguments{
\item{dataset_id}{Dataset ID. It must be numeric.}

\item{alphacast_api_key}{API Key from Alphacast. You can get it from your Settings menu on the Alphacast Web.}

\item{long}{Logical. Choose between data format.}
}
\value{
A dataframe with dates, entity and data.
}
\description{
Get a specified dataset in dataframe format directly from Alphacast API.
}
\examples{
alphacast_api_key = "ak_QDPD89fxwASlhWwdfeIO"
resultad_fiscal <- get_dataframe(5542, alphacast_api_key);
}
