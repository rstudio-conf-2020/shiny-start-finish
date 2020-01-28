# Pythagorean calculator 1
library(shiny)

ui <- tagList(
  tags$head(tags$title("Triangles")),
  img(src="right-triangle.jpeg"),
  p("Specifying the lengths of the legs ... "),
  numericInput("A", "Leg A:", value = 3),
  numericInput("B", "Leg B:", value = 4),
  span("... tells you the lengths of the hypothenuse:"),
  textOutput("C", inline=TRUE)
)

server <- function(input, output, session) {
  C2 <- reactive({input$A^2 + input$B^2})
  output$C <- renderText(sqrt(C2()))
}

options(shiny.reactlog=TRUE)
reactlogReset()
# after App runs:  reactlogShow()

shinyApp(ui, server)

