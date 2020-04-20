library(itunesr)
# install itunesr directly from CRAN:
install.packages("itunesr")

#  the development version from GitHub:
# install.packages("devtools")
devtools::install_github("amrrs/itunesr")

#Latest Reviews
#nt_reviews <- getReviews(360792792,'gb',1)

filename <- paste("Apple-App-Store-Reviews-for-NT-App", Sys.Date(),".csv")

#pages
x <- 10 
datalist = list()
for(i in 1:10) {
  nt_reviews <- getReviews(360792792,'gb',i)
  nt_reviews$i <- i
  datalist[[i]] <- nt_reviews
  print(i)
}

big_data = do.call(rbind, datalist)
nt_reviews <- big_data

write.csv(nt_reviews, filename)