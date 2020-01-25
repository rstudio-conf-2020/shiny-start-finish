# UI-counter.R
# gives a pattern for a counter user-interface
counter_ui <- 
  span(
       actionBttn("up",  label = NULL, 
                  icon = icon("bicycle"),
                  style = "simple", 
                  color = "primary"),
       span(
         textOutput("value", inline = TRUE),
         span(" seen"),
         style="font-size: 20px;"
       ),
       actionBttn("down", label = NULL,
                  icon = icon("eye-slash"),
                  style = "simple",
                  color = "warning",
                  size = "sm")
  )
  
