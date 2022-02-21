
###################
## R 설치 및 사용 ##
###################

options(digits=3)
options(show.signif.stars=FALSE)
options(prompt=">> ")
options(continue="++ ")

.libPaths("D:/MyWorkspaceR/myRLibrary")

library(ggplot2)
setwd("D:/MyWorkspaceR")
cat("\nWelcome at ", date(), "\n")

11 + 12 + 13

seq(1:30) * 2

q()

fah <- readline("Fahrenheit? ")
fah <- as.numeric(fah)
cel <- (fah-32)/1.8
print(paste("Celsius =", cel))

source("FahCel.R")

Sys.getlocale()

Sys.setlocale("LC_ALL", "English_United States.1252")          

Sys.setlocale()
