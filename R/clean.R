clean_q <- function(data) {
  # Data types
  data$`<ACTIVITY.DATETIME>` <- as.POSIXct(as.numeric(data$`<ACTIVITY.DATETIME>`))
  data$`<BID.PRICE>` <- readr::parse_number(data$`<BID.PRICE>`)
  data$`<BID.SIZE>`  <- readr::parse_integer(data$`<BID.SIZE>`)
  data$`<ASK.PRICE>` <- readr::parse_number(data$`<ASK.PRICE>`)
  data$`<ASK.SIZE>`  <- readr::parse_number(data$`<ASK.SIZE>`)

  # NA omitting
  data <- data[complete.cases(
    data[,c("<BID.PRICE>", "<BID.SIZE>", "<ASK.PRICE>", "<ASK.SIZE>")])
    , ]

  # Selecting
  data <- data[,c("<TYPE>", "<TAS.SEQ>", "<ACTIVITY.DATETIME>",
                  "<BID.PRICE>", "<BID.SIZE>", "<ASK.PRICE>", "<ASK.SIZE>")]

  return(data)
}
