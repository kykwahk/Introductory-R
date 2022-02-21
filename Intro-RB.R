
##################################
## 부록 B. RStudio 설치 및 사용 ##
##################################

fah <- readline("Fahrenheit? ")
fah <- as.numeric(fah)
cel <- (fah-32)/1.8
print(paste("Celsius =", cel))

source("FahCel.R")
