# Count vehicles
library(shiny)
library(shinyWidgets)
source("muggle.R")

ui <- fluidPage(
  source("UI-counter.R") # defines counter_ui
)

server <- function(input, output, session) {
  source("server-components.R", local = TRUE)
}

shinyApp(counter_ui, server)
