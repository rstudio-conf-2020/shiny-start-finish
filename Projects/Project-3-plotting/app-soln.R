library(shiny)
library(mosaicData)
library(ggplot2)

source("UI-solution.R")

server <- function(input, output, session) {
  source("server-starting.R", local = TRUE)
  source("server-additions.R", local = TRUE)
}

shinyApp(ui, server)
