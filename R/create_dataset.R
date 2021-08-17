#' Create dataset.
#'
#' Easily upload a CSV file to the Alphacast platform.
#' @param dataset Path of the CSV you want to upload to Alphacast.
#' @param dataset_name Name of the dataset.
#' @param repo_id Must be numeric. This is the id from the repo you want to upload the CSV.
#' @param alphacast_api_key API Key from Alphacast. You can get it from your Settings menu on the Alphacast Web.
#' @return A dataset containing all the "lucky words" in the description.
#' @examples
#' alphacast_api_key = "ak_QDPD89fxwASlhWwdfeIO"
#' lucky_words <- c("mobility", "apple")
#' df <- get_lucky_dataset(lucky_words, alphacast_api_key, long = TRUE)
#' @export

create_dataset <- function(dataset, dataset_name, repo_id, alphacast_api_key) {

url <- "https://api.alphacast.io/datasets"
form <- list(
  "name" = dataset_name, #dataset_name
  "repositoryId" = repo_id) #repository_id

r <- httr::POST(url = url, body = form, config = httr::authenticate(user = alphacast_api_key, password = ""))

dataset_id <- httr::content(r)$id

url2 <- paste("https://api.alphacast.io/datasets/", dataset_id, "/data?deleteMissingFromDB=True&onConflictUpdateDB=True", sep = "")

r2 <- httr::PUT(url2, body = list(data = httr::upload_file(dataset)), config = httr::authenticate(user = alphacast_api_key, password = ""))
httr::content(r2)
#if (httr::content(r2)$status=="Requested") {
#  print(paste0("El dataset se creó y se subió con éxito con el id ",httr::content(r)$id," en el repo ", repo_id, "."))
#} else {
#  stop("Hubo un error.")
#}
}
