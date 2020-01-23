# A very basic shiny app
library(shiny)

source("muggle.R")
source("user_interface.R") # defines user_interface
 

# Set up the the connection to the  Wizard World
reactive_logic <- function(input, output, session) {
  source("reactive_logic.R", local = TRUE)
}

# Invoke the app!
shinyApp(user_interface,  reactive_logic)
