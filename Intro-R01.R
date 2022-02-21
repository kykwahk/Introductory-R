
##################
## 제1장 R 개요 ##
##################

##################
## 1.2 R 맛보기 ##
##################

1 + 2

c(1,2,3,4,5)
c("Tiger", "Lion", "Elephant")

1:5

x <- 1:5
x

y <- 2
x + y

z <- x + y
z
x
y

3 < 4
if (3 < 4) "Yes" else "No"

m <- matrix(c(1,2,3,4,5,6), 3, 2)
m
t(m)

a <- "Tiger"
a

print("Welcome to R World")

paste("Tiger", "Lion", "Elephant")

myclass <- readline("What is your favorite class? ")
myclass

paste("My favorite class is", myclass)

urban.pop <- c(50,47,69,47,47,57,72,42,51,40)
life.exp <- c(67,72,77,65,74,75,76,59,72,60)
mean(life.exp)
sd(life.exp)
cor(life.exp, urban.pop)

life.lm <- lm(life.exp ~ urban.pop)
life.lm

#[그림 1-1]
windows(width=7.0, height=5.5)
plot(urban.pop, life.exp, col="blue", pch=19,
     main="Urban Population Percent vs. Life Expectancy",
     xlab="Urban Population Percent (%)",
     ylab="Life Expectancy (age)")
abline(life.lm, col="red")

###############################
## 1.3 R 소프트웨어 이해하기 ##
###############################

## 작업환경

getwd()

setwd("D:/MyWorkspaceR")
getwd()

setwd("..")
getwd()
setwd("MyWorkspaceR")
getwd()

q()

save.image()

ls()

rm(list=ls())
ls()

x <- 100
y <- c(2,3,5,7)
hero <- c("Superman", "Batman", "Spiderman")
f <- function(y) (y-32)/1.8
ls()
ls(pattern="e")

ls.str()

z <- 3.14
z
rm(z)
z

rm(x, y)

ls()
rm(list=ls())
ls()

hero <- c("Superman", "Batman", "Spiderman")
hero
save(hero, file="hero.rda")

rm(hero)
hero

load("hero.rda")
hero

history()

history(10)
history(Inf)

f <- function(y) (y-32)/1.8
f(100)
z <- .Last.value
z

## 패키지

library()

Sys.getlocale()
Sys.setlocale("LC_ALL", "English_United States.1252")
library()
Sys.setlocale()

installed.packages()
installed.packages()[,c("Package", "Version")]

search()

m <- matrix(c(1,2,3,4,5,6), ncol=2)
m
t(m)

t <- function(x) x + 100
t(m)
ls()

base::t(m)

rm(t)
ls()

xyplot(dist ~ speed, data=cars)

library(lattice)
search()
xyplot(dist ~ speed, data=cars)

detach(package:lattice)
search()

install.packages("ggplot2")

.libPaths()

help(package="ggplot2")
library(help=ggplot2)

library(ggplot2)
ls("package:ggplot2")
detach(package:ggplot2)

data()

cars
head(cars)
tail(cars)
head(cars, 3)

help(cars)
?cars

data(package="MASS")

data(Animals, package="MASS")
head(Animals)

head(UScrime)

library(MASS)
head(UScrime)
head(Rabbit)

help(UScrime, package="MASS")
help(UScrime)
?UScrime

## 도움말

help.start()

help(Syntax)
help(cars)

help(median)
?median

args(median)

example(median)

help.search("xyplot")
??xyplot

help(xyplot, package="lattice")

hero.vector <- c("Superman", "Spiderman", "Batman")

apropos("vector")

?regex

apropos("q$")
apropos("[7-9]")
apropos("xy+")

RSiteSearch("topicmodels")

install.packages("sos")
library(sos)
findFn("social network analysis")

##############
## 연습문제 ##
##############

# 1-1
demo(graphics)
demo(image)
demo(persp)
demo()

# 1-2
example("Titanic")

# 1-3
install.packages("fortunes")
library(fortunes)
?fortune

fortune(343)
fortune()
