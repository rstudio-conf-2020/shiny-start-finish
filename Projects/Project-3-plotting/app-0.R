library(shiny)
library(mosaicData)

ui <- fluidPage(
  selectInput("frame", "Data frame:", 
              choices = c("Choose data frame"= "", 
                          "datasets::mtcars", 
                          "datasets::iris", 
                          "mosaicData::CPS85"),
              selected = character()),
  selectInput("response", "Response var:", 
              choices = c("Waiting for you to choose frame" = "")),
  selectInput("explanatory", "Explan var:",
              choices = c("Waiting for you to choose response var" = "")),
  tableOutput("show_df"),
  plotOutput("graph_data"),
  verbatimTextOutput("regression_table"),
  htmlOutput("codebook")
)

server <- function(input, output, session) {
  Raw_data <- reactive({
    req(input$frame)
    switch(input$frame, 
      `datasets::mtcars` = datasets::mtcars,
      `datasets::iris` = datasets::iris,
      `mosaicData::CPS85` = mosaicData::CPS85,
    )
  })
  
  output$codebook <- renderText({
      req(input$frame)
      components <- unlist(strsplit(input$frame, "::"))
      package <- components[1]
      data_name <- components[2]
      db <- tools::Rd_db(package)
      doc_contents <- db[[paste0(data_name, ".Rd")]]
      paste(capture.output(tools::Rd2HTML(doc_contents)),
            collapse = "\n")
  })
}

options(reactlog=TRUE)
reactlogReset()
# after App runs:  reactlogShow()

shinyApp(ui, server)