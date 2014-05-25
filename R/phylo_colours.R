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
#' Example 1a - Using the R logo to create a 5-colour palette
#' pal_r <- extract_colours("http://developer.r-project.org/Logo/Rlogo-1.png")
#' par(mfrow = c(1,2))
#' pie(rep(1, 5), col = pal_r, main = "Palette based on R Logo")
#' hist(Nile, breaks = 5, col = pal_r, main = "Palette based on R Logo")
#'
#' Example 1b - Using the Kill Bill poster to create a 5-colour palette
#' pal_kb <- extract_colours("http://www.moviegoods.com/Assets/product_images/1010/477803.1010.A.jpg")
#' par(mfrow = c(1,2))
#' pie(rep(1, 5), col = pal_kb, main = "Palette based on Kill Bill")
#' hist(Nile, breaks = 5, col = pal_kb, main = "Palette based on Kill Bill")
#' 

phylo_colours <- function(img_file = "http://developer.r-project.org/Logo/Rlogo-1.png", 
                     num_col = 5, nme_pal = "custom_palette", rsize=100) {
  
  ## Assign a temp file name based on URL
  #tmp_nme <- switch(str_sub(img_file, start = -3),
  #                  jpg = "temp_pic.jpg",
  #                  epg = "temp_pic.jpg",
  #                  png = "temp_pic.png",
  #                  bmp = "temp_pic.bmp",
  #                  gif = "temp_pic.gif")
  
  ## Get a local copy
  #download.file(url_img, tmp_nme, mode = "wb")
  
  ## Read Image
  img <- readImage(img_file)
    
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
  just_cols<-unique(img_rgb[,3:5])
  
  ## Cluster colours into colour-gram
  
  col_dists<-dist(img_rgb[,3:5])
  
  col_clust<-hclust(col_dists, "average")
  col_tree<-as.phylo(col_clust)
  
  scatterplot3d(img_rgb[,3:5],pch=19,color=rgb(img_rgb[,3:5]))
  cloud(value.1~value.2*value.3,img_rgb,pch=19,col=rgb(img_rgb[,3:5]),
        xlab="Green",ylab="Blue",zlab="Red")
  
  ## Detect dominant colours with kmeans (multiple starts)
  col_dom <- kmeans(img_rgb[, 3:5], centers = num_col, nstart = 5)
  
  ## Return k-means centers as RGB colours
  cus_pal <- matrix(sort(rgb(col_dom$centers)))
  colnames(cus_pal) <- nme_pal
  return(cus_pal)
  
}

#testing
library(fastcluster)
library(stringr)
library(EBImage)
library(reshape2)
library(scatterplot3d)
library(lattice)
library(animation)
library(ape)
img_file<-"http://upload.wikimedia.org/wikipedia/commons/5/53/MalePeacockSpider.jpg"
setwd("/home/annarussell/Temp")

saveGIF(for (i in seq(0,360,by=20)) print(cloud(value.1~value.2*value.3,img_rgb,pch=19,col=rgb(img_rgb[,3:5]),
      xlab="Green",ylab="Blue",zlab="Red", screen=list(z=i,x=-60))),
      )
