#' Get a time series for a given date range, ticker and row.
#'
#' @param from First date.
#' @param to Last date. If not provided, only one day (the 'from' date) is extracted.
#' @param ticker - Ticker to get. If NULL, no filtering based on ticker is performed.
#' The ticker does not have to be specified in full, for example:
#'   - 'CL' -> match any ticker that starts with CL
#'   - 'CLZ' -> match any ticker that starts with CL and ens in December
#' Regex used is: paste0("^", ticker)
#' @param row - Row ID to filter on. If NULL, no filtering based on row is performed.
timeseries <- function(from, to = from, ticker = NULL, row = NULL) {
  # Transform dates
  pfrom <- strptime(from, format = "%Y-%m-%d")
  pto   <- strptime(to, format = "%Y-%m-%d")
  dates <- seq(from = pfrom, to = pto, by = "days")

  # Read data for given days and row; join them together
  data <-
    furrr::future_map(.x = dates, .f = \(x) read_day(x, ticker, row)) |>
    purrr::list_rbind()

  # If row = NULL, skip data cleaning and return raw data
  if (is.null(row)) return(data)

  # Clean the data based on the row defined
  # If function does not exists, return raw data
  fx <- paste0("clean_", tolower(row))
    if (!exists(fx)) {
    warning(glue::glue("Function {fx} is not defined.\n",
                       "  Returing a raw data set for function creation."))
    return(data)
  }
  data_clean <- do.call(fx, list(data = data))

  return(data_clean)
}

