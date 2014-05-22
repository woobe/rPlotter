#' Detect and extract dominant colours from an image
#' 
#' This function downloads an image and extracts the dominant colours from it. 
#' The code is based on dsparks' gist (https://gist.github.com/dsparks/3980277).
#' 
#' @param url_img URL of the image (can be PNG, JPG, JPEG, GIF, BMP)
#' @param num_col Number of dominant colours to be extracted (default = 5)
#' @param nme_pal Name of the new palette (default = "custom_palette")
#' 
#' @examples
#' ## Using the R Logo to create a 5-colour palette
#' pal_r <- extract_colours("http://developer.r-project.org/Logo/Rlogo-1.png")
#' par(mfrow = c(1,2))
#' pie(rep(1, 5), col = pal_r, main = "Palette based on R Logo")
#' hist(Nile, breaks = 5, col = pal_r, main = "Palette based on R Logo")
#' 

extract_colours <- function(url_img = "http://developer.r-project.org/Logo/Rlogo-1.png", 
                     num_col = 5, nme_pal = "custom_palette") {
  
  ## Assign a temp file name based on URL
  tmp_nme <- switch(str_sub(url_img, start = -3),
                    jpg = "temp_pic.jpg",
                    epg = "temp_pic.jpg",
                    png = "temp_pic.png",
                    bmp = "temp_pic.bmp",
                    gif = "temp_pic.gif")
  
  ## Get a local copy
  download.file(url_img, tmp_nme, mode = "wb")
  
  ## Read Image
  img <- readImage(tmp_nme)
    
  ## Resize Image (make it smaller so the remaining tasks run faster)  
  if (max(dim(img)[1:2]) > 100) {
    if (dim(img)[1] > dim(img)[2]) {
      img <- resize(img, w = 100)
    } else {
      img <- resize(img, h = 100)
    }
  }
  
  ## Melt
  img_melt <- melt(img)
  
  ## Reshape
  img_rgb <- reshape(img_melt, timevar = "Var3", idvar = c("Var1", "Var2"), direction = "wide")
  img_rgb$Var1 <- -img_rgb$Var1
  
  ## Detect dominant colours with kmeans (multiple starts)
  col_dom <- kmeans(img_rgb[, 3:5], centers = num_col, nstart = 5)
  
  ## Return k-means centers as RGB colours
  cus_pal <- matrix(sort(rgb(col_dom$centers)))
  colnames(cus_pal) <- nme_pal
  return(cus_pal)
  
}
