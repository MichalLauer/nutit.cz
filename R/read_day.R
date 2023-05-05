#' Reads a single file (e.g. day).
#'
#' @param date - Date to read
#' @param ticker - Ticker to get. If NULL, no filtering based on ticker is performed
#' @param row - Row ID to filter on. If NULL, no filtering based on row is performed
#' @param root_dir - Root directory which contains the main folder structure.
#'        Default value E: can be represented as, for example:
#'         - E:\2020\09\01\S686\STD\PLUSTICK_PLUSTICK_FUTURES_686_20200901.txt.gz
read_day <- function(date, ticker, row, root_dir = "E:") {
  # File to read
  file_name <- paste0("PLUSTICK_FUTURES_686_", format(date, "%Y%m%d"), ".txt.gz")
  # Build path
  path <- paste(root_dir,
                format(date, "%Y"),
                format(date, "%m"),
                format(date, "%d"),
                "S686",
                "STD",
                file_name,
                sep = "/")
  # Check if file exists
  if (!file.exists(path)) stop(paste0("File '", path, "' does not exist."))
  # Read data
  data <- read_file(path)
  # Add ticker
  data <- fill_ticker(data)
  # Filter for ticker
  if (!is.null(ticker)) {
    pattern <- paste0("^", ticker)
    data <- data[stringr::str_detect(string = data$ticker,
                                     pattern = pattern) & !is.na(data$ticker), ]
  }
  # Filter for row
  if (!is.null(row)) {
    # Filter
    data <- data[data$X1 == row, ]
    # Get names, select relevant columns, rename
    names <- get_names(row)
    data <- data[, c(seq_along(names), ncol(data))]
    colnames(data) <- c(names, "<TICKER>")
  }
  # return
  return(data)
}



