#' Get the API key from the environment
#' @return The API key
get_api_key <- function(
) {
  api_key <- Sys.getenv("WORKSHOP_KEY")
  if (nchar(api_key) > 1) {
    api_key
  } else {
    stop("WORKSHOP_KEY not set as an environment variable.")
  }
}

#' Make an endpoint.
#' @param ... The parts of the endpoint.
#' @return The endpoint.
make_endpoint <- function(
  ...
) {
  endpoint_path <- paste(c(...), collapse = "/")
  api_path <- Sys.getenv("API_PATH")
  if (nchar(api_path) > 1) {
    glue::glue("{api_path}{endpoint_path}")
  } else {
    stop("API_PATH not set as an environment variable.")
  }
}

#' Process an API request.
#' @param endpoint The endpoint to process.
#' @return The response from the API.
process_api <- function(
  endpoint = NULL,
  ...
) {
  httr2::request(make_endpoint(endpoint)) |>
    httr2::req_headers(
      accept = "*/*",
      `X-WORKSHOP-KEY` = get_api_key(),
    ) |>
    httr2::req_url_query(
      ...
    ) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}