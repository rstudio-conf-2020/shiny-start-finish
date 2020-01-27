library(shiny)

source("mycomplicatedandbrilliantsystem.R")
ui <- fluidPage(
  
)

server <- function(input, output, session) {
  source("Knight_bus.R", local=TRUE)
}

shinyApp(ui, server)