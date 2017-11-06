# TukeyHSD.betadisper creates a set of confidence intervals on the differences 
# between the mean distance-to-centroid of the levels of the grouping factor 
# with the specified family-wise probability of coverage. The intervals are 
# based on the Studentized range statistic, Tukey's 'Honest Significant 
# Difference' method.


## Makes a plot of TukeyHSD run on beta dispersion.
## Use if anova on dispersion returns significant differences.

library(vegan)
library(ggplot2)

data("dune", "dune.env")
dist <- vegdist(dune, dist='bray')

dune.beta <- betadisper(dist, dune.env$Management)
anova(dune.beta)
dune.hsd <- TukeyHSD(dune.beta)
dune.hsd <- data.frame(dune.hsd$group)
dune.hsd$pairs <- row.names(dune.hsd)

## Turn this into a function.
## Based on http://stackoverflow.com/a/33644298
ggplot(dune.hsd,
       aes(colour = cut(
         p.adj, c(0, 0.05, 1),
         labels = c("p < 0.05", "Non Sig")
       ))) +
  geom_hline(yintercept = 0,
             lty = "12",
             color = "gray50") +
  geom_linerange(aes(pairs, ymin = lwr,
                     ymax = upr)) +
  geom_point(aes(pairs, diff)) +
  scale_color_manual(values = c("black", "gray80"),
                     name = "Significance") +
  coord_flip() +
  xlab(NULL) +
  ylab("Pairwise Difference")
