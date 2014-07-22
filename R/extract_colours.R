#' Detect and extract dominant colours from an image
#' 
#' This function downloads an image and extracts the dominant colours from it. 
#' The code is based on dsparks' gist (https://gist.github.com/dsparks/3980277).
#' 
#' @param url_img URL of the image (can be PNG, JPG, JPEG, TIFF) or a local file. Can also
#' be an \code{EBImage} "Image" object
#' @param num_col Number of dominant colours to be extracted (default = 5)
#' @param rsize Size to reduce original image to, for further processing. This is the size, in pixels, 
#' for the largest dimension, from which colours are extracted. Please be careful with this option, as setting it 
#' too high can result in an extremely large processing time (or even running out of physical memory).
#' 
#' @examples
#' #Example 1a - Using the R logo to create a 5-colour palette
#' pal_r <- extract_colours("http://developer.r-project.org/Logo/Rlogo-1.png")
#' par(mfrow = c(1,2))
#' pie(rep(1, 5), col = pal_r, main = "Palette based on R Logo")
#' hist(Nile, breaks = 5, col = pal_r, main = "Palette based on R Logo")
#'
#' #Example 1b - Using the Kill Bill poster to create a 5-colour palette
#' pal_kb <- extract_colours("http://www.moviegoods.com/Assets/product_images/1010/477803.1010.A.jpg")
#' par(mfrow = c(1,2))
#' pie(rep(1, 5), col = pal_kb, main = "Palette based on Kill Bill")
#' hist(Nile, breaks = 5, col = pal_kb, main = "Palette based on Kill Bill")
#' 
#' #Example 1c - Using Homer Simpson
#' pal_s <- extract_colours("http://haphappy.com/wp-content/uploads/2011/03/homerbeer2.png")
#' par(mfrow = c(1,2))
#' pie(rep(1, 5), col = pal_s, main = "Palette based on Simpsons")
#' hist(Nile, breaks = 5, col = pal_s, main = "Palette based on Simpsons")
#' @export
#' @import EBImage reshape2

extract_colours <- function(
  url_img = "http://developer.r-project.org/Logo/Rlogo-1.png", num_col = 5, rsize = 100) {
  
  ## Read Image
  if (class(url_img) != "Image") {
    img <- readImage(url_img) # local file or url
  } else {
    img <- url_img # is already a loaded "Image"
  }
  
  ## Resize Image (make it smaller so the remaining tasks run faster)  
  if (max(dim(img)[1:2]) > rsize) {
    if (dim(img)[1] > dim(img)[2]) {
      img <- resize(img, w = rsize)
    } else {
      img <- resize(img, h = rsize)
    }
  }
  
  ## Melt
  img_melt <- melt(img)
  
  ## Reshape
  img_rgb <- reshape(img_melt, timevar = "Var3", idvar = c("Var1", "Var2"), direction = "wide")
  img_rgb$Var1 <- -img_rgb$Var1
  
  ## Detect dominant colours with kmeans (multiple starts)
  col_dom <- kmeans(img_rgb[, 3:5], centers = num_col, nstart = 3, iter.max = 100)
  
  ## Return k-means centers as RGB colours
  cus_pal <- sort(rgb(col_dom$centers))
  return(as.character(cus_pal))
  
}
