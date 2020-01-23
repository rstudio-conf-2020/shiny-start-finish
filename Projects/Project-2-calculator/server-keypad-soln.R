# Server components to compose a number 
# in the entry_string() which is constantly
# displayed in output$current.
  
  output$current <- renderText(entry_string())
  observeEvent(input$zero, {
    entry_string(paste0(entry_string(), "0"))
  })
  observeEvent(input$one, {
    entry_string(paste0(entry_string(), "1"))
  })
  observeEvent(input$two, {
    entry_string(paste0(entry_string(), "2"))
  })
  observeEvent(input$three, {
    entry_string(paste0(entry_string(), "3"))
  })
  observeEvent(input$four, {
    entry_string(paste0(entry_string(), "4"))
  })
  observeEvent(input$five, {
    entry_string(paste0(entry_string(), "5"))
  })
  observeEvent(input$six, {
    entry_string(paste0(entry_string(), "6"))
  })
  observeEvent(input$seven, {
    entry_string(paste0(entry_string(), "7"))
  })
  observeEvent(input$eight, { # a bug to fix!
    entry_string(paste0(entry_string(), "4"))
  })
  observeEvent(input$nine, {
    entry_string(paste0(entry_string(), "9"))
  })
  
  observeEvent(input$dot, {
    entry_string(paste0(entry_string(), "."))
  })
  observeEvent(input$erase, {
    str <- entry_string()
    if (nchar(str) > 0)
      entry_string(substr(str, 1, nchar(str)-1))
  })
