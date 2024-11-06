#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    bslib::page_navbar(
      title = "mlRdrift",
      theme = choose_theme(),
      footer = "(c) data for know, 2024",
      nav_spacer(),
      nav_spacer(),
      nav_spacer(),
      nav_panel(title = "Home",
                icon = bsicons::bs_icon("house"),
                mod_home_ui("home_1")),
      nav_panel(title = "Load data",
                icon = bsicons::bs_icon("database-up"),
                mod_data_loader_ui("data_loader_1")),
      nav_panel(title = "Features drift",
                icon = bsicons::bs_icon("database-check"),
                p("features drift analysis")),
      nav_panel(title = "Model Performance",
                icon = bsicons::bs_icon("activity"),
                p("Model performance")),
      nav_spacer(),
      nav_menu(
        title = "ressources",
        icon = bsicons::bs_icon("link-45deg"),
        align = "right",
        nav_item(link_github),
        nav_item(link_shiny),
        nav_item(link_posit),
      )
    )
    
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("./inst/app/www")
  )

  tags$head(
    favicon(ext = 'png'),
    bundle_resources(
      path = app_sys("./inst/app/www"),
      app_title = "mlRdrift"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}


#' Choose a theme for your front end
#' 
#' This function return the UI theme dependeing on the choice of a user
#' 
#' @import bslib

choose_theme <- function(th_type = "cerulean"){
  if( th_type == "white"){
    bslib::bs_theme(
      bootswatch = "flatly",
      base_font = bslib::font_google("Inter"),
      navbar_bg = "#25443B"
    )
  }else if(th_type == "dark"){
    bslib::bs_theme(
      bootswatch = "darkly",
      base_font = bslib::font_google("Inter"),
      navbar_bg = "#25443B"
    )
  }else{
    bslib::bs_theme(
      bootswatch = "cerulean",
      base_font = bslib::font_google("Inter"),
      # navbar_bg = "#25443B"
    )
  }
}











