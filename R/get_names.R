get_names <- function(row) {
  def <- list(
    "Q" = c("<TYPE>","<TAS.SEQ>","<RNR.END.EXCH.SEQ>","<ACTIVITY.DATETIME>",
            "<BID.PRICE>","<BID.SIZE>","<ASK.PRICE>","<ASK.SIZE>",
            "<QUOTE.COND_1>","<PART.CODE>","<QUOTE.DATETIME>",
            "<EXCH.MESSAGE.TIMESTAMP>","<IMPLIED.BID.SIZE>",
            "<IMPLIED.ASK.SIZE>","<RFQ.SIZE>","<RFQ.SIDE>","<END.UPDATE.FLAG>")
  )

  r <- def[[row]]
  if (is.null(r)) stop("Row is not defined.")
  else return(r)
}


# "<TYPE>|<TAS.SEQ>|<RNR.END.EXCH.SEQ>|<ACTIVITY.DATETIME>|<BID.PRICE>|<BID.SIZE>|<ASK.PRICE>|<ASK.SIZE>|<QUOTE.COND_1>|
# <PART.CODE>|<QUOTE.DATETIME>|<EXCH.MESSAGE.TIMESTAMP>|<IMPLIED.BID.SIZE>|<IMPLIED.ASK.SIZE>|<RFQ.SIZE>|<RFQ.SIDE>|<END.UPDATE.FLAG>" |>
#   strsplit("|", fixed = T) |>
#   {\(x) x[[1]]}() |>
#   paste(collapse = r'(",")')
