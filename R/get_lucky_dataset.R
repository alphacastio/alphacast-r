#' Get Lucky Dataset
#'
#' ¿Feelin' lucky? Get a random dataset containing one or more words you can choose to filter.
#' @param lucky_words One or more words in a vector.
#' @param alphacast_api_key API Key from Alphacast. You can get it from your Settings menu on the Alphacast Web.
#' @param long Logical. Choose between data format.
#' @return A dataset containing all the "lucky words" in the description.
#' @examples
#' alphacast_api_key = "ak_QDPD89fxwASlhWwdfeIO"
#' lucky_words <- c("mobility", "apple")
#' df <- get_lucky_dataset(lucky_words, alphacast_api_key, long = TRUE)
#' @export

get_lucky_dataset <- function(lucky_words, alphacast_api_key, long = FALSE) {
  r <- httr::GET("https://api.alphacast.io/datasets",
                 httr::authenticate(user = alphacast_api_key, password = ""))
  r <- unique(dplyr::bind_rows(httr::content(r))[ ,-5])
  r <- dplyr::filter(r, purrr::map_int(strsplit(as.character(tolower(r$name)),'[[:punct:] ]'),
                                          ~sum(unique(.) %in% tolower(lucky_words))) == length(lucky_words))
  r <- r[round(runif(1, min=1, max=nrow(r))),1]
  r <- httr::GET(paste("https://api.alphacast.io/datasets/", r,".csv", sep=""),
                 httr::authenticate(user = alphacast_api_key, password = ""))
  r <- httr::content(r)
  if (isTRUE(long)) {
    r <- reshape2::melt(r, id.vars = c("Entity", "Year"))
    r
  } else {
    r
  }
}



