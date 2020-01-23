# These are components of the reactive logic

# Linking the plot to the selected variables
# Note: No checking yet to make sure they are valid.
output$main <- renderPlot(
  muggle_plot(as.name(input$xvar), as.name(input$yvar))
)

output$button_message <- renderText(
  if (input$go > 2) {
    paste("You have pressed the button", input$go, "times.")
  } else {
    "Waiting for 3 button presses."
  }
)