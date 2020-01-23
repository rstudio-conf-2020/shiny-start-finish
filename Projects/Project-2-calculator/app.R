library(shiny)
source("UI.R")

server <- function(input, output, session) {
  # here to remind us of these components
  entry_string <- reactiveVal("", "make_R0")
  last_op <- reactiveVal("", "last_op_pressed")
  stack0 <- reactiveVal(NA, "stack0")
  stack1 <- reactiveVal(NA, "stack1")
  stack2 <- reactiveVal(NA, "stack2")
  source("server-starting.R", local = TRUE)
  ## comment these out when you start to work on
  ## your own server logic.
  source("server-keypad-soln.R", local = TRUE)
  source("server-ops-soln.R", local=TRUE)
}

shinyApp(ui, server)
