library(plumber)
# 'plumber.R' is the location of the file shown above
pr("plumber.R") %>%
  pr_run(port=8000)

# library(plumber) 
# r <- plumb("myfile.R")  # Where 'myfile.R' is the location of the file shown above 
# r$run(port=8000)  