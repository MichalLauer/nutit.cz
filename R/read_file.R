read_file <- function(file, row) {
  # Personal restrictions
  nm <- 100
  base_skip <- 1000000
  # Read only the first character -> the identifier of row
  identity <- vroom::vroom_fwf(file = file, n_max = nm, show_col_types = F,
                               col_positions = vroom::fwf_positions(1, 1),
                               # No need to lazy-load this
                               altrep = F, skip = base_skip)
  # Identify rows which start with a given identifier
  rows <- grep(row, identity[[1]], fixed = T, useBytes = T)
  # No record has been found
  if (length(rows) == 0) return(NULL)
  # 'Normalize' rows for skipping
  rows_0 <- rows - min(rows) + 1
  # Read all data starting at min(rows) - 1
  data_all <- vroom::vroom_lines(file = file,
                                 # Skip first min(rows) rows, e.g.,
                                 # skip unused rows
                                 skip = base_skip + min(rows) - 1,
                                 n_max = max(rows_0),
                                 altrep = F)
  # Extract only useful rows
  data <- suppressWarnings(data_all[rows_0])

  # Check that everything has been loaded
  if (length(rows) != length(data)) stop('Lengths do not match.')

  # Get column names
  cols <- get_names(row)

  # Convert rows into a table
  data_converted <-
    data |>
    stringi::stri_split_fixed("|") |>
    unlist() |>
    matrix(ncol = length(cols), byrow = T) |>
    tibble::as_tibble(.name_repair = \(x) cols)

  return(data_converted)
}
