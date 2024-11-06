#' model_performance UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_model_performance_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' model_performance Server Functions
#'
#' @noRd 
mod_model_performance_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_model_performance_ui("model_performance_1")
    
## To be copied in the server
# mod_model_performance_server("model_performance_1")
