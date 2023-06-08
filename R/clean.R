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
                  "<ASK.PRICE>", "<ASK.SIZE>", "<BID.PRICE>", "<BID.SIZE>")]
  # NA omitting
  data <- data[complete.cases(data), ]
  # To number
  data$`<TAS.SEQ>` <- as.integer(data$`<TAS.SEQ>`)
  data$`<ASK.PRICE>` <- as.double(data$`<ASK.PRICE>`)
  data$`<ASK.SIZE>` <- as.integer(data$`<ASK.SIZE>`)
  return(data)
}
