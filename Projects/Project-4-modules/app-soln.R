# Count vehicles
library(shiny)
library(shinyWidgets)
source("muggle-soln.R")

ui <- fluidPage(
  p(vehicle_counter_UI("bikes", "bicycle")),
  p(vehicle_counter_UI("wheelchairs", "wheelchair")),
  p(vehicle_counter_UI("poppins", "umbrella")),
  p(vehicle_counter_UI("cars", "car")),
  p(vehicle_counter_UI("motorcycles", "motorcycle")),
  p(vehicle_counter_UI("busses", "bus")),
  p(vehicle_counter_UI("trucks", "truck")),
  p(vehicle_counter_UI("helicopters", "helicopter")),
  p(vehicle_counter_UI("planes", "plane")),
  # To show we can access the individual counts outside of the module
  p(span("Motorized: "),  textOutput("motorized", inline=TRUE)),
  p(span("Airborne : "),  textOutput("airborne", inline=TRUE)),
  p(span("Human    : "),  textOutput("human", inline = TRUE))
  
)

server <- function(input, output, session) {
  nbikes       <- callModule(vehicle_counter, "bikes")
  nwheelchairs <- callModule(vehicle_counter, "wheelchairs")
  npoppins     <- callModule(vehicle_counter, "poppins")
  ncars        <- callModule(vehicle_counter, "cars")
  nmotorcycles <- callModule(vehicle_counter, "motercycles")
  nbusses      <- callModule(vehicle_counter, "busses")
  ntrucks      <- callModule(vehicle_counter, "trucks")
  nhelos       <- callModule(vehicle_counter, "helicopters")
  nplanes      <- callModule(vehicle_counter, "planes")
  
  # Now to compute and display the summaries
  output$motorized <- renderText({
    ncars() + nmotorcycles() + nbusses() + nplanes() + nhelos() + ntrucks()
  })
  output$airborne  <- renderText({
    nplanes() + nhelos() + npoppins()
  })
  output$human     <- renderText({
    nbikes() + nwheelchairs() + npoppins()
  })
}

shinyApp(ui, server)
