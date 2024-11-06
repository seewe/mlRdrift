# Building a Prod-Ready, Robust Shiny Application.
#
# README: each step of the dev files is optional, and you don't have to
# fill every dev scripts before getting started.
# 01_start.R should be filled at start.
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
#
#
###################################
#### CURRENT FILE: DEV SCRIPT #####
###################################

# Engineering

## Dependencies ----
## Amend DESCRIPTION with dependencies read from package code parsing
## install.packages('attachment') # if needed.

pkgs <- c(
  'devtools',
  'pins',
  "dplyr",
  "lubridate",
  "golem",
  "shiny",
  "shinyjs",
  "shinyWidgets",
  "bslib",
  "skimr",
  "vroom",
  "DT",
  "data.table",
  "utils",
  "htmltools",
  "remotes"
)

for (i in pkgs) {
  usethis::use_package(i)
}
usethis::use_dev_package("bsutils", type = "import", remote = "git::https://github.com/seewe/bsutils.git@master")

## 1.11 add global variable

usethis::use_import_from("shinydashboard",
                         c("tabItems", "tabItem", "dashboardBody", "box", "renderValueBox", "valueBox", "valueBoxOutput",
                           "sidebarMenu", "menuItem"))
usethis::use_import_from("bslib",
                         c("card", "accordion", "accordion_panel", "page_navbar", "nav_panel", "layout_sidebar",
                           "card_header", "navset_card_tab"))
usethis::use_import_from("bsicons",
                         c("bs_icon"))
usethis::use_import_from("shinydashboardPlus",
                         c("dashboardPage", "dashboardFooter", "dashboardHeader", "dashboardSidebar"))
usethis::use_import_from("lubridate", c("hour"))
usethis::use_import_from("dplyr", c("between", "select", "filter", "case_when", "ungroup", "inner_join", "ends_with"))
usethis::use_import_from("DT", c("datatable", "JS"))
usethis::use_import_from("utils", c("read.csv2", "read.table"))
usethis::use_import_from("skimr", c("skim"))
usethis::use_import_from("data.table", c("month"))
usethis::use_import_from("devtools", c("document"))
usethis::use_import_from("pins", c("pin"))
usethis::use_import_from("shinyWidgets", c("actionBttn", "radioGroupButtons", "pickerInput"))
usethis::use_import_from("shinyjs", c("alert"))
usethis::use_import_from("vroom", c("spec"))

usethis::use_ins

utils::globalVariables(".")

attachment::att_amend_desc()

## Add modules ----
## Create a module infrastructure in R/
golem::add_module(name = "sidebar", with_test = FALSE, fct = "all") # Name of the module
golem::add_module(name = "home") # Name of the module
golem::add_module(name = "data_loader", with_test = TRUE, fct = "all") # Name of the module
golem::add_module(name = "features_drift", with_test = TRUE, fct = "all") # Name of the module
golem::add_module(name = "model_performance", with_test = TRUE, fct = "all") # Name of the module

## Add helper functions ----
## Creates fct_* and utils_*
golem::add_fct("helpers", with_test = TRUE)
golem::add_utils("helpers", with_test = TRUE)

## External resources
## Creates .js and .css files at inst/app/www
golem::add_js_file("script")
golem::add_js_handler("handlers")
golem::add_css_file("custom")
golem::add_sass_file("custom")
golem::add_any_file("file.json")

## Add internal datasets ----
## If you have data in your package
usethis::use_data_raw(name = "my_dataset", open = FALSE)

## Tests ----
## Add one line by test you want to create
usethis::use_test("app")

# Documentation

## Vignette ----
usethis::use_vignette("mlRdrift")
devtools::build_vignettes()

## Code Coverage----
## Set the code coverage service ("codecov" or "coveralls")
usethis::use_coverage()

# Create a summary readme for the testthat subdirectory
covrpage::covrpage()

## CI ----
## Use this part of the script if you need to set up a CI
## service for your application
##
## (You'll need GitHub there)
usethis::use_github()

# GitHub Actions
usethis::use_github_action()
# Chose one of the three
# See https://usethis.r-lib.org/reference/use_github_action.html
usethis::use_github_action_check_release()
usethis::use_github_action_check_standard()
usethis::use_github_action_check_full()
# Add action for PR
usethis::use_github_action_pr_commands()

# Circle CI
usethis::use_circleci()
usethis::use_circleci_badge()

# Jenkins
usethis::use_jenkins()

# GitLab CI
usethis::use_gitlab_ci()

# You're now set! ----
# go to dev/03_deploy.R
rstudioapi::navigateToFile("dev/03_deploy.R")
