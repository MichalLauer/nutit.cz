#' Functions that take as an input a table with NAMED columns and cleans them
#' based on the selected row. For example:
#'  - Reading row Q -> clean_q
#'
#' @param data: Data with properly named columns
clean_q <- function(data) {
  # Data types
  data$`<ACTIVITY.DATETIME>` <- as.POSIXct(as.numeric(data$`<ACTIVITY.DATETIME>`))
  # NA omitting
  data <- data[complete.cases(
    data[,c("<BID.PRICE>", "<BID.SIZE>", "<ASK.PRICE>", "<ASK.SIZE>")])
    , ]
  # Selecting
  data <- data[,c("<TYPE>", "<TAS.SEQ>", "<ACTIVITY.DATETIME>",
                  "<BID.PRICE>", "<BID.SIZE>", "<ASK.PRICE>", "<ASK.SIZE>")]

  return(data)
}
