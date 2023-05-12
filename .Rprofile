source("renv/activate.R")
setHook("rstudio.sessionInit", function(newSession) {
  with(data = NULL, expr = {
    library(rstudioapi)
    # Kill all terminals
    terminalKill(terminalList())
    # Open new terminal
    invisible(terminalCreate(caption = "Git Bash",
                             show = T,
                             shellType = "win-git-bash"))
  })
}, action = "append")
