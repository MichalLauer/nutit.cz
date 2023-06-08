# Read all functions
sapply(list.files("R", full.names = T), debugSource)
# Setup parallel computing
future::plan(strategy = future::multicore,
             workers = future::availableCores() - 1)
library(tictoc)
# Get data
tic()
data <- timeseries(from = "2020-09-01",
                    to = "2020-09-04",
                    ticker = "CLF21",
                    row = "Q")
toc()

# Save as csv
data[1:50000,] |>
  write.csv("out4_CLF21.csv", row.names = F)
# ---
