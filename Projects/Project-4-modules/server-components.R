# server-components.R
# defines server components for the counter
counter_value <- reactiveVal(0)

output$value <- renderText(counter_value())

observeEvent(input$up, {
  counter_value(counter_value() + 1)
})

observeEvent(input$down, {
  counter_value(counter_value() - 1)
})
