#' Get repositories
#'
#' Get all available repositories from Alphacast with your level of access.
#' @param alphacast_api_key API Key from Alphacast. You can get it from your Settings menu on the Alphacast Web.
#' @return A index with all available repos.
#' @examples
#' api_key = "ak_QDPD89fxwASlhWwdfeIO"
#' repos_alphacast <- get_repos(api_key)
#' @export

get_repos <- function(alphacast_api_key) {
  r <- httr::GET("https://api.alphacast.io/repositories",
                 httr::authenticate(user = alphacast_api_key, password = ""))
  unique(dplyr::bind_rows(content(r)))
}

