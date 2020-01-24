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