
#############################
##   R 기초와 활용(2판)    ##
## (곽기영, 도서출판 청람) ## 
#############################

################################
## 제8장 함수와 논리흐름 제어 ##
################################

##############
## 8.1 함수 ##
##############

x <- c(30, 50, 90)
tlength <- round(x*0.9144, digits=1)
result <- paste(tlength, "m", sep="")
print(result)

source("transLength.R")

transLength <- function(x) {
  tlength <- round(x*0.9144, digits=1)
  result <- paste(tlength, "m", sep="")
  return(result)
}
ls()

y <- c(100,150,200)
transLength(y)

trans2 <- transLength
trans2(y)

trans2

transLength <- function(x) {
  tlength <- round(x*0.9144, digits=1)
  result <- paste(tlength, "m", sep="")
}

y <- c(100,150,200)
transLength(y)

print(transLength(y))

transLength <- function(x) {
  tlength <- round(x*0.9144, digits=1)
  paste(tlength, "m", sep="")
}
y <- c(100,150,200)
transLength(y)

transLength <- function(x) {
  if(!is.numeric(x)) return("Not a number")
  tlength <- round(x*0.9144, digits=1)
  paste(tlength, "m", sep="")
}
transLength("ABC")

f1 <- function(x, y) {x + y}
f2 <- function(x, y) x + y
f1(1,3)
f2(1,3)

transLength <- function(x) paste(round(x*0.9144, digits=1), "m", sep="")

transLength <- function(x, mult, unit) {
  tlength <- round(x*mult, digits=1)
  paste(tlength, unit, sep="")
}
y <- c(100,150,200)
transLength(y, mult=3, unit="ft")
transLength(y, mult=36, unit="in")

y <- c(100,150,200)
transLength(y)

transLength <- function(x, mult=0.9144, unit="m") {
  tlength <- round(x*mult, digits=1)
  paste(tlength, unit, sep="")
}

y <- c(100,150,200)
transLength(y)

y <- c(100,150,200)
transLength(x=y, mult=3, unit="ft")
transLength(y, 3, "ft")

transLength <- function(x, mult=0.9144, unit="m", ...) {
  tlength <- round(x*mult, ...)
  paste(tlength, unit, sep="")
}

y <- c(100,150,200)
transLength(y, digits=2)

y <- c(100,150,200)
transLength(y)

transLength <- function(x, mult=0.9144, unit="m", digits=1) {
  tlength <- round(x*mult, digits=digits)
  paste(tlength, unit, sep="")
}
y <- c(100,150,200)
transLength(y)

transLength <- function(x, mult=0.9144, unit="m", FUN=round, ...) {
  tlength <- FUN(x*mult, ...)
  paste(tlength, unit, sep="")
}
y <- c(100,150,200)
transLength(y)

y <- c(100,150,200)
transLength(y, FUN=signif, digits=3)
transLength(y, FUN=floor)

ls()

x <- 11:15
scopeTest <- function(x) {
  cat("This is x: ", x, "\n")
  rm(x)
  cat("This is x after removing it: ", x, "\n")
}

scopeTest(x=15:11)

#######################
## 8.2 논리흐름 제어 ##
#######################

x <- pi
y <- 3
if (x > y) x
if (x < y) x

if (x < y) x else y

x <- pi
y <- 1:5
if (x < y) x else y
if (x > y) x else y

test <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
yes <- 1:5
no <- 0
ifelse(test, yes, no)

x <- pi
y <- 1:5
ifelse(x > y, x, y)

center <- function(x, type) {
  switch(type,
         mean=mean(x),
         median=median(x),
         trimmed=mean(x, trim=0.1))
}
x <- c(2,3,5,7,11,13,17,19,23,29)
center(x, "mean")
center(x, "median")
center(x, "trimmed")

center <- function(x, type) {
  switch(type,
         mean=mean(x),
         median=median(x),
         trimmed=mean(x, trim=0.1),
         "Choose one of mean, median, and trimmed")
}
center(x, "other")

repeat print("hello")

i <- 5
repeat {if(i > 25) break 
  else {
    print(i)
    i <- i + 5
  }
}

i <- 5
repeat {if(i > 25) break else {print(i); i <- i + 5}}

i <- 5
while (i <= 25) {
  print(i)
  i <- i + 5
}

flip <- function() sample(x=c("H", "T"), size=1)
nflip <- 0
nhead <- 0
while (nhead < 10) {
  if (flip() == "H") {
    nhead <- nhead + 1
  } else {
    nhead <- 0
  }
  nflip <- nflip + 1
}
nflip

for (i in seq(from=5, to=25, by=5)) print(i)

for (i in seq(from=5, to=25, by=5)) i

i <- 1
for (i in seq(from=5, to=25, by=5)) i
i

head(iris, 3)
iris.m <- iris[c(1:4)]
head(iris.m, 3)

out <- vector(mode="numeric", length=ncol(iris.m))
out
for (i in seq_along(iris.m)) {
  out[[i]] <- mean(iris.m[[i]])
}
out

result <- vector("numeric", ncol(iris.m))
names(result) <- names(iris.m)
for (nm in names(iris.m)) {
  result[[nm]] <- mean(iris.m[[nm]])
}
result

