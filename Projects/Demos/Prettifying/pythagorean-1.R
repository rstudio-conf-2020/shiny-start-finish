# Pythagorean calculator 1
library(shiny)

ui <- tagList(
  tags$head(
    tags$title("Triangles"),
    tags$link(
      rel = "stylesheet",
      type  = "text/css",
      href = "bootstrap.cerulean.css"
    )),
  h1("Pythagoras and his triangles"),
  img(src="right-triangle.jpeg"),
  p("Specifying the lengths of the legs ... "),
  numericInput("A", "Leg A:", value = 3),
  numericInput("B", "Leg B:", value = 4),
  span("... tells you the lengths of the hypothenuse:"),
  textOutput("C", inline=TRUE)
)

server <- function(input, output, session) {
  output$C <- renderText({
    sqrt(input$A^2 + input$B^2)
  })
}

options(shiny.reactlog=TRUE)
#reactlogReset()
# after App runs:  reactlogShow()

shinyApp(ui, server)

