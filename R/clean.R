#' Functions that take as an input a table with NAMED columns and cleans them
#' based on the selected row. For example:
#'  - Reading row Q -> clean_q
#'
#' @param data: Data with properly named columns
clean_q <- function(data) {
  # Data types
  data$`<ACTIVITY.DATETIME>` <- as.POSIXct(as.numeric(data$`<ACTIVITY.DATETIME>`))
  # Selecting
  data <- data[,c("<TYPE>", "<TICKER>", "<TAS.SEQ>", "<ACTIVITY.DATETIME>",
                  "<BID.PRICE>", "<BID.SIZE>")]
  # NA omitting
  data <- data[complete.cases(data), ]
  return(data)
}
