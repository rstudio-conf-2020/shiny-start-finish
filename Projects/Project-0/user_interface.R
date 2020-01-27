user_interface <- tagList(
  h2("A very basic Shiny App"),
  
  p("This app demonstrates the split between the Muggle and Wizard worlds"),
  actionButton("go", "Go!"),
  plotOutput("main"),
  checkboxInput("angie", "Want a plumber?"),
  
  selectInput("xvar", "Set the x!", c("a", "b", "c"))
)
