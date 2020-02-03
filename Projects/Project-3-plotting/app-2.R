library(shiny)

ui <- fluidPage(
  selectInput("frame", "Data frame:", 
              choices = c("Choose data frame"= "", 
                          "mtcars", "iris", "CPS85"),
              selected = character()),
  selectInput("response", "Response var:", 
              choices = c("Waiting for you to choose frame" = "")),
  selectInput("explanatory", "Explan var:",
              choices = c("Choose response first" = "")),
  tableOutput("show_df")
)

server <-   function(input, output, session) {
  Choices <- reactiveValues(
    frame = NULL,
    response = NULL,
    explanatory = NULL
  )
  observe({
    Choices$frame <- input$frame}
    ) 
  observe(Choices$response <- input$response) 
  observe(Choices$explanatory <- input$explanatory)
  
  Raw_data <- reactive({
    req(Choices$frame)
    switch(Choices$frame, 
      mtcars = mtcars,
      iris = iris,
      CPS85 = mosaicData::CPS85,
    )
  })
  
  columns <- reactive({
    # req(Raw_data())
    # req(Choices$response != Choices$explanatory)
    req(Choices$response %in% names(Raw_data()))
    req(Choices$explanatory %in% names(Raw_data()))
    Raw_data()[c(Choices$response, Choices$explanatory)]
  })
  
  output$show_df <- renderTable({
    req(Choices$response)
    req(columns())
    #req(Choices$response != Choices$explanatory)
    head(columns())
  })
  
  observeEvent(Choices$frame, {
    nms <- names(Raw_data())
    Choices$response <- NULL #nms[1]
    updateSelectInput(session,  "response",
                      choices = c("Select response var ..." = "",
                                  nms),
                      selected = Choices$response
    )
  }, label="update response choices", priority = 10)
  
  observeEvent(c(Choices$frame), {
    nms <- setdiff(names(Raw_data()), Choices$response)
    Choices$explanatory <- NULL #nms[1]
    updateSelectInput(session, "explanatory",
                      choices = c("Select explan var ..." = "",
                                  nms),
                      selected = Choices$explanatory
                      )
    
  }, label = "update explanatory choices")
}

options(reactlog=TRUE)
reactlogReset()
# after App runs:  reactlogShow()

shinyApp(ui, server)