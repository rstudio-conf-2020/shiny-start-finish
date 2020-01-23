# Muggle World
library(dplyr)
library(ggplot2)
library(DT)

muggle_plot <- function(xvar, yvar) {
  ggplot(diamonds %>% sample_n(size = 200), 
         aes(x = !!xvar,  y  = !!yvar)) +
    geom_point()
}

# test for Muggle functionality:
# muggle_plot(as.name("cut"), as.name("price"))
