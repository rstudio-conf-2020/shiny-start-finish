## app.R ##
library(shiny)
library(shinydashboard)

# stub for the source of the messages/nofications/tasks.
source("messages.R")

menuA <- dropdownMenu(type = "messages", .list = Alist)
menuB <- dropdownMenu(type = "notification", .list = Blist)
menuC <- dropdownMenu(type = "tasks", .list = Clist)

ui <- dashboardPage(
  dashboardHeader(menuA, menuB, menuC, title="The header title!"),
  dashboardSidebar(
    title = "Important control value!",
    sliderInput("spam", "Slide me to the right!", 
                min = 0, max = 20, value = 2)
  ),
  dashboardBody( # Boxes need to be put in a row (or column)
    box(
      valueBoxOutput("value"),
      infoBoxOutput("value2"),
      width = 6,
      title = "Important notifications",
      collapsible = TRUE
    ),
    tabBox(
      tabPanel("Friends", "Put  a list of friends here"),
      tabPanel("Fenemies", "Keep up to date!"),
      tabPanel("Enemies", "I never met a man I didn't like.")
    )
  )
)

server <- function(input, output, server) { 
  source("shinydashboard-server.R", local = TRUE)
}

shinyApp(ui, server)