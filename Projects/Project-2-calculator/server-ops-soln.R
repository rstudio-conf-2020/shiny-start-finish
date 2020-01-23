# Handles the operation buttons

op_details <- tibble::tribble(
  ~ op,    ~ args,   ~ fun,
  "minus", "either",  `-`,
  "plus",  "either",  `+`,
  "times", "two",     `*`,
  "divide","two",     `-`,
  "push", "none",    I
)


# Perhaps better to use purrr or a loop for this

# Debugging: get rid of the last_op(input$push) so
# that repeated events won't generate a 
observeEvent(input$push, {
  last_op(input$push);last_op("push")})
observeEvent(input$plus, {
  last_op(input$plus);last_op("plus")})
observeEvent(input$minus, {
  last_op(input$minus);last_op("minus")})
observeEvent(input$times, {
  last_op(input$times); last_op("times")})
observeEvent(input$divide, {
  last_op(input$divide); last_op("divide")})

# keep the stack display up to date
output$stack0 <- renderText(stack0())
output$stack1 <- renderText(stack1())
output$stack2 <- renderText(stack2())

# Make ignoreInit and nchar(last_op()) a debugging exercise

observeEvent(nchar(last_op()) != 0,
             ignoreInit = TRUE, {
  what <- last_op()
  op_row <- which(op_details$op == what)
  if (length(op_row) == 0) stop("No such operator")
  args <- op_details$args[op_row]
  fun  <- op_details$fun[op_row][[1]] # another debugging [[1]]
  current_num <- as.numeric(entry_string())
  # Convert either to one or two depending on what's in stack0
  if (args == "either") 
    args <- ifelse(is.na(stack0()), "one", "two")
  if (args == "none") {
    # get the current entry and push it
    if (!is.na(current_num)) {
      stack2(stack1()) # take away parens for a debugging exercise
      stack1(stack0())
      stack0(current_num)
      entry_string("")
    }
  } else if (args == "one") {
      entry_string(as.character(fun(current_num)))
  } else if (args == "two") {
    if (is.na(stack0())) stop("Need a second argument.")
    else {
      entry_string(as.character(
        fun(stack0(), current_num)))
      stack0(stack1())
      stack1(stack2())
      stack2(NA)
    }
    
  } else stop("Development error: Invalid argument count.")
  
})