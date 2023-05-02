#' Takes a table as an input and from column X3 (<SYMBOL.TICKER>) extract
#' the relevant ticker.
#' @param data - Data with NOT properly named columns
fill_ticker <- function(data) {
  # Commodity identification
  data$p1 <- stringi::stri_match(str = data$X3,
                                 regex = "(?<=:)\\w*")[,1]
  # Month identification
  data$p2 <- stringi::stri_match(str = data$X3,
                                 regex = "(?<=\\\\)[FGHJKMNQUVXZ]{1}")[,1]
  # Year identification
  data$p3 <- stringi::stri_match(str = data$X3,
                                 regex = "\\d{2}$")[,1]
  # Join parts
  data$ticker <- ifelse(data$X1 == "H",
                        yes = paste0(data$p1, data$p2, data$p3),
                        no = NA)
  # Fill NA
  data <- tidyr::fill(data, ticker)
  # Remove temp columns
  data <- data[ , -c(24, 25, 26)]
  # Return
  return(data)
}
