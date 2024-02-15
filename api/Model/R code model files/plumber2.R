#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg="") {
    current_directory <- getwd()
    test_file_path <- file.path(current_directory,'test_file.R')
    test_file_normalized_path <- normalizePath(test_file_path)
    print(test_file_normalized_path)

    source(test_file_normalized_path)
    list(msg = paste0("The message is: '", msg, "'"))
        
}