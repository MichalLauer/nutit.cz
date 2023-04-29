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
  fx <- paste0("clean_", tolower(row))
  data_clean <- do.call(fx, list(data = data))

  return(data_clean)
}
