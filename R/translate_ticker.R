translate_ticker <- function(ticker) {
  f <- substr(ticker, 1, 2)
  m <- substr(ticker, 3, 3)
  y <- substr(ticker, 4, nchar(ticker))

  # Translate month
  indices <- list(
    "F" = "January",
    "G" = "February",
    "H" = "March",
    "J" = "April",
    "K" = "May",
    "M" = "June",
    "N" = "July",
    "Q" = "August",
    "U" = "September",
    "V" = "October",
    "X" = "November",
    "Z" = "December")
  month <- indices[[m]]
  # If month does not exist
  if (is.null(month)) stop(paste0("Month '", m, "' does not exist."))

  # Fill year, expecting years only > 2000
  year <- if (nchar(y) == 2) paste0("20", y) else paste0("200", y)
  r <- list(
    future = f,
    month = month,
    year = year
  )

  return(r)
}
