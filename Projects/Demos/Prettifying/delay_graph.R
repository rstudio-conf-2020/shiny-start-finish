library(shiny)

ui <- fluidPage(
  textInput("title", "Title for graph"),
  textInput("xlabel", "X axis label"),
  textInput("ylabel", "Y axis label"),
  actionButton("go", "Update graphic"),
  plotOutput("main")
)

server <- function(input, output, session) {
  output$main <- renderPlot({
    plot(mpg ~ hp, data = mtcars,
         xlab = xlabel(), #input$xlabel,
         ylab = ylabel(), #input$ylabel,
         main = title())  #input$title)
  })
  ylabel <- eventReactive(input$go, input$ylabel)
  xlabel <- eventReactive(input$go, input$xlabel)
  title  <- eventReactive(input$go, input$title)
  
}

options(reactlog=TRUE)
reactlogReset()
# after App runs:  reactlogShow()

shinyApp(ui, server)
