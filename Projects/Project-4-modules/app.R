# Count vehicles
library(shiny)
library(shinyWidgets)
source("muggle.R")

ui <- fluidPage(
  includeCSS("vehicles.css"),
  source("UI-counter.R") # defines counter_ui
)

server <- function(input, output, session) {
  source("server-components.R", local = TRUE)
}

shinyApp(counter_ui, server)
