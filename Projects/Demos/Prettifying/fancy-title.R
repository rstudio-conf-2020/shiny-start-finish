library("shiny")

UI <- fluidPage(
  tags$head(
    tags$style(HTML("
      @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
      
      h1 {
        font-family: 'Lobster', cursive;
        font-weight: 500;
        line-height: 1.1;
        color: #48ca3b;
      }

    "))
  ),
  headerPanel("New Application"),
  sidebarPanel(
    sliderInput("obs", "Number of observations:", 
              min = 1, max = 1000, value = 500)
  ),

  mainPanel(plotOutput("distPlot"))
)

server <- function(input, output, session) {}

options(reactlog=TRUE)
reactlogReset()
# after App runs:  reactlogShow()

shinyApp(UI, server)
