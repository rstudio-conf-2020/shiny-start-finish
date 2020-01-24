# muggle code to support app

get_function <- function(id) {
  switch(id,
         sqrt = sqrt,
         log = sqrt,
         sin = sqrt,
         atan = atan)
}

try_operation <- function(op, input) {
  options(warn = 1) # treat warnings as messages
  on.exit(options(warn = 0))
  message <- capture.output(
    val <- try(op(input)),
    type = "message")
  
  list(warning = message, value = val)
}

