library(vegan)
library(ggplot2)

data("dune")
tot_spp <- colSums(dune)
spp_names <- names(tot_spp)
tot_dot <- data.frame(spp_names, tot_spp)

## Turn this into a function.
ggplot(tot_dot,
       aes(x = tot_spp,
           y = reorder(spp_names, tot_spp))) +
  geom_point() +
  theme_classic() +
  theme(panel.grid.major.y = element_line(colour = "grey80",
                                          linetype = "12")) +
  xlab("Total Individuals") +
  ylab(NULL)
