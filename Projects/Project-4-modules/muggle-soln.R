# Muggle.R
# This is where you will write your module functions

vehicle_counter_UI <- function(id, icon_name = "bicycle") {
  ns <- NS(id)
  span(
    actionBttn(ns("up"),  label = NULL, 
               icon = icon(icon_name),
               style = "simple", 
               color = "primary"),
    span(
      textOutput(ns("value"), inline = TRUE),
      span(" seen"),
      style="font-size: 20px;"
    ),
    actionBttn(ns("down"), label = NULL,
               icon = icon("eye-slash"),
               style = "simple",
               color = "warning",
               size = "xs")
  )
}

vehicle_counter <- function(input, output, session) {
  counter_value <- reactiveVal(0)
  output$value <- renderText(counter_value())
  observeEvent(input$up, {
    counter_value(counter_value() + 1)
  })
  observeEvent(input$down, {
    counter_value(counter_value() - 1)
  })
  return(counter_value)
}
