# Server components for the shinydashboard demo

output$value <- renderValueBox({
  valueBox(input$spam, "Keep below 10!", 
           color = ifelse(input$spam < 10, "green", "red"),
           width = 2,
           icon = icon("angry"))
})

output$value2 <- renderInfoBox({
  infoBox(glue::glue("Failure in {20-input$spam} seconds"), 
          "Keep above 5!",
          width = 3,
          color = ifelse(input$spam > 5, "orange", "blue"))
})