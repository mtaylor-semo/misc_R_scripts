## Function to creates a stressplot using ggplot2
## Code based on vegan:::stressplot.default
## Overall format follows vegan::stressplot

## Below function is an example.

## Most settings match the format of vegan::stressplot 
ggStress <- function(object,
                     dis,
                     pch = 19,
                     p.col = "blue",
                     p.size = 1.5,
                     l.col = "red",
                     show.stress = TRUE,
                     fill.col = "black", # Do I want to go down this road? TOO much flexibility?
                     ...) {
  if (!(inherits(object, "metaMDS") || all(c("points", "stress") %in%
                                           names(object))))
    stop("Can be used only with objects that are compatible with MASS::isoMDS results")
  
  if (missing(dis)) {
    if (inherits(object, "metaMDS")) {
      invisible(dis <- metaMDSredist(object))
    }
    else
      stop("Needs dissimilarities 'dis'")
  }

  if (attr(dis, "Size") != nrow(object$points))
    stop("Dimensions do not match in ordination and dissimilarities")
  
  # Create a tibble. For now, it was just to learn how
  # to create a tibble. It may not remain.
  tib <- tibble::tibble(object$diss, object$dist, object$dhat)
  colnames(tib) <- c("diss", "dist", "dhat")
  
  stress <- fit$stress
  R2nm <- format(1 - stress ^ 2, digits = 3)
  R2l <- format(cor(tib$dist, tib$dhat) ^ 2, digits = 3)
  
  coord_x <- min(tib$diss)
  coord_y <- max(tib$dist)
  
  lbl1 <- paste0("Nonmetric~fit~italic(R)^2 ==", R2nm)
  lbl2 <- paste0("Linear~fit~italic(R)^2 ==", R2l)
  lbl3 <- paste0("Stress ==", round(stress, 3))
  
  p <- ggplot(tib,
              aes(x = diss, y = dist)) +
    geom_point(shape = pch, color = p.col, size = p.size, fill = fill.col) +
    geom_step(aes(x = diss, y = dhat), color = l.col) +
    annotate(
      geom = "text",
      x = coord_x,
      y = coord_y,
      hjust = 0,
      label = lbl1,
      parse = TRUE
    ) +
    annotate(
      geom = "text",
      x = coord_x,
      y = 0.95 * coord_y,
      hjust = 0,
      label = lbl2,
      parse = TRUE
    ) +
    labs(x = "Observed Dissimilarity",
         y = "Ordination Distance")
  
  if (isTRUE(show.stress)) {
    p <- p + annotate(
      geom = "text",
      x = coord_x,
      y = 0.90 * coord_y,
      #  y = 0.90*coord_y - strheight(lbl2), #from vegan::stressplot
      hjust = 0,
      label = lbl3,
      parse = TRUE
    )
  }
  return(p)
}

## Example
library(ggplot2)
library(vegan)

data("dune")
fit <- metaMDS(dune)

# Change the blue dots to black
p <- ggStress(fit, p.col = "black")

# Can modify using additional ggplot functions.
p + theme_classic()
p

## For comparison
stressplot(fit)


