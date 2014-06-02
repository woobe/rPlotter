#' Simulate Three Different Types of Colour Blindness (Deuteranopia, Protanopia & Tritanopia)
#' 
#' This function simulates three different types of colour blindness (http://www.color-blindness.com/2010/03/09/types-of-color-blindness/).
#' 
#' @param inp_col Original Colours (Hex Code or Colour Names)
#' 
#' @examples
#' set.seed(1234)
#' pal_pf <- extract_colours("http://www.scoutlondon.com/blog/wp-content/uploads/2012/05/Pulp-Fiction.jpg")
#' simulate_colours(pal_pf)
#' 

simulate_colours <- function(inp_col) {
  
  ## Simulate three types of colour blindness
  col_deu <- dichromat(inp_col, type = "deutan")
  col_pro <- dichromat(inp_col, type = "protan")
  col_tri <- dichromat(inp_col, type = "tritan")
  
  ## Create rblocks
  block <- make_block(data.frame(matrix(NA, nrow = length(inp_col), ncol = 4)))
  
  ## Update colours
  block[, 1] <- inp_col
  block[, 2] <- col_deu
  block[, 3] <- col_pro
  block[, 4] <- col_tri
  
  ## Rename columns
  colnames(block) <- c("Input", "Deutan", "Protan", "Tritan")
  
  ## Display
  rblocks::display(block)
  
}
