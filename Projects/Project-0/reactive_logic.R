# These are components of the reactive logic

output$main <- renderPlot(
  muggle_plot(as.name("cut"), as.name("price"))
)

output$button_message <- renderText(
  paste("You have pressed the button", input$go, "times.")
)