#' Returns column names based on the selected row.
#'
#' @param row - Row ID
get_names <- function(row) {
  def <- list(
    # Transaction
    "Q" = c("<TYPE>","<TAS.SEQ>","<RNR.END.EXCH.SEQ>","<ACTIVITY.DATETIME>",
            "<BID.PRICE>","<BID.SIZE>","<ASK.PRICE>","<ASK.SIZE>",
            "<QUOTE.COND_1>","<PART.CODE>","<QUOTE.DATETIME>",
            "<EXCH.MESSAGE.TIMESTAMP>","<IMPLIED.BID.SIZE>",
            "<IMPLIED.ASK.SIZE>","<RFQ.SIZE>","<RFQ.SIDE>","<END.UPDATE.FLAG>"),
    # Ticker identification
    "H" = c("<TYPE>","<ENUM.SRC.ID>","<SYMBOL.TICKER>","<CURRENCY.STRING>",
            "<ISIN>", "<SEDOL>","<CUSIP>","<DISPLAY.PRECISION>","<TRADE.OPEN>",
            "<OPEN_INT>","<YEST.TRADE.CLOSE>","<YEST.TRADE.VOL>",
            "<SETTLE.DATE>","<SETTLE.PRICE>","<EXPIRATION.DATE>",
            "<FRONT.MONTH.CONTRACT>","<ENUM.INSTR.TYPE>","<LOT.SIZE>",
            "<CONTRACT.SIZE>","<VARIABLE.TICK.SIZE>","<MKT.SEGMENT>",
            "<SETTLE.IND>","<SETTLEMENT.CURRENCY>"),
    "T" = c("<TYPE>","<TAS.SEQ>","<RNR.END.EXCH.SEQ>","<ACTIVITY.DATETIME>",
            "<TRADE.PRICE>","<TRADE.SIZE>","<TRADE.COND_1>","<PART.CODE>",
            "<VWAP>","<TRADE.DATETIME>","<EXCH.MESSAGE.TIMESTAMP>",
            "<TRADE.COND_2>","<TRADE.COND_3>","<TRADE.OFFICIAL.TIME>",
            "<TRADE.COND_4>","<TRADE.COND_5>","<EXTENDED.TRADE.COND>",
            "<TRADE.OFFICIAL.DATE>","<RETRANSMISSION.FLAG>"),
    "B" = c("<TYPE>","<TAS.SEQ>","<RNR.END.EXCH.SEQ>","<ACTIVITY.DATETIME>",
            "<BID.PRICE>","<BID.SIZE>","<BID.PART.CODE>","<ASK.PRICE>",
            "<ASK.SIZE>","<ASK.PART.CODE>","<EXCH.MESSAGE.TIMESTAMP>"),
    "S" = c("<TYPE>","<TAS.SEQ>","<ACTIVITY.DATETIME>","<TRADABLE.STATUS>",
            "<MARKET.PHASE>","<EXCH.MESSAGE.TIMESTAMP>","<STATUS.START.DATE>")
  )

  r <- def[[row]]
  if (is.null(r)) stop("Row is not defined.")
  else return(r)
}


# "<TAS.SEQ>|<ACTIVITY.DATETIME>|<TRADABLE.STATUS>|<MARKET.PHASE>|<EXCH.MESSAGE.TIMESTAMP>|<STATUS.START.DATE>" |>
#   strsplit("|", fixed = T) |>
#   {\(x) x[[1]]}() |>
#   paste(collapse = r'(",")')
