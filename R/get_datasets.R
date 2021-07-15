#' Get datasets index
#'
#' Get all available datasets from Alphacast with your level of access.
#' @param api_key API Key from Alphacast. You can get it from your Settings menu on the Alphacast Web.
#' @return A index with all available datasets.
#' @examples
#' api_key = "ak_QDPD89fxwASlhWwdfeIO"
#' datasets_alphacast <- get_datasets(api_key)
#' @export

get_datasets <- function(api_key) {
    r <- httr::GET("https://charts.alphacast.io/api/datasets",
                   authenticate(user = api_key, password = ""))
    unique(dplyr::bind_rows(content(r))[ ,-5])
}

