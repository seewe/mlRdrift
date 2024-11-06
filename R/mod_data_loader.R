#' data_loader UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_data_loader_ui <- function(id) {
  ns <- NS(id)
  bslib::layout_sidebar(
    sidebar = mod_sidebar_ui("sidebar_1"),
    "Loader place is here"
  )

}
    
#' data_loader Server Functions
#'
#' @noRd 
mod_data_loader_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    
    
  })
}
    
## To be copied in the UI
# mod_data_loader_ui("data_loader_1")
    
## To be copied in the server
# mod_data_loader_server("data_loader_1")
