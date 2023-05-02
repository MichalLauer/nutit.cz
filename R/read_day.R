read_day <- function(date, row, root_dir = "E:") {
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
  # Check if exists
  if (!file.exists(path)) stop(paste0("File '", path, "' does not exist."))
  # Read data
  data <- read_file(path, row)

  return(data)
}
