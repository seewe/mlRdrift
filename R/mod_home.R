#' home UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_home_ui <- function(id) {
  ns <- NS(id)
  layout_columns( card_logo,
                  layout_columns( card_home_1, card_home_2,
                                  card_home_3, card_home_4,
                                  col_widths = c(6,6),
                                  row_heights = c(1,1)
                                  ),
                  caroussel_1,
                  col_widths = c(4,8,12),
                  row_heights = c(5, 1)
  )
}


#' home Server Functions
#'
#' @noRd 
mod_home_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_home_ui("home_1")
    
## To be copied in the server
# mod_home_server("home_1")
