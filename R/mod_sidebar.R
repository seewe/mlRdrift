#' sidebar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_sidebar_ui <- function(id) {
  ns <- NS(id)
  bslib::accordion(
    bslib::accordion_panel(
      title = "File inputs", 
      icon = bsicons::bs_icon("file-earmark-arrow-up"),
      shinyWidgets::radioGroupButtons(
        inputId = ns("file_separ"),
        label = "csv files separator:",
        choices = c("(;)"= ";", "(,)" = ",", "(:)" = ":"),
        size = "sm",
        checkIcon = list(
          yes = tags$i(class = "fa fa-check-square"),
          no = tags$i(class = "fa fa-square-o"))
      ),
      
      shiny::fileInput(inputId = ns("upload_benchmark_data"), 
                       label = "benchmark data",
                       buttonLabel = "Upload...",
                       accept = c(".rds, ", ".csv", ".tsv")),
      
      shiny::fileInput(inputId = ns("upload_observed_data"), 
                       label = "Observed data", 
                       buttonLabel = "Upload...", 
                       accept = c(".rds, ", ".csv", ".tsv"))
      
    ),
    
    bslib::accordion_panel(
      title = "Variables selection", 
      icon = bsicons::bs_icon("check2-square"),
      shiny::uiOutput(ns("features_selector_UI")),
      shiny::uiOutput(ns("prediction_selector_UI"))
    ),
    
    bslib::accordion_panel(
      title = "Run Drift Analysis", 
      icon = bsicons::bs_icon("play-btn"),
      shiny::actionButton(ns("run_drift_analisis"), 
                          label =  "Run Drift Analysis", 
                          icon = icon("play"))
    )
    
  )
    
    
}
    
#' sidebar Server Functions
#'
#' @noRd 
mod_sidebar_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    
    rv_loaded_data <- shiny::reactiveValues(
      comparison_summary_object = list(diff_percentage = NA_real_),
      click_on_run = 0
    )
    
    # Loaded benchmark data
    upload_benchmark_data <- shiny::reactive({
      req(input$upload_benchmark_data)
      req(input$file_separ)
      read_loaded_df(input_file_data = input$upload_benchmark_data, 
                     file_sep = input$file_separ)
    })
    
    # Loaded observed data
    upload_observed_data <- shiny::reactive({
      req(input$upload_observed_data)
      req(input$file_separ)
      read_loaded_df(input_file_data = input$upload_observed_data, 
                     file_sep = input$file_separ)
    })
    
    # List of features to check
    features_list <- shiny::reactive({
      same_variables(upload_benchmark_data(), upload_observed_data())
    })
    
    # Features selectors 
    output$features_selector_UI <- shiny::renderUI({
      shinyWidgets::pickerInput(
        inputId = ns("features_list"), 
        label = "Features to check", 
        choices = features_list(),
        multiple = TRUE,
        selected = features_list(),
        options = list( `live-search` = TRUE, 
                        `actions-box` = TRUE, 
                        `deselect-all-text` = "None...",
                        `select-all-text` = "All...")
      )
    })
    
    # Predictions selectors 
    output$prediction_selector_UI <- shiny::renderUI({
      shinyWidgets::pickerInput(
        inputId = ns("prediction_list"), 
        label = "predictions to check", 
        choices = features_list(),
        multiple = TRUE,
        selected = features_list()[length(features_list())],
        options = list( `live-search` = TRUE,
                        `actions-box` = TRUE, 
                        `deselect-all-text` = "None...",
                        `select-all-text` = "All...")
      )
    })
    
    return(rv_loaded_data)
 
  })
}
    
## To be copied in the UI
# mod_sidebar_ui("sidebar_1")
    
## To be copied in the server
# mod_sidebar_server("sidebar_1")
