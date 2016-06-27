rm(list =ls())
library(data.table)
library(dplyr)
library(magrittr)
library(ggplot2)

dat0 <- read.csv2("data/imagematning.csv")


generateYear <- function(year, dat){
  # dat <- dat0
  # year <- 2014
  
  dat$Ar <- year
  index <- runif(1, 0.94, 1.06) - (2015 - year)/30
  
  numvars <- grep("Sparare|Pensionar", names(dat))
  
  dat[,numvars] <- lapply(dat[,numvars], function(x) x * index)
  
  return(dat)
}


# generate a few years worth of dummy-data
set.seed(20160627)
ll = lapply(2009:2014, generateYear, dat = dat0)

tmp <- do.call("rbind", ll)

dat1 <- rbind(dat0, tmp)

# look how it went
ggplot(dat1)+
  aes(x = Ar, y = SparareLag, color = Nyckeltal)+
  geom_line()

# save jsondata
out_json <- toJSON(dat1)

# write to disc
writeLines(out_json, "data/data.json")
