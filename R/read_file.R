read_file <- function(file, row) {
  # Personal restrictions
  nm <- 100
  base_skip <- 1000000
  # Read file
  raw_data <- vroom::vroom(file = file, delim = "|", col_names = F,
                           skip = base_skip, n_max = nm, comment = "#",
                           show_col_types = F)

  # Subset for specific row
  data <- subset(raw_data, X1 == row)

  # Rename data set
  cols <- get_names(row)
  colnames(data) <- cols

  return(data)
}
