# app.R: App Template
library(shiny)

source("UI_sudoku.R", local=TRUE)
source("Server-0.R", local = TRUE) # defines Server <-

UI <- whole_board()

shinyApp(UI, Server)
