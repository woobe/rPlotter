rPlotter
========

A collection of wrapper functions for graphics. The objective of this package is to make plotting easier for R beginners.

## Dependencies

This package depends on the following packages:
- ggplot2 (available on CRAN)
- stringr (available on CRAN)
- reshape2 (available on CRAN)
- EBImage (available on Bioconductor)

## Installation

```
require(devtools)
install_github("woobe/rPlotter")
```

## Usage Example

### Extracting colors from an online image for a custom palette

```
library(rPlotter)
pal_r <- extract_colours("http://developer.r-project.org/Logo/Rlogo-1.png")
par(mfrow = c(1,2))
pie(rep(1, 5), col = pal_r, main = "Palette based on R Logo")
hist(Nile, breaks = 5, col = pal_r, main = "Palette based on R Logo")
```

![example1](http://i.imgur.com/41Q40Hk.png)

## Credits

- Original K-means Palette by dsparks https://gist.github.com/dsparks/3980277
- 'xkcd' theme from http://drunks-and-lampposts.com/2012/10/02/clegg-vs-pleb-an-xkcd-esque-chart/  
- 'blank' theme from http://is-r.tumblr.com/post/32728434389/a-replacement-for-theme-blank
- Radar chart from http://statisticstoproveanything.blogspot.co.uk/2013/11/spider-web-plots-in-r.html
