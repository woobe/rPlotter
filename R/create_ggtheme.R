#' Create customised themes for ggplot2 object
#'
#' This function creates a ggplot2 theme object based on my favourite templates.
#' 
#' @param theme The name of the temaplate (blank, xkcd, more to come ...)
#' 
#' @examples
#' theme_blank <- create_ggtheme("blank")
#' theme_xkcd <- create_ggtheme("xkcd")
#' 
 

create_ggtheme <- function(theme = "blank") {
  
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