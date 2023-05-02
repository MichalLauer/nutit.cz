# Read functions
sapply(list.files("R", full.names = T), source)
# Setup parralel computing
future::plan(strategy = future::multicore,
             workers = future::availableCores() - 1)
library(tictoc)
tic()
x <- timeseries(from = "2020-09-01", to = "2020-09-04", ticker = "0AQ03")
toc()

