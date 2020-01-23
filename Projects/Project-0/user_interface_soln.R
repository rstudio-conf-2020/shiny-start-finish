# Solution to "your turn" tasks

# In the app, source() this file instead of user_interface.R

user_interface <- tagList(
  h2("A very basic Shiny App"),
  p("This app demonstrates the split between the Muggle and Wizard worlds"),
  selectInput("yvar", "Y axis:", 
              choices = names(diamonds)),
  selectInput("xvar", "X axis",
              choices = names(diamonds)),
  # Later, we'll see how to make the df name and vars dynamic!
  # But for now, we're restricted to the <diamonds> data frame.
  actionButton("go", "Go!"),
  plotOutput("main"),
  textOutput("button_message")
)