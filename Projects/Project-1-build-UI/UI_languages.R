# See Muggle.R for these definitions
UI <- 
  fluidPage(
    fluidRow(First,
             column(width = 2, Second, Third),
             column(width = 5, Fourth, Fifth)
    ))
# No good reason to define these things in Muggle.R
# rather than here. But it helps keep in mind the distinction
# between Muggle code and Wizard code.

