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
