# Read all functions
sapply(list.files("R", full.names = T), debugSource)
# Setup parallel computing
future::plan(strategy = future::multicore,
             workers = future::availableCores() - 1)
# Get data
data <- timeseries(from = "2020-09-01",
                    to = "2020-09-04",
                    ticker = "CLTF21",
                    row = "Q")

write.csv(data, file = "out4.csv", row.names = F)

# Save as csv
data |>
  write.csv("out3.csv", row.names = F)
# ---
