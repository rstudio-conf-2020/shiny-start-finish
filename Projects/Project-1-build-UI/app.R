library(shiny)

source("Muggle.R")
source("UI_fluid_page.R.R") # defines ui  <-

server <- function(input, output, session) {
  source("Server.R", local = TRUE)
}

shinyApp(UI, server)


