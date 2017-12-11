library(vegan)
library(ggplot2)

data("dune")
data("dune.env")
data("BCI")
data("BCI.env")

dist_dune <- vegdist(dune, method = "bray")
dist_bci <- vegdist(BCI, method = "bray")

dune.beta <- betadisper(dist_dune, dune.env$Management)
anova(dune.beta)

bci.beta <- betadisper(dist_bci, BCI.env$Habitat)
anova(bci.beta)

## Develop function to plot beta dispersion
