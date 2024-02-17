
#* @filter cors
cors <- function(res) {
    res$setHeader("Access-Control-Allow-Origin", "*")
    plumber::forward()
}
# @param f:file
#* @post /upload-DDP1-AB
function(req, res) {

  original_directory <- getwd()
  on.exit(setwd(original_directory), add = TRUE)
  
  current_directory <- getwd()
  test_file_path <- file.path(current_directory,'api','Model' , 'excel data files for R code models', 'lic.xlsx')
  test_file_normalized_path <- normalizePath(test_file_path)
  writeBin(req$postBody, test_file_normalized_path)


  data_prediction_AB_path <- file.path(current_directory,'api','Model','R code model files','data prediction AB.R')
  data_prediction_AB_normalized_path <- normalizePath(data_prediction_AB_path)

  source(data_prediction_AB_normalized_path)

  current_directory <- getwd()
  result_file_path <- file.path(current_directory, 'Final_result.csv')
  result_file_normalized_path <- normalizePath(result_file_path)
  include_file(result_file_normalized_path, res, "text/csv")

}

# @param f:file
#* @post /upload-ARO-AB
function(req, res) {

  original_directory <- getwd()
  on.exit(setwd(original_directory), add = TRUE)
  
  current_directory <- getwd()
  test_file_path <- file.path(current_directory,'api','Model' , 'excel data files for R code models', 'lic.xlsx')
  test_file_normalized_path <- normalizePath(test_file_path)
  writeBin(req$postBody, test_file_normalized_path)


  ARO_AB_path <- file.path(current_directory,'api','Model','R code model files','AB data prediction for ph2 well center.R')
  ARO_AB_normalized_path <- normalizePath(ARO_AB_path)

  source(ARO_AB_normalized_path)

  current_directory <- getwd()
  result_file_path <- file.path(current_directory, 'AB_pred_result1.1.csv')
  result_file_normalized_path <- normalizePath(result_file_path)
  include_file(result_file_normalized_path, res, "text/csv")

}

# @param f:file
#* @post /upload-DDP1-SK
function(req, res) {

  original_directory <- getwd()
  on.exit(setwd(original_directory), add = TRUE)
  
  current_directory <- getwd()
  test_file_path <- file.path(current_directory,'api','Model' , 'excel data files for R code models', 'lic.xlsx')
  test_file_normalized_path <- normalizePath(test_file_path)
  writeBin(req$postBody, test_file_normalized_path)


  DDP1_SK_path <- file.path(current_directory,'api','Model','R code model files','data prediction SK.R')
  DDP1_SK_normalized_path<- normalizePath(DDP1_SK_path)

  source(DDP1_SK_normalized_path)

  current_directory <- getwd()
  result_file_path <- file.path(current_directory, 'Final_result.csv')
  result_file_normalized_path <- normalizePath(result_file_path)
  include_file(result_file_normalized_path, res, "text/csv")
}


# @param f:file
#* @post /upload-ARO-SK
function(req, res) {

  original_directory <- getwd()
  on.exit(setwd(original_directory), add = TRUE)
  
  current_directory <- getwd()
  test_file_path <- file.path(current_directory,'api','Model' , 'excel data files for R code models', 'lic.xlsx')
  test_file_normalized_path <- normalizePath(test_file_path)
  writeBin(req$postBody, test_file_normalized_path)


  ARO_SK_path <- file.path(current_directory,'api','Model','R code model files','SK data prediction for ph2 well center.R')
  ARO_SK_normalized_path <- normalizePath(ARO_SK_path )

  source(ARO_SK_normalized_path)

  current_directory <- getwd()
  result_file_path <- file.path(current_directory, 'SK_pred_result1.1.csv')
  result_file_normalized_path <- normalizePath(result_file_path)
  include_file(result_file_normalized_path, res, "text/csv")

}



# @param f:file
#* @post /upload-DDP1-BC
function(req, res) {

  original_directory <- getwd()
  on.exit(setwd(original_directory), add = TRUE)
  
  current_directory <- getwd()
  test_file_path <- file.path(current_directory,'api','Model' , 'excel data files for R code models', 'lic.xlsx')
  test_file_normalized_path <- normalizePath(test_file_path)
  writeBin(req$postBody, test_file_normalized_path)


  DDP1_BC_path <- file.path(current_directory,'api','Model','R code model files','data prediction BC.R')
  DDP1_BC_normalized_path<- normalizePath(DDP1_BC_path)

  source(DDP1_BC_normalized_path)

  current_directory <- getwd()
  result_file_path <- file.path(current_directory, 'Final_result.csv')
  result_file_normalized_path <- normalizePath(result_file_path)
  include_file(result_file_normalized_path, res, "text/csv")
}


# @param f:file
#* @post /upload-ARO-BC
function(req, res) {

  original_directory <- getwd()
  on.exit(setwd(original_directory), add = TRUE)
  
  current_directory <- getwd()
  test_file_path <- file.path(current_directory,'api','Model' , 'excel data files for R code models', 'lic.xlsx')
  test_file_normalized_path <- normalizePath(test_file_path)
  writeBin(req$postBody, test_file_normalized_path)


  ARO_BC_path <- file.path(current_directory,'api','Model','R code model files','BC data prediction for ph2 well center.R')
  ARO_BC_normalized_path <- normalizePath(ARO_BC_path )

  source(ARO_BC_normalized_path)

  current_directory <- getwd()
  result_file_path <- file.path(current_directory, 'BC_pred_result1.1.csv')
  result_file_normalized_path <- normalizePath(result_file_path)
  include_file(result_file_normalized_path, res, "text/csv")

}