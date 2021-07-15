#' Get datasets from the repo.
#'
#' Get all available datasets from Alphacast with your level of access in the specified repo.
#' @param api_key API Key from Alphacast. You can get it from your Settings menu on the Alphacast Web.
#' @param repo_id Must be numeric. This is the id from the repo you want to get the datasets.
#' @return A index with all datasets from the repo.
#' @examples
#' api_key = "ak_QDPD89fxwASlhWwdfeIO"
#' arg_macro_basics <- get_repos_datasets(20, api_key)
#' @export

get_repos_datasets <- function(repo_id, api_key) {
  if (is.numeric(repo_id)){
    r <- httr::GET("https://api.alphacast.io/datasets", query = list(repo_id = repo_id),
                   httr::authenticate(user = api_key, password = ""))
    r <- dplyr::bind_rows(content(r))
    r[which(r$repositoryId==repo_id), ]
  }
  else {
    return("Error: repo_id must be numeric.")
  }
}



