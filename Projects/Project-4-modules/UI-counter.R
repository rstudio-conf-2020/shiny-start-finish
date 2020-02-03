# UI-counter.R
# gives a pattern for a counter user-interface
counter_ui_bikes <- 
  span(
       actionBttn("upbike",  label = NULL, 
                  icon = icon("bicycle"),
                  style = "simple", 
                  color = "primary"),
       span(
         textOutput("valuebike", inline = TRUE),
         span(" seen"),
         style = "font-size: 20px;"
       ),
       actionBttn("downbike", label = NULL,
                  icon = icon("eye-slash"),
                  style = "simple",
                  color = "warning",
                  size = "sm")
  )

counter_ui_pedestrians <- 
  span(
    actionBttn("upped",  label = NULL, 
               icon = icon("pedestrian"),
               style = "simple", 
               color = "primary"),
    span(
      textOutput("valueped", inline = TRUE),
      span(" seen"),
      style="font-size: 20px;"
    ),
    actionBttn("downped", label = NULL,
               icon = icon("eye-slash"),
               style = "simple",
               color = "warning",
               size = "sm")
  )
  
