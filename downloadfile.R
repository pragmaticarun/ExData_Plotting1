downloadFile <- function() {
   if(!file.exists("./data")) {
      dir.create(".data")
   }

   setwd("./data")
   download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  destfile = "data/pc.zip",method = "curl")
   dateDownloaded <- date()
   setwd("../")
}

