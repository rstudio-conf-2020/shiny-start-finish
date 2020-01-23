# UI.R: UI definition
library(miniUI)

# Some individual UI elements
UI <- 
  miniUI::miniPage(
    miniTitleBar("A miniPage App"),
    
    miniContentPanel(Fourth),
    miniTabstripPanel(
      miniTabPanel(title = "Chinese", 
                   miniButtonBlock(
                     actionButton("reset", "Reset to defaults"),
                     actionButton("clear", "Clear all")
                   ),
                   Fifth),
      miniTabPanel(title = "Ukrainian", 
                   miniTabstripPanel(
                     miniTabPanel(title="First", First),
                     miniTabPanel(title="Second", Second)),
                   Third),
      miniTabPanel(title = "Others",
                   First,
                   Second,
                   Third)
    )
  )
