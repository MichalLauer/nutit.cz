#' Read a single file using vroom::vroom. Note that the file is not read, but
#' cached using Altrep (https://svn.r-project.org/R/branches/ALTREP/ALTREP.html).
#'
#' @param file - File path to read
read_file <- function(file) {
  # Personal restrictions for my slow computer. For production, use:
  # - nm <- Inf
  # - base_skip <- 0
  nm <- 200000
  base_skip <- 0
  # Read file
  # Suppress non-important warning
  data <- suppressWarnings(
    vroom::vroom(file = file, delim = "|", col_names = F,
                 skip = base_skip, n_max = nm, comment = "#",
                 show_col_types = F)
  )

  return(data)
}
