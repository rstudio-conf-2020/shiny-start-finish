user_interface <- tagList(
  h2("A very basic Shiny App"),
  p("This app demonstrates the split between the Muggle and Wizard worlds"),
  actionButton("go", "Go!"),
  plotOutput("main"),
  textOutput("button_message")
)