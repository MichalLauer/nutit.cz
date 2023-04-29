# Read functions
sapply(list.files("R", full.names = T), source)
library(tictoc)
# Prepare Parallel Processing
cores <- future::availableCores() - 1
future::plan(future::multicore, workers = cores)
# Get data
x <- timeseries(NULL, from = "2020-09-01", to = "2020-09-04", row = "Q")
# Save
x |>
  write.csv(file = "out2.csv", row.names = F)

# ------------------------------------------------------------------------------




