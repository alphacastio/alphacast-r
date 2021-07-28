#' Create repos.
#'
#' Create a repository in Alphacast environment with your API Key.
#' @param alphacast_api_key API Key from Alphacast. You can get it from your Settings menu on the Alphacast Web.
#' @param repo_name Name of the repo you want to create.
#' @param description Short description of the new repo.
#' @param private Logical. If FALSE, the repo is public. If TRUE, the repo is private. Default: TRUE.
#' @param slug Short name of the repo. It can't contain spaces or mayus. It is going to be a part of the repo's URL. Example: my-private-repo.
#' @return Creates a repo.
#' @examples
#' alphacast_api_key = "ak_QDPD89fxwASlhWwdfeIO"
#'
#' @export

create_repo <- function(repo_name, description, private = TRUE, slug, alphacast_api_key) {
url <- "https://api.alphacast.io/repositories"
if (isTRUE(private)) {
form <- list(
  "name" = repo_name,
  "description" = description,
  "privacy" = "Private",
  "slug" = slug)
} else {
  form <- list(
    "name" = repo_name,
    "description" = description,
    "privacy" = "Public",
    "slug" = slug)
}
r <- httr::POST(url = url, body = form, config = httr::authenticate(user = alphacast_api_key, password = ""))
httr::content(r)
}


