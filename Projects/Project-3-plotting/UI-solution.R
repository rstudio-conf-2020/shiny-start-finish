# Solution file for the UI

data_panel <- 
  tabPanel(title = "Data",
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
           tableOutput("show_df")
  )

graphics_panel <- tabPanel(
  title = "Graph",
  plotOutput("graph_data")
)

statistics_panel <- tabPanel(
  title = "Stats",
  verbatimTextOutput("regression_table")
)

codebook_panel <- tabPanel(
  title = "Codebook",
  htmlOutput("codebook")
)

ui <- fluidPage(
  tabsetPanel(id = "display-tabs",
              data_panel,
              graphics_panel,
              statistics_panel,
              codebook_panel)
)