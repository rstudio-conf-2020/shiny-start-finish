# UI.R: UI definition

UI <- 
  tagList(
    h1("A Bag of Widgets"),
    p("Here are my widgets:"),
    sliderInput("fred", "Value:", min=0, max=100, value=55),
    selectInput("annie", "Pick an animal",
                choices = c("antelope", "bear", "chicken", "dove")),
    textOutput("felix"),
    plotOutput("fiona")
  )
