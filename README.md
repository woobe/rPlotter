rPlotter
========

A collection of wrapper functions for graphics. The objective of this package is to make plotting easier for R beginners.

## Dependencies

This package depends on the following packages:
- ggplot2 (available on CRAN)
- stringr (available on CRAN)
- reshape2 (available on CRAN)
- dichromat (available on CRAN)
- EBImage (available on Bioconductor)
- rblocks (available on GitHub)

## Installation

### Packages on CRAN

```
install.packages(c("ggplot2", "stringr", "reshape2", "dichromat"))
```

### Packages on Biocondunctor

```
source("http://bioconductor.org/biocLite.R")
biocLite("EBImage")
```

### Packages on GitHub

```
devtools::install_github("ramnathv/rblocks")
```

### Finally, rPlotter

```
devtools::install_github("woobe/rPlotter")
```


## Example: extract_colours(...)

```
library(rPlotter)
```
```
## Using the R Logo
pal_r <- extract_colours("http://developer.r-project.org/Logo/Rlogo-1.png")
par(mfrow = c(1,2))
pie(rep(1, 5), col = pal_r, main = "Palette based on R Logo")
hist(Nile, breaks = 5, col = pal_r, main = "Palette based on R Logo")
```

![output_1a](http://i.imgur.com/41Q40Hk.png)

```
## Using a poster from the movie "Kill Bill"
pal_kb <- extract_colours("http://www.moviegoods.com/Assets/product_images/1010/477803.1010.A.jpg")
par(mfrow = c(1,2))
pie(rep(1, 5), col = pal_kb, main = "Palette based on Kill Bill")
hist(Nile, breaks = 5, col = pal_kb, main = "Palette based on Kill Bill")
```

![output_1b](http://i.imgur.com/XUqOTSk.png)

```
## Using Homer Simpson
pal_s <- extract_colours("http://haphappy.com/wp-content/uploads/2011/03/homerbeer2.png")
par(mfrow = c(1,2))
pie(rep(1, 5), col = pal_s, main = "Palette based on Simpsons")
hist(Nile, breaks = 5, col = pal_s, main = "Palette based on Simpsons")
```

![output_1c](http://i.imgur.com/BiNAO9H.png)


## Example: display_colours(...)

```
set.seed(1234)
pal_pf <- extract_colours("http://www.scoutlondon.com/blog/wp-content/uploads/2012/05/Pulp-Fiction.jpg")
display_colours(pal_pf)
```

![output_disp](http://i.imgur.com/tpsealV.png)

## Example: simulate_colours(...)

```
set.seed(1234)
pal_pf <- extract_colours("http://www.scoutlondon.com/blog/wp-content/uploads/2012/05/Pulp-Fiction.jpg")
simulate_colours(pal_pf)
```

![output_sim](http://i.imgur.com/xhQsb5y.png)

## Related Blog Posts

- [Towards (Yet) Another R Colour Palette Generator (27/05/2014)](http://bit.ly/bib_colour1)

![blog_1a](http://i.imgur.com/YwCy6lZ.png)


## Credits

- Original K-means Palette by dsparks https://gist.github.com/dsparks/3980277
- [Karthik Ram](https://github.com/karthik) for the original [wesanderson](https://github.com/karthik/wesanderson) palette generator.
- [Russell Dinnage](https://github.com/rdinnager) and [Noam Ross](https://github.com/noamross) for new ideas and suggestions.
- [Ramnath Vaidyanathan](https://github.com/ramnathv) for [rblocks](https://github.com/ramnathv/rblocks).
- 'xkcd' theme from http://drunks-and-lampposts.com/2012/10/02/clegg-vs-pleb-an-xkcd-esque-chart/  
- 'blank' theme from http://is-r.tumblr.com/post/32728434389/a-replacement-for-theme-blank
- Radar chart from http://statisticstoproveanything.blogspot.co.uk/2013/11/spider-web-plots-in-r.html
