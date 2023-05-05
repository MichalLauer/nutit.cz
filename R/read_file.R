#' Read a single file using vroom::vroom. Note that the file is not read, but
#' cached using Altrep (https://svn.r-project.org/R/branches/ALTREP/ALTREP.html).
#'
#' @param file - File path to read
read_file <- function(file) {
  # Personal restrictions for my slow computer. For production, use:
  # - nm <- Inf
  # - base_skip <- 0
  base_skip <- 0
  nm <- base_skip+200000
  # Read file
  # Suppress non-important warning
  data <- vroom::vroom(file = file, delim = "|", col_names = F,
                 skip = base_skip, n_max = nm, comment = "#",
                 col_types = vroom::cols(.default = vroom::col_character()),
                 show_col_types = F)
  # Default tibble which will be used because sometimes, the first row
  # does not contain all 23 columns
  data_all <- dplyr::as_tibble(matrix(character(), nrow = 0, ncol = 23),
                               .name_repair = \(x) paste0("X", 1:23))
  data_all <-  suppressWarnings(dplyr::bind_rows(data_all, data))

  return(data_all)
}
