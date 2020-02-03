# mobile shiny app
library(shiny)
library(shinyWidgets)
library(shinyjs)
library(miniUI)
library(ggplot2)

explain_text <- paste(readLines("explain.html"), collapse="\n")

smaller_select <- function(id, choices) {
  raw <- capture.output(selectInput(id, "b", choices, width="200px"))[-(1:2)]
  HTML(paste(raw[-(length(raw) - c(1, 0))], collapse = "\n"))
}


labels_inline <- tags$head(
  tags$style(type="text/css", 
     "#data-controls select {
       width: 140pt;
       color: blue;
       margin: 5px;
     }
     
     #data-controls{
       color: red;
     }
     
     label.control-label, .selectize-control.single { 
         display: table-cell; 
         text-align: left; 
         padding-right: 0pt;
         vertical-align: middle; 
      } 
      label.control-label {
        padding-right: 0px;
      }
      .form-group { 
        display: table-row;
      }
      .selectize-control.single div.item {
        margin-right: 100px;
        text-align: left;
        color: blue;
      }")
)



between <- tagList(
  span(
    selectInput("sample_size", "", c("n = 5" = 5, "n = 10"  = 10, 
                                     "n = 20" = 20, "n = 50" = 50, 
                                     "n  = 100" = 100, "n = 200" = 200, "n = 500" = 500, 
                                     "n = 1000" = 1000, "All" = "All")),
    title = "set sample size"
  ),
  "   ",
  span(
    actionBttn(
      inputId = "new_sample",
      label = "",
      icon = icon("dice"),
      size= "md"),
    title  = "Draw a new sample of size n"
  ),
  "   ",
  span(
    actionBttn(
      inputId = "freeze",
      label = "", #"freeze",
      icon = icon("snowflake"),
      size = "md"),
    title = "Freeze the current plot"
  ),
  "   ",
 span(
   actionBttn(
     inputId = "show_model",
     label = "", #"model"
     icon = icon("chart-line"),
     size = "md"),
   title = "Control model shape"
 ),
 "   ",
 span(
   switchInput(
     inputId = "randomize",
     label = "randomize response",
     size = "mini",
     labelWidth = "80px",
     value = as.logical(TRUE)),
   title = "For Null Hypothesis testing. Use random shuffling to eliminate the relationship between the response and explanatory variables"
 )
)

side_by_side_table <- function(...) {
  items <- list(...)
  nms <- names(items)
HTML(glue::glue('
<table>
<tr><th>{nms[1]}</th><th>{nms[2]}</th></tr>
<tr><td>{items[[1]]}</td><td>{items[[2]]}</td></tr>
</table>
'))
}


sources_list <- list("Little Apps" = "LittleApps",
                     "Open Intro" = "openintro",  
                     "mosaic" = "mosaicData", 
                     "Lock-5" = "Lock5Data")

select_table <-  HTML(
  glue::glue(
    '<table id="data-controls">
    <col width="150pt"><col width="200pt">
    <tr><td>Source</td><td>{smaller_select("package", sources_list)}</td></tr>
    <tr><td>Data set</td><td>{smaller_select("data set", names(mtcars))}</td></tr>
    <tr><td>Response</td><td>{smaller_select("response", names(mtcars))}</td></tr>
    <tr><td>Explan</td><td>{smaller_select("explanatory", names(diamonds))}</td></tr>
    <tr><td>Covar</td><td>{smaller_select("covariate", names(mtcars))}</td></tr>
    </table>'
  )
)

ui <- miniUI::miniPage(
  useShinyjs(),
  labels_inline,
  
  miniButtonBlock(between),
  
  #sliderInput("hoohoo", "goo", min=1, max=10, value=4),
  #includeCSS("www/mobile.css"),
  miniTabstripPanel(type = "pills",
      miniTabPanel("Little App: F",
                   miniContentPanel(padding = 5,
                                    p(HTML(explain_text)))),
      miniTabPanel("Data", icon = icon("table"),
                   miniButtonBlock(
                     #wellPanel(
                       select_table,
                      # ),
                     wellPanel(
                       checkboxInput("stratify", "Stratify by explan vars"),
                       plotOutput("preview_plot", width="300px", height="250px")))
                   ),
      miniTabPanel("Graph", icon = icon("sliders"), 
                   miniContentPanel(
                     plotOutput("big_plot", width="100%")#,
                     #p("Maybe I'll put some text here.")
                   )),
      miniTabPanel("Compare", icon = icon("sliders"), 
                   miniContentPanel(
                     plotOutput("frozen_plot", width="100%"))),
      miniTabPanel("Stats", icon = icon("sliders"), 
                   side_by_side_table(
                     current = textOutput("current_stats"),
                     frozen = textOutput("frozen_stats")
                   ))
  )
)

server <- function(input, output, session) {
  observe({input$sample_size; cat("observing\n")})
  output$current_stats <- renderText({"These should be the current statistics"})
  output$frozen_stats <- renderText({"And these should be the frozen stats"})
  
  output$current_plot <- renderPlot({ggplot(mtcars, aes(x=mpg, y = hp)) + geom_point()})
  output$frozen_plot <- renderPlot({ggplot(mtcars, aes(x=cyl, y = mpg)) + geom_point()})
  output$big_plot <- renderPlot({input$sample_size; cat("big plot\n"); 
    ggplot(mtcars, aes(x=cyl, y = mpg)) + geom_point()})
  output$preview_plot <- renderPlot({ggplot(mtcars, aes(x=cyl, y = mpg)) + geom_point()})
  output$URL_label <- renderText({"   URL for data"})

}

shinyApp(ui, server)
