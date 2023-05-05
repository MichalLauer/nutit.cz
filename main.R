# Read all functions
sapply(list.files("R", full.names = T), debugSource)
# Setup parallel computing
future::plan(strategy = future::multicore,
             workers = future::availableCores() - 1)
# Get data
(data <- timeseries(from = "2020-09-01",
                    to = "2020-09-04",
                    ticker = "CL",
                    row = NULL
))[,c(1,2,3,24)]
# Save as csv
data |>
  write.csv("out3.csv", row.names = F)



#-----------------
data |>
  dplyr::filter(!is.na(X1))
data[NA,]

data.frame(a = c(3, 2, 4, 5), b = c(2,5,4,8))[c(1,2,3,NA), ]
