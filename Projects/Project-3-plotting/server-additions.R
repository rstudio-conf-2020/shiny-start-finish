# Your additions to the server.

# Task 3
observeEvent(Raw_data(), {
  updateSelectInput(session, "response", 
                    choices = names(Raw_data()))
})

observeEvent(Raw_data(), {
  updateSelectInput(session, "explanatory",
                    choices = names(Raw_data()))
})

# Task 4
columns <- reactive({
  # req(input$response, input$explanatory) # task 6 addition
  Raw_data()[c(input$response, input$explanatory)]
})

output$show_df <- renderTable({
  head(columns())
})

output$graph_data <- renderPlot({
  ggplot(columns(), 
         aes_string(
           x = input$explanatory,
           y = input$response)) +
    geom_point()
})

# Task 5
fitted_model <- reactive({
  formula <- paste(input$response, "~", input$explanatory)
  lm(formula, data = columns())
})

output$regression_table <- renderText({
  res <- summary(fitted_model())
  text <- capture.output(res)
  paste(text, collapse = "\n")
})
