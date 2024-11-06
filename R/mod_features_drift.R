#' features_drift UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_features_drift_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' features_drift Server Functions
#'
#' @noRd 
mod_features_drift_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_features_drift_ui("features_drift_1")
    
## To be copied in the server
# mod_features_drift_server("features_drift_1")
