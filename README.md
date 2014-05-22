rPlotter
========

A collection of wrapper functions for graphics. The objective of this package is to make plotting easier for R beginners.

## Dependencies

This package depends the following packages:
1. ggplot2 (available on CRAN)
2. stringr (available on CRAN)
3. reshape2 (available on CRAN)
4. EBImage (available on Bioconductor)

## Installation

```
require(devtools)
install_github("woobe/rPlotter")
```

## Usage Example

### Extract colors from an online image

```
library(rPlotter)
pal_r <- extract_colours("http://developer.r-project.org/Logo/Rlogo-1.png")
par(mfrow = c(1,2))
pie(rep(1, 5), col = pal_r, main = "Palette based on R Logo")
hist(Nile, breaks = 5, col = pal_r, main = "Palette based on R Logo")
```

![example1](http://i.imgur.com/41Q40Hk.png)

