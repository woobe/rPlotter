#' Create theme for ggplot2
#'
#' This wrapper is based on my favourite ggplot2 themes
#' 
#' 'xkcd' from http://drunks-and-lampposts.com/2012/10/02/clegg-vs-pleb-an-xkcd-esque-chart/  
#' 
#' 'blank' from http://is-r.tumblr.com/post/32728434389/a-replacement-for-theme-blank
#' 

create_ggtheme <- function(theme = "xkcd") {
  
  if (theme == "xkcd") {
    
    output_theme <- theme(panel.background = element_rect(fill="white"),
                          axis.ticks = element_line(colour=NA),
                          panel.grid = element_line(colour="white"),
                          axis.text.y = element_text(colour=NA),
                          axis.text.x = element_text(colour="black"),
                          text = element_text(size=16, family="Humor Sans"))
    
  } else if (theme == "blank") {
    
    output_theme <- theme_bw()
    output_theme$line <- element_blank()
    output_theme$rect <- element_blank()
    output_theme$strip.text <- element_blank()
    output_theme$axis.text <- element_blank()
    output_theme$plot.title <- element_blank()
    output_theme$axis.title <- element_blank()
    output_theme$plot.margin <- structure(c(0, 0, -1, -1), 
                                          unit = "lines", 
                                          valid.unit = 3L, 
                                          class = "unit")
    
  }
  
  ## Return
  return(output_theme)
  
}