levels(iris$Species)
for (species in levels(iris$Species)) {
  s <- subset(iris, subset=(species==iris$Species))
  write.csv(s, file=paste0("iris-", species, ".csv"))
}
list.files(pattern="iris-.*.csv")

str(USArrests)
head(USArrests, 3)

rescaling <- function(x) {
  round((x - mean(x))/sd(x), 2)
}

for (i in seq_along(USArrests)) {
  USArrests[[i]] <- rescaling(USArrests[[i]])
}
head(USArrests, 3)

means <- c(100, 110, 120)
output <- vector("list", length(means))
for (i in seq_along(means)) {
  n <- sample(10, 1)
  output[[i]] <- round(rnorm(n=n, mean=means[[i]], sd=25), 0)
}
output
unlist(output)

##############
## 연습문제 ##
##############

# 8-1
isEven <- function(x) (x %% 2) == 0

nums <- c(-5:5, Inf, -Inf, NA, NaN)
nums
isEven(nums)

# 8-2
countEven <- function(x) {
  count <- 0
  for (val in x) {
    if(!is.na(val %% 2 == 0) & (val %% 2 == 0)) count <- count + 1
  }
  print(count)
}

nums <- c(-5:5, Inf, -Inf, NA, NaN)
nums
countEven(nums)

# 8-3
piLarger <- function(x) {
  ifelse(x > pi, TRUE, FALSE)
}

piLarger(c(3, 1:5))

# 8-4
scaling <- function(x) {
  x <- x[!is.na(x)]
  z <- (x - mean(x))/sd(x)
  return(z)
}

nums <- c(1,2,3,4,5,NA)
scaling(nums)

# 8-5
myRemove <- function(x, pattern) {
  return(gsub(pattern, "", x))
}

x <- "I saw her standing there; Misery; Anna (Go to him); Chains; Boys; Ask me why"
myRemove(x, ";")

# 8-6
classes <- function(x) {
  if (is.data.frame(x) | is.matrix(x)) {
    for (i in 1:ncol(x)) cat(colnames(x)[i], "is", class(x[,i]), "\n")
    }
  else cat("It is neither a data frame nor a matrix.", "\n")
}

classes(iris)
classes(LakeHuron)

# 8-7
stats <- function(x, med=FALSE) {
  mean <- round(mean(x, na.rm=TRUE), 1)
  sd <- round(sd(x, na.rm=TRUE), 1)
  cat("Mean is", mean, "\b and Standard Deviation is", sd, "\b.\n")
  if (med==TRUE) {
    median <- round(median(x, na.rm=TRUE), 1)
    cat("Also Median is", median, "\b.\n")
  }
}

stats(1:50)
stats(1:50, med=TRUE)

# 8-8
alice <- c("Alice", "was", "beginning", "to", "get", "very", "tired", "of",
           "sitting", "by", "her", "sister", "on", "the", "bank", "and",
           "of", "having", "nothing", "to", "do", "once", "or", "twice", 
           "she", "had", "peeped", "into", "the", "book", "her", "sister",
           "was", "reading", "but", "it", "had", "no", "pictures", "or", 
           "conversations", "in", "it", "and", "what", "is", "the", "use",
           "of", "a", "book", "thought", "Alice", "without", "pictures", 
           "or", "conversations")

ncharText <- function(x) {
  nchar.x <- nchar(x)
  for (i in min(nchar.x):max(nchar.x)) {
    cat("These words have", i, "letter(s):", "\n")
    print(toString(unique(alice[nchar.x == i])))
  }
}

ncharText(alice)

# 8-9
myMean <- function(x, remove.outlier=FALSE, mult.outlier=2) {
  if(remove.outlier==TRUE) {
    outlier.index <- 
      (x > mean(x, na.rm=TRUE) + mult.outlier*sd(x, na.rm=TRUE)) | 
      (x < mean(x, na.rm=TRUE) - mult.outlier*sd(x, na.rm=TRUE))
    x.new <- x[!outlier.index]
    result <- mean(x.new, na.rm=TRUE)
  } else {
    result <- mean(x, na.rm=TRUE)
  }
  return(result)
}

library(car)
x <- Salaries$salary

mean(x)
myMean(x)

myMean(x, remove.outlier=TRUE)

myMean(x, remove.outlier=TRUE, mult.outlier=3)

# 8-10
for(month in month.name) {
  cat("The month of", month, "\n")
}

# 8-11
heroes <- c("Superman","Batman","Spiderman")
for(hero in heroes) {
  cat(sprintf("Hello %s...\n", hero))
}

# 8-12
flip <- function() sample(x=c("H", "T"), size=1)
nflip <- 0
nhead <- 0
repeat {if (nhead >= 10) break
  else {
    if (flip() == "H") {
      nhead <- nhead + 1
    } else {
      nhead <- 0
    }
    nflip <- nflip + 1
  }
}
nflip

# 8-13
lettersTry <- function() paste(sample(LETTERS, 3, replace=TRUE), collapse="")
ntry <- 0
flag <- TRUE
az <- data.frame(try=numeric(), alphabet=character())
while (flag) {
  ntry <- ntry + 1
  a <- lettersTry()
  az <- rbind(az, data.frame(try=ntry, alphabet=a))
  cat(ntry, "try:", a, "\n")
  if (a=="ABC") {
    flag <- FALSE
  } else {
    flag <- TRUE
  }
}
str(az)
head(az); tail(az)
