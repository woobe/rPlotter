#' Interpolate colour palette to render more colours within the input range
#'
#' This function extend a colour palette by interpolation.
#'
#' @param inp_col Colours input as names or hex code
#' @param n_col Number of output colours
#'
#' @examples
#' set.seed(1234)
#' inp_col <- extract_colours("http://www.scoutlondon.com/blog/wp-content/uploads/2012/05/Pulp-Fiction.jpg")
#' out_col <- interpolate_colours(inp_col, n_col = 20)
#' display_colours(out_col)
#' @export

interpolate_colours <- function(inp_col, n_col) {
  
  out_col <- colorRampPalette(inp_col, interpolate = 'spline')(n_col)
  
  return(out_col)
  
}
