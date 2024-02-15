library(openxlsx)

#* @param f:file
#* @post /upload
function(f) {
  
  current_directory <- getwd()
  test_file_path <- file.path(current_directory, 'lic.xlsx')
  test_file_normalized_path <- normalizePath(test_file_path)
  print(test_file_normalized_path)
  writeBin(f[[1]], test_file_normalized_path)
  

  # tmp <- tempfile("plumb", fileext = paste0("_", basename(names(f))))
  # on.exit(unlink(tmp))
  # t <- readxl::read_excel(tmp)
  # nrow(t)

}
