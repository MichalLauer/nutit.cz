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

# ------------
sapply(list.files("R", full.names = T), source)
library(tictoc)
tic()
file <- "F:/2020/09/01/S686/STD/PLUSTICK_FUTURES_686_20200901.txt.gz"
x <- vroom::vroom(file, delim = "|", col_names = F,
                  skip = 1000000,
                  n_max = 50,
                  comment = "#")
x <- subset(x, X1 == "Q")
colnames(x) <- get_names("Q")
x <- clean_q(x)
toc()
asd
