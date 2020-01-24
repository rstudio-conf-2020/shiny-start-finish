library(shiny)

ui <- fluidPage(
  selectInput("frame", "Data frame:", 
              choices = c("Choose data frame"= "", 
                          "mtcars", "iris", "CPS85"),
              selected = character()),
  selectInput("response", "Response var:", 
              choices = c("Waiting for you to choose frame" = "")),
  selectInput("explanatory", "Explan var:",
              choices = c("Waiting for you to choose response var" = "")),
  tableOutput("show_df")
)

server <- function(input, output, session) {
  Raw_data <- reactive({
    req(input$frame)
    switch(input$frame, 
      mtcars = mtcars,
      iris = iris,
      CPS85 = mosaicData::CPS85,
    )
  })
  
  columns <- reactive({
    #req(Raw_data())
    #req(input$response)
    #req(input$response != input$explanatory)
    #req(input$response %in% names(Raw_data()))
    #req(input$explanatory %in% names(Raw_data()))
    return(Raw_data()[c(input$response, input$explanatory)])
    # if (isTruthy(input$explanatory)) {
    #   Raw_data()[c(input$response, input$explanatory)]
    # } else {
    #   Raw_data()[input$response]
    # }
  })
  
  output$show_df <- renderTable({
    #req(input$response)
    #req(columns())
    #req(input$response != input$explanatory)
    head(columns())
  })
  
  observeEvent(input$frame, {
    nms <- names(Raw_data())
    updateSelectInput(session,  "response",
                      choices = c("Select response var ..." = "",
                                  nms)
    )
  }, label="update response choices", priority = 10)
  
  observeEvent(c(input$frame, req(input$response)), {
    nms <- setdiff(names(Raw_data()), input$response)
    updateSelectInput(session, "explanatory",
                      choices = c("Select explan var ..." = "",
                                  nms)
                      )
    
  }, label = "update explanatory choices")
}

options(reactlog=TRUE)
reactlogReset()
# after App runs:  reactlogShow()

shinyApp(ui, server)