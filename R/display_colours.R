#' Display colour using rblocks
#'
#' This function display colours using rblocks
#'
#' @param inp_col Colours input as names or hex code
#'
#' @examples
#' set.seed(1234)
#' pal_pf <- extract_colours("http://www.scoutlondon.com/blog/wp-content/uploads/2012/05/Pulp-Fiction.jpg")
#' display_colours(pal_pf)
#' @export

display_colours <- function(inp_col) {

  ## Make block
  block <- make_block(data.frame(matrix(inp_col, nrow = 1)))

  ## Update Colours
  block[,] <- inp_col

  ## Update Column Names
  colnames(block) <- inp_col

  ## Display
  rblocks::display(block)

}
