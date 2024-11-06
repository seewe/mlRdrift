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
  layout_columns( caroussel_1,
                  card_logo,
                  layout_columns( 
                    
                    layout_columns(
                      htmltools::h2("Metric Presets"), 
                      layout_column_wrap(
                        card_home_DQ, card_home_DD,
                        card_home_TD, card_home_CL,
                        card_home_RG, card_home_TO,
                        width = 1/6
                      ),
                      col_widths = c(12),
                      row_heights = c(1, 8)
                    ),
                    
                    layout_columns(
                      htmltools::h2("Test Presets"), 
                      layout_column_wrap(
                        card_home_NTP, card_home_DDT,
                        card_home_DST, card_home_DQT,
                        card_home_RGT, card_home_MCC,
                        card_home_BCT, card_home_BCK,
                        width = 1/4
                      ),
                      col_widths = c(12),
                      row_heights = c(1, 8)
                    ),
                    
                    col_widths = c(12,12),
                    row_heights = c(1, 2)
                  ),
                  col_widths = c(12, 3, 9),
                  row_heights = c(1, 5)
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
