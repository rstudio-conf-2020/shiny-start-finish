# UI.R: UI definition

UI <- 
  fluidPage(
    h1("A Bag of Widgets"),
    checkboxInput("angie", "button_message"),
    p("Here are my widgets:"),
    sliderInput("fred", "Value:", min=0, max=100, value=55),
    selectInput("annie", "Pick an animal",
                choices = c("antelope", "bear", "chicken", "dove")),
    textOutput("felix"),
    plotOutput("fiona")
  )
