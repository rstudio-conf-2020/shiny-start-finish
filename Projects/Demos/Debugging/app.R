library(shiny)
source("muggle.R")

## WARNING: THIS IS A SECURITY NIGHTMARE IF DEPLOYED

ui <- fluidPage(
  tabsetPanel(
    tabPanel(
      title = "Controls/Values",
      sliderInput("s1", "A number:", 
                  min=-3, max=3, value=0),
      selectInput("op", "Operation",
                  choices = c("sqrt", "log", "sin", "atan")),
      span("Output: ", textOutput("value")),
      hr(),
      span("See s1: ", textOutput("s1val")),
      hr(),
      span("See op: ", textOutput("opval")),
    ),
    tabPanel(
      title = "Console",
      fluidRow(
        textInput("command", label = "Console"),
        actionButton("go", "Evaluate!")
      ),
      p("Output:"),
      verbatimTextOutput("display")
    )
  )
)

server <- function(input, output, session) {
  operation <- reactive({get_function(input$op)})
  value <- reactive({
    try_operation(operation(), input$s1)
  })
  output$value <- renderText({capture.output(value())})
  
  # stuff for debugging visualization
  output$s1val <- renderText({capture.output(input$s1)})
  output$opval <- renderText({capture.output(operation())})
  command_result <- eventReactive(input$go, {
      ex <- try(parse(text = input$command))
      if (inherits(ex, "try-error")) 
        return(paste("Parsing error:", capture.output(ex)[5]))
      
      try(eval(ex))
  })
  output$display <- renderText({
    paste(
      capture.output(command_result()), 
      collapse = "\n")
    })
  
}

shinyApp(ui, server)