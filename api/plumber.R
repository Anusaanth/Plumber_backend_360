
#* @filter cors
cors <- function(res) {
    res$setHeader("Access-Control-Allow-Origin", "*")
    plumber::forward()
}
# @param f:file
#* @post /upload
function(req, res) {

  original_directory <- getwd()
  on.exit(setwd(original_directory), add = TRUE)
  
  current_directory <- getwd()
  test_file_path <- file.path(current_directory, 'Model' , 'excel data files for R code models', 'lic.xlsx')
  test_file_normalized_path <- normalizePath(test_file_path)
  print(test_file_normalized_path)
  writeBin(req$postBody, test_file_normalized_path)

  data_prediction_AB_path <- file.path(current_directory,'Model','R code model files','data prediction AB.R')
  data_prediction_AB_normalized_path <- normalizePath(data_prediction_AB_path)
  print(data_prediction_AB_normalized_path)

  source(data_prediction_AB_normalized_path)

  current_directory <- getwd()
  result_file_path <- file.path(current_directory, 'Final_result.csv')
  result_file_normalized_path <- normalizePath(result_file_path)
  include_file(result_file_normalized_path, res, "text/csv")



}

