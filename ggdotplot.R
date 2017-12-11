library(vegan)
library(ggplot2)
library(tidyverse)

data("dune")
#tot_spp <- colSums(dune)
#spp_names <- names(tot_spp)
#tot_dot <- data.frame(spp_names, tot_spp)

ggDot <- function(object,
                  total = TRUE,
                  mean = FALSE,
                  xlabel = "Total Individuals",
                  ...) {
  if ((!isTRUE(total)) & (!isTRUE(mean)))
    stop("Nothing to plot. Total or mean must be TRUE.")
  
  obj_names <- names(object)
  obj_totals <- colSums(object)
  obj_means <- colMeans(object)
  obj_sds <- apply(object, 2, sd)
  
  #  obj_totals <- object %>% summarize_all(sum)
  #  obj_means <- object %>% summarise_all(mean)
  #  obj_sds <- object %>% summarise_all(sd)
  
  object <- tibble(obj_names, obj_totals, obj_means, obj_sds)
  
  p <- ggplot(object) +
    theme_classic() +
    theme(panel.grid.major.y = element_line(colour = "grey90",
                                            linetype = "12")) +
    ylab(NULL) +
    xlab(xlabel)
  
  if (isTRUE(total)) {
    p <-
      p + geom_point(aes(x = obj_totals, y = reorder(obj_names, obj_totals)))
  }
  if (isTRUE(mean)) {
    p <- p + geom_segment(
      aes(
        x = obj_means - obj_sds,
        y = obj_names,
        xend = obj_means + obj_sds,
        yend = obj_names
      ),
      color = 'gray'
    ) +
      geom_point(
        aes(x = obj_means,
            y = reorder(obj_names, obj_totals)),
        shape = 21,
        color = 'gray',
        fill = 'white'
      )
  }
  return(p)
}

g <- ggDot(dune, total = TRUE, mean = FALSE, xlabel = "Number of Individuals")
  
## Turn this into a function.
ggplot(tot_dot,
       aes(x = tot_spp,
           y = reorder(spp_names, tot_spp))) +
  geom_point() +
  theme_classic() +
  theme(panel.grid.major.y = element_line(colour = "grey90",
                                          linetype = "12")) +
  xlab("Total Individuals") +
  ylab(NULL)
