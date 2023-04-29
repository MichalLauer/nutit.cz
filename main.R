# Read functions
sapply(list.files("R", full.names = T), source)
# Prepare Parallel Processing
cores <- future::availableCores() - 1
future::plan(future::multicore, workers = cores)

x <- timeseries(NULL, from = "2020-09-01", to = "2020-09-04", row = "Q")
x |>
  write.csv(file = "out2.csv")

# ------------------------------------------------------------------------------
library(profvis)
library(tictoc)
sapply(list.files("R", full.names = T), source)
cores <- future::availableCores() - 1
future::plan(future::multicore, workers = cores)
tic()
profvis({
  x <- timeseries(NULL, from = "2020-09-01", to = "2020-09-04", row = "Q")
})
toc()

