#' Reduce palette by removing colours with low saturation, or low or high luminance
#' @param pal A palette as a character vector containing hexidecimal coded colours
#' @param sat.thresh Minimum saturation of colours in resulting palette (between 0 and 1)
#' @param light.thresh Maximum luminosity of colours in resulting palette (between 0 and 1)
#' @param dark.thresh Minimum luminosity of colours in resulting palette (between 0 and 1)
#' @export
#' @import colorspace 
palette_reduce <- function(pal, sat.thresh = NULL, light.thresh = NULL, dark.thresh = NULL) {
  cols <- hex2RGB(pal, gamma = TRUE)
  if (!is.null(sat.thresh)) {
    pal <- pal[coords(as(cols, "HLS"))[,3] > sat.thresh] 
  }
  if (!is.null(light.thresh)) {
    ## convert light thresholds from proportions into L*A*B* scale
    light.thresh <- ceiling((1-light.thresh)*100)
    pal <- pal[coords(as(cols, "LAB"))[,1] < light.thresh] 
  }
  ## get rid of dark colours if desired
  if (!is.null(dark.thresh)) {
    ## convert dark thresholds from proportions into L*A*B* scale (perceptual)
    dark.thresh <- ceiling(dark.thresh*100)
    pal <- pal[coords(as(cols, "LAB"))[,1] > dark.thresh]  
  }
  pal
}