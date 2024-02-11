#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg="") {
    # Create a data frame with two columns and 5 rows
    data <- data.frame(lic = rep(1, 5), uwi = rep(1, 5))

    # Write the data frame to a CSV file
    current_directory <- getwd()
    setwd(current_directory)
    output_file_path <- file.path(current_directory,'output_file.csv')
    output_file_normalized_path <- normalizePath(output_file_path )
    print(output_file_path)
    write.csv(data, output_file_normalized_path, row.names = FALSE)
    list(msg = paste0("The message is: '", msg, "'"))

    ################################## Test Data Loading #################################
    library(reticulate)
    library(dplyr)
    library(readxl)
    library(writexl)
    library(stringi)

    current_directory <- getwd()
    python_folder_path <- file.path(current_directory,'Python file for Cartofact data extracting')
    python_code_normalized_path <- normalizePath(python_folder_path)
    setwd(python_code_normalized_path)
        
    ###Obtain attributes from CARTOFACT.com using Python
    python_path <- file.path(current_directory,'Python', 'Python312')
    use_python(python_path)


    #Select the attributes
    attribute <- c('licence','uwi_formatted',
                'spud_date','cumulative_oil_production_m3',
                'cumulative_gas_production_e3m3','cumulative_water_production_m3',
                'cumulative_condensate_production_bbl','completion_interval_bottom',
                'prod_ip3_oil_bbld','prod_ip3_gas_mcfd',
                'ground_elevation','status_full',
                'llr_abandonment_area_name','surf_aband_date',
                'tv_depth','well_total_depth',
                'field_name','last_production_date',
                'prod_ip3_boe_boed','prod_mr3_wtr_bbld',
                'prod_mr3_oil_bbld')
    table <- c('live_well_ab')
    at_table <- as.data.frame(cbind(attribute,table))
    attable_path <- file.path(current_directory,'Python file for Cartofact data extracting', "at_table.xlsx")
    attable_file_normalized_path <- normalizePath(attable_path)
    write_xlsx(at_table, attable_file_normalized_path)



    #Obtain the attributes
    library(reticulate)



    # Specify the path to your Python file with spaces, escaping the spaces with a backslash
    python_extracting_cartofact_path <- file.path(python_folder_path,'extracting cartofact attributes.py')
    extracting_cartofact_normalized_path <- normalizePath(python_extracting_cartofact_path)
    py_run_file(extracting_cartofact_normalized_path)

        


}