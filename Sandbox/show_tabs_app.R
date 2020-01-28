library(shiny)

data_tab <- tabPanel(title = "Data",
                     textInput("userID", "userID"),
                     passwordInput("password", "password"),
                     textInput("datatable", "Name of table")
)
plot_tab <- tabPanel(title = "Plot",
                     uiOutput("for_yvar"),
                     uiOutput("for_xvar"),
                     uiOutput("for_color"),
                     plotOutput("main_plot")
                     )

ui <- fluidPage(
  titlePanel("Modeling"),
  sidebarLayout(
    sidebarPanel(
      radioGroupButtons("panels", "What to show?",
                           choices = c("model", "graphic", "stats"))
    ),
    mainPanel(
      tabsetPanel(
        data_tab,
        plot_tab
      )
    )
  )
)

server <- function(input, output, session) {
  tabs_shown <- reactiveValues(data = FALSE, 
                             model = FALSE, 
                             graphic = FALSE, 
                             stats = FALSE)
  observeEvent(input$panels, {
    browser()
    tabs_shown$data <- "data" %in% input$panels 
    tabs_shown$model <- "model" %in% input$panels
    tabs_shown$graphic <- "graphic" %in% input$panels
    tabs_shown$stats <- "stats" %in% input$panels
  })
  observeEvent(tabs_shown$data, {
      browser()
      output$one <-renderUI(
        if (tabs_shown$data) data_tab
        else NULL
    )})
  observeEvent(tabs_shown$graphic, {
    output$two <-renderUI(
      if (tabs_shown$graphic) plot_tab
      else NULL
    )})
}

shinyApp(ui, server)