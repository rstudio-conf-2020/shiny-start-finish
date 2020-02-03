# Count vehicles
library(shiny)
library(shinyWidgets)
source("muggle.R")

source("UI-counter.R") # defines counter_ui
counter_ui <- tagList(
  p(counter_ui_pedestrians),
  p(counter_ui_bikes)
)

server <- function(input, output, session) {
  #source("server-components.R", local = TRUE)
}

shinyApp(counter_ui, server)
