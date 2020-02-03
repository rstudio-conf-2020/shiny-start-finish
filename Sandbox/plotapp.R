library(shiny)
library(shinyjs)

ui <- fluidPage(
  useShinyjs(),
  selectInput("data", "Data set:",
              choices = c(
                "Please pick a data set" = "",
                "first", 
                "two", "C")),
  uiOutput("choose_xvar"), 
  
  plotOutput("histogram")
)

server <- function(input, output, session) {
  raw_data <- reactive({
    req(input$data)
    switch(input$data,
           first = mtcars,
           two = iris, 
           C = cars)
  })
  observe({
    if (isTruthy(input$data)) {
      show("xvar")
    } else {
      hide("xvar")
    }
  })
  
  output$choose_xvar <- 
    renderUI(selectInput("xvar", "X variable",
                         choices =  names(raw_data())))
  
  
  the_variable <- reactive({
    raw_data()[[input$xvar]] 
  })
  
  output$histogram <- renderPlot({
    req(input$xvar)
    hist(the_variable() )
  })
}

options(shiny.reactlog = TRUE)

shinyApp(ui, server)