timeseries <- function(ticker, from, to = from, row) {
  # Transform dates
  pfrom <- strptime(from, format = "%Y-%m-%d")
  pto   <- strptime(to, format = "%Y-%m-%d")
  dates <- seq(from = pfrom, to = pto, by = "days")

  # Read data for given days and row; join them together
  data <-
    furrr::future_map(.x = dates, .f = \(x) read_day(x, row)) |>
    purrr::list_rbind()

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
