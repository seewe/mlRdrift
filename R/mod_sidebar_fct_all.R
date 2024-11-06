#' some global variables

link_github <- tags$a(
  shiny::icon("github"), "Github",
  href = "https://github.com/seewe/mlRdrift",
  target = "_blank"
)
link_shiny <- tags$a(
  shiny::icon("github"), "Shiny",
  href = "https://github.com/rstudio/shiny",
  target = "_blank"
)
link_posit <- tags$a(
  shiny::icon("r-project"), "Posit",
  href = "https://posit.co",
  target = "_blank"
)


#' Variables names of a data.frame
#' @title var_names
#' @description
#' A function which return the names of all variables in a dataframe
#' 
#' @param input_data The data frame from which user need to have the variables names
#' @returns a character vector of variables names
#' 
#' @examples
#' var_names(iris)
#' var_names(mtcars)

var_names <- function(input_data){
  
  if(nrow(input_data) == 0){
    out <- names(input_data)
  }else{
    out <- c("no variable in the data")
  }
  
  return(out)
}


#' Skim a dataset and return only numeric variables characteristics
#' @param the_data Data on which the skim function will apply the description on numeric variables
#' @returns a data.frame object containing description of all numeric (doucle or integer) variable in the input data.
#' @examples
#' skim_num(iris)
#' skim_num(mtcars)
#' 
#' @export

skim_num <- function(the_data){
  out <- skimr::skim(the_data) %>% 
    as.data.frame() %>% 
    filter(!is.na(`numeric.mean`))
  
  if(nrow(out)>0){
    out <- out %>% 
      select(Variable = skim_variable, Type = skim_type, complete_rate, Distribution = numeric.hist)
  }else{
    out <- data.frame()
  }
  
  return(out)
}

#' Skim a dataset and return only characters variables characteristics
#' @param the_data Data on which the skim function will apply the description on character variables
#' @returns a data.frame object containing description of all character (factor, character or date) variable in the input data.
#' @examples
#' skim_char(iris)
#' skim_char(mtcars)
#' 
#' @export

skim_char <- function(the_data){
  out <- skimr::skim(the_data) %>% 
    as.data.frame() %>% 
    filter(is.na(`numeric.mean`))
  
  if(nrow(out)>0){
    out <- out %>% 
      select(Variable = skim_variable, Type = skim_type, complete_rate, ends_with(".n_unique"))
  }else{
    out <- data.frame()
  }
  return(out)
}



#' Detect common variables in two dataset
#' @param df1 the first dataset to use
#' @param df2 The second dataset to use
#' @returns a Character vector containing all variables names in both df1 and df2
#' @examples 
#' same_variables(iris, iris)
#' same_variables(mtcars, mtcars)
#' @export

same_variables <- function(df1, df2){
  
  num_var_df1 <- skim_num(df1)
  num_var_df2 <- skim_num(df2)
  char_var_df1 <- skim_char(df1)
  char_var_df2 <- skim_char(df2)
  
  if(ncol(num_var_df1)>0 & ncol(num_var_df2)>0){
    # All same numeric variables
    num_var_df1 <- skim_num(df1) %>% select(Variable, Type) %>% ungroup()
    num_var_df2 <- skim_num(df2) %>% select(Variable, Type) %>% ungroup()
    all_num <- num_var_df1 %>% 
      inner_join(num_var_df2, by = c("Variable", "Type")) %>% 
      select(Variable)
  }else{
    all_num <- data.frame()
  }
  
  if(ncol(char_var_df1)>0 & ncol(char_var_df2)>0){
    # All same character variables
    char_var_df1 <- skim_char(df1) %>% select(Variable, Type)
    char_var_df2 <- skim_char(df2) %>% select(Variable, Type)
    all_char <- char_var_df1 %>% 
      inner_join(char_var_df2, by = c("Variable", "Type")) %>% 
      select(Variable)
  }else{
    all_char <- data.frame()
  }
  
  if(ncol(all_num)>0 | ncol(all_char)>0){
    all_variables <- all_num %>% rbind.data.frame(all_char)
    out <- all_variables$Variable
  }else{
    out <- c("")
  }
  return(out)
}


#' read data loaded from an input file
#' @param input_file_data the link of the data to load
#' @param file_sep the separator used to read the csv data. Possible values are :
#'                 semi column";", comma"," or column":"
#' @return An object of 'data.frame' class read from user input or a validation message

read_loaded_df <- function(input_file_data, file_sep = ";"){
  ext <- tools::file_ext(input_file_data$name)
  switch(ext,
         rds = readRDS(input_file_data$datapath),
         csv = read.csv2(input_file_data$datapath, sep = file_sep),
         tsv = read.table(input_file_data$datapath, sep = "\t", header = TRUE),
         validate("Invalid file; Please upload a .rds, .csv or .tsv file")
  )
}