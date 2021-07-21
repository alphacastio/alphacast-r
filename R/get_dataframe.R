#' Get dataframe
#'
#' Get a specified dataset in dataframe format directly from Alphacast API.
#' @param dataset_id Dataset ID. It must be numeric.
#' @param alphacast_api_key API Key from Alphacast. You can get it from your Settings menu on the Alphacast Web.
#' @param long Logical. Choose between data format.
#' @return A dataframe with dates, entity and data.
#' @examples
#' alphacast_api_key = "ak_QDPD89fxwASlhWwdfeIO"
#' resultad_fiscal <- get_dataframe(5542, alphacast_api_key);
#' @export

#' alphacast_api_key <- "ak_JGzP3xTSrj9e29e5bVCq"

get_dataframe <- function(dataset_id, alphacast_api_key, long = FALSE) {
  if (is.numeric(dataset_id)){
    r <- httr::GET(paste("https://charts.alphacast.io/api/datasets/", dataset_id,".csv", sep=""),
                    httr::authenticate(user = alphacast_api_key, password = ""))
  r <- content(r)
   if (isTRUE(long)) {
     r <- reshape2::melt(r, id.vars = c("Entity", "Year"))
     r
   } else {
     r
   }
  }
  else {
    return("Error: dataset_id must be numeric.")
  }
}

