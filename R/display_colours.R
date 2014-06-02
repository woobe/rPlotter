#' Display colour using rblocks
#'
#' This function display colours using rblocks
#'
#' @param inp_col Colours input as names or hex code
#'
#' @examples
#' To be updated.

display_colours <- function(inp_col) {

  ## Make block
  block <- rblocks::make_block(data.frame(matrix(inp_col, nrow = 1)))

  ## Update Colours
  block[,] <- inp_col

  ## Update Column Names
  colnames(block) <- inp_col

  ## Display
  rblocks::display(block)

}
