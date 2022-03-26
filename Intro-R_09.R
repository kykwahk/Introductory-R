
#############################
##   R 기초와 활용(2판)    ##
## (곽기영, 도서출판 청람) ## 
#############################

#########################
## 제9장 데이터 전처리 ##
#########################

##################################
## 9.2 데이터 유형 및 구조 변환 ##
##################################

## 데이터 유형 변환

mode(1.414)
mode(c(1.414, 1.732))
mode("Batman")
mode(c("Batman", "Superman", "Spiderman"))
mode(factor("High", "Medium", "Low"))
mode(as.Date("2020-12-31"))
mode(5 > 2)
mode(list(1.23, "Apple", c(2,3,5,7)))
mode(data.frame(x=1:3, y=c("H", "M", "L")))
mode(mean)

d <- as.Date("2030-12-31")
mode(d)
length(d)
as.integer(d)
class(d)
d + 1

methods(summary)
methods(print)
methods(plot)

as.numeric(1.618)
as.integer(1.618)
as.character(1.618)
as.numeric("gold")

as.numeric(c("-1", "1.618", "3.14"))
as.numeric(c("-1", "1.618", "3.14", "and"))
as.character(11:15)

as.numeric(FALSE)
as.numeric(TRUE)

logical.v <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
sum(logical.v)
days.of.months <- c(31,28,31,30,31,30,31,31,30,31,30,31)
sum(days.of.months > 30)

## 데이터 구조 변환

vec <- 1:6
vec
as.list(vec)
list(vec)

vec <- 1:6
cbind(vec)
as.matrix(vec)
rbind(vec)
matrix(vec, 2, 3)

vec <- 1:6
as.data.frame(vec)
as.data.frame(rbind(vec))

mat <- matrix(1:6, 3, 2)
mat
as.vector(mat)
as.list(mat)
as.data.frame(mat)

lst <- list(odd=c(1,3,5), even=c(2,4,6))
lst
unlist(lst)
as.vector(lst)
identical(lst, as.vector(lst))
lst2 <- list(odd=c(1,3,5), even=c("two", "four", "six"))
lst2
unlist(lst2)

lst <- list(odd=c(1,3,5), even=c(2,4,6))
matrix(unlist(lst), 3, 2)
matrix(unlist(lst), 3, 2, dimnames=list(NULL, names(lst)))
matrix(lst)
as.matrix(lst)

lst <- list(odd=c(1,3,5), even=c(2,4,6))
as.data.frame(lst)
lst2 <- list(odd=c(1,3,5), even=c("two", "four", "six"))
as.data.frame(lst2)
str(as.data.frame(lst2)$odd)
str(as.data.frame(lst2)$even)

dfm <- data.frame(odd=c(1,3,5), even=c(2,4,6))
dfm
dfm[1,]
str(dfm[1,])
dfm[,1]
str(dfm[,1])
dfm[[1]]
str(dfm[[1]])

dfm <- data.frame(odd=c(1,3,5), even=c(2,4,6))
as.vector(as.matrix(dfm))
dfm2 <- data.frame(odd=c(1,3,5), even=c("two", "four", "six"))
as.vector(as.matrix(dfm2))

dfm <- data.frame(odd=c(1,3,5), even=c(2,4,6))
as.list(dfm)
dfm2 <- data.frame(odd=c(1,3,5), even=c("two", "four", "six"))
as.list(dfm2)

dfm <- data.frame(odd=c(1,3,5), even=c(2,4,6))
as.matrix(dfm)
dfm2 <- data.frame(odd=c(1,3,5), even=c("two", "four", "six"))
as.matrix(dfm2)

##############
## 9.3 결합 ##
##############

library(quantmod)
sec <- getSymbols(Symbols="005930.KS", from="2021-03-01", to="2021-03-31", 
                  auto.assign=FALSE)
sec <- as.data.frame(sec)
str(sec)
head(sec[c("005930.KS.Close", "005930.KS.Volume")])

sec <- cbind(date=rownames(sec), symbol="005930.KS", 
             sec[c("005930.KS.Close", "005930.KS.Volume")])
rownames(sec) <- NULL
colnames(sec)[c(3, 4)] <- c("close", "volume")
head(sec)

hmc <- getSymbols(Symbols="005380.KS", from="2021-03-01", to="2021-03-31",
                  auto.assign=FALSE)
hmc <- as.data.frame(hmc)
hmc <- cbind(date=rownames(hmc), symbol="005380.KS", 
             hmc[c("005380.KS.Close", "005380.KS.Volume")])
rownames(hmc) <- NULL
colnames(hmc)[c(3, 4)] <- c("close", "volume")
head(hmc)

stock <- rbind(sec, hmc)
stock

fx <- getSymbols(Symbols="KRW=X", from="2021-03-01", to="2021-03-31", 
                 auto.assign=FALSE)
fx <- as.data.frame(fx)
fx <- cbind(date=rownames(fx), fx[c("KRW=X.Close")])
rownames(fx) <- NULL
colnames(fx)[c(2)] <- c("close")
head(fx)

intersect(names(sec), names(fx))

report <- merge(sec, fx, by="date")
report 

vec <- c(10,9,8,7,6,5,4,3,2,1)
match(7, vec)
match(c(11,5,3,1,0), vec)

head(mtcars)
car <- mtcars
car$name <- row.names(car)
row.names(car) <- NULL
head(car)

highhp.car <- car[car$hp > 145,]
highhp.car
lightwt.car <- car[car$wt < 3.2,]
lightwt.car

index <- match(highhp.car$name, lightwt.car$name)
index

lightwt.car[na.omit(index),]

vec <- c(10,9,8,7,6,5,4,3,2,1)
7 %in% vec
c(11,5,3,1,0) %in% vec

match(c(11,5,3,1,0), vec)

!is.na(match(c(11,5,3,1,0), vec))

index <- highhp.car$name %in% lightwt.car$name
index

highhp.car[index,]

################
## 9.4 서브셋 ##
################

str(mtcars)
mtcars$mpg
mtcars[[1]]
mtcars[c(1,4)]
mtcars[c("mpg", "hp")]

mtcars[-c(2,3,5,7:11)]

mtcars[-1]
mtcars[1] <- NULL

mtcars[c(-1,2)]

str(iris)

iris[1:5,]

iris[,c("Sepal.Length", "Sepal.Width")]

iris[,"Sepal.Length"]

iris[,"Sepal.Length", drop=FALSE]

iris["Sepal.Length"]

iris[1:5, c("Sepal.Length", "Sepal.Width")]

iris[iris$Sepal.Length > 7,]

iris[iris$Sepal.Length > 7, c("Sepal.Width", "Sepal.Length", "Species")]

subset(iris, 
       select=c("Sepal.Width", "Sepal.Length", "Species"), 
       subset=(Sepal.Length > 7))

sample(x=1:10, size=5)
sample(x=10, size=5)

sample(1:10, 5, replace=TRUE)

sample(1:10)

set.seed(1)	
sample(1:10, 5, replace=TRUE)

sample(1:10, 5, replace=TRUE)

set.seed(1)
sample(1:10, 5, replace=TRUE)

sample(iris, 3)

set.seed(1)
index <- sample(1:nrow(iris), 3)
index
iris[index,]

duplicated(c(1,2,3,1,1,4,3))

id <- c("A001", "A002", "A003")
name <- c("Mouse", "Keyboard", "USB")
price <- c(30000, 90000, 50000)
product <- data.frame(id=id, name=name, price=price)
product
product <- rbind(product, c("A001", "Mouse", 30000))
product

duplicated(product)

product[!duplicated(product),]

which(duplicated(product))

index <- which(duplicated(product))
product[-index,]

unique(product)

str(airquality)

complete.cases(airquality)

airquality.nona <- airquality[complete.cases(airquality),]
str(airquality.nona)

airquality.nona <- na.omit(airquality)
str(airquality.nona)

cut(x=iris$Sepal.Width, breaks=c(0,1,2,3,4,5))

iris.cut1 <- cut(iris$Sepal.Width, breaks=c(0,1,2,3,4,5))
table(iris.cut1)
summary(iris.cut1)

cut(iris$Sepal.Width, 
    breaks=c(0,1,2,3,4,5), 
    labels=c("Smaller", "Small", "Medium", "Big", "Bigger"))

iris.cut2 <- cut(iris$Sepal.Width, 
                 breaks=c(0,1,2,3,4,5), 
                 labels=c("Smaller", "Small", "Medium", "Big", "Bigger"))
table(iris.cut2)
summary(iris.cut2)

cut(iris$Sepal.Width, breaks=5)
cut(iris$Sepal.Width, breaks=5, include.lowest=TRUE)

iris.cut3 <- cut(iris$Sepal.Width, 
                 breaks=5, 
                 labels=c("Smaller", "Small", "Medium", "Big", "Bigger"),
                 include.lowest=TRUE)
table(iris.cut3)
summary(iris.cut3)

##############
## 9.5 소팅 ##
##############

x <- c(3,7,5,1,2,5)
sort(x)

x <- c(3,7,5,1,2,5)
sort(x, decreasing=TRUE)

x <- c(3,7,5,1,2,5)
length(x)
length(x) <- 7
x
sort(x)
sort(x, na.last=TRUE)
sort(x, na.last=FALSE)

y <- c(33,11,55,22,44)

order(y)

y[order(y)]

sort(y)

y <- c(33,11,55,22,44)
z <- c("superman", "batman", "ironman", "antman", "spiderman")
df <- data.frame(y, z)
df

df[order(df$y),]
df[order(df$y, decreasing=TRUE),]
df[order(-df$y),]

w <- c("can fly", "cannot fly", "can fly", "cannot fly", "cannot fly")
df <- data.frame(y, z, w)
df

df[order(df$w, df$y),]

xtfrm(df$w)
index <- order(-xtfrm(df$w), df$y)
df[index,]

library(dplyr)
df[order(desc(df$w), df$y),]
arrange(df, desc(w), y)

###################
## 9.6 집단 요약 ##
###################

str(mtcars)
car <- mtcars
car <- within(car, am <- factor(am,
                                levels=c(0,1),
                                labels=c("Automatic", "Manual")))

g <- split(x=car$mpg, f=car$am)
g

mean(g[[1]])
mean(g[["Manual"]])
sapply(g, mean)

unstack(data.frame(car$mpg, car$am))

gg <- unstack(data.frame(iris$Sepal.Length, iris$Species))
str(gg)
gg
summary(gg)

tapply(X=iris$Sepal.Length, INDEX=iris$Species, FUN=mean)

tapply(iris$Sepal.Length, iris$Species, length)

with(car, tapply(mpg, list(cyl, am), mean))
with(car, tapply(mpg, list(Cylinder=cyl, Transmission=am), mean))

with(car, aggregate(x=mpg, by=list(Cylinder=cyl, Transmission=am), FUN=mean))

aggregate(car[c(1:6)], list(Group.cyl=car$cyl, Group.am=car$am), mean)

aggregate(iris[1:4], list(Species=iris$Species), mean)

by(data=iris, INDICES=iris$Species, FUN=summary)

by(iris, iris$Species, function(x) mean(x$Sepal.Length))

by(car, list(car$cyl,car$am), function(x) mean(x$mpg))

rowsum(x=iris[-5], group=iris$Species)

table(car$gear)
table(car$am)

table(car$am, car$gear)

mpg.cut <- cut(car$mpg, breaks=5, include.lowest=TRUE)
table(mpg.cut)

xtabs(formula= ~ am + gear, data=car)

aggregate(formula=mpg ~ cyl + am, data=car, FUN=mean)

with(car, aggregate(mpg, list(cyl=cyl, am=am), mean))

?aggregate

########################
## 9.7 분할-적용-결합 ##
########################

## dplyr 패키지

head(airquality)

library(dplyr)
filter(airquality, Month == 6)

airquality[airquality$Month == 6,]
subset(airquality, subset=(Month == 6))

filter(airquality, Month == 6, Temp > 90)
filter(airquality, Month == 6 & Temp > 90)
filter(airquality, Ozone > 80 | Temp > 90)

slice(airquality, 6:10)

slice(airquality, n())
slice(airquality, (n()-2):n())

slice(airquality, -(1:(n()-3)))

slice_head(airquality, n=3)
slice_tail(airquality, n=3)

slice_max(airquality, order_by=Ozone, n=3)
slice_min(airquality, order_by=Temp, n=3)

slice_sample(airquality, n=3)
slice_sample(airquality, prop=0.03)

select(airquality, Month, Day, Temp)
select(airquality, Temp:Day)
select(airquality, -(Ozone:Wind))

select(airquality, Solar=Solar.R)

rename(airquality, Solar=Solar.R)

select(airquality, Month, Day, everything())

distinct(select(airquality, Month))
unique(airquality$Month)

arrange(airquality, Temp, Month, Day)
arrange(airquality, desc(Temp), Month, Day)

airquality[order(airquality$Temp, airquality$Month, airquality$Day),]
airquality[order(desc(airquality$Temp), airquality$Month, airquality$Day),]

mutate(airquality, Temp.C=(Temp-32)/1.8, Diff=Temp.C - mean(Temp.C))

transform(airquality, Temp.C=(Temp-32)/1.8, Diff=Temp.C - mean(Temp.C))

transmute(airquality, Temp.C=(Temp-32)/1.8, Diff=Temp.C - mean(Temp.C))

summarise(airquality, mean(Temp))
summarise(airquality, 
          Min=min(Temp, na.rm=TRUE),
          Median=median(Temp, na.rm=TRUE),
          Mean=mean(Temp, na.rm=TRUE),
          SD=sd(Temp, na.rm=TRUE),
          Max=max(Temp, na.rm=TRUE),
          N=n(),
          Distinct.Month=n_distinct(Month),
          First.Month=first(Month),
          Last.Month=last(Month))	

air.group <- group_by(airquality, Month)
class(air.group)
air.group

summarise(air.group, Mean.Temp=mean(Temp, na.rm=TRUE))
summarise(air.group,
          Number.of.Days=n(),
          Mean.Temp=mean(Temp, na.rm=TRUE),
          SD.Temp=sd(Temp, na.rm=TRUE))

air.ungroup <- ungroup(air.group)
class(air.ungroup)
summarise(air.ungroup, Mean.Temp=mean(Temp, na.rm=TRUE))

count(airquality, Month)
count(airquality, Month, sort=TRUE)

count(airquality, Month, wt=Temp)

count(airquality, Month, wt=Temp/n())

df1 <- data.frame(x=1:6, y=month.name[1:6])
df2 <- data.frame(x=7:12, y=month.name[7:12])
df3 <- bind_rows(df1, df2)
df3

df4 <- data.frame(z=month.abb)
bind_cols(df3, df4)

band_members
band_instruments

inner_join(x=band_members, y=band_instruments)

inner_join(x=band_members, y=band_instruments, by="name")

left_join(band_members, band_instruments, by="name")
right_join(band_members, band_instruments, by="name")
full_join(band_members, band_instruments, by="name")

band_instruments2
full_join(band_members, band_instruments2, by=c("name"="artist"))

full_join(band_members, band_instruments2, by=c("name"="artist"), keep=TRUE)

x <- tibble(id=c(1, 2, 2, 1), val_x=c("x1", "x2", "x3", "x4"))
y <- tibble(id=c(1, 2), val_y=c("y1", "y2"))
x
y
left_join(x, y, by="id")

x <- tibble(id=c(1, 2, 3), val_x=c("x1", "x2", "x3"))
y <- tibble(id=c(1, 1, 2), val_y=c("y1", "y2", "y3"))
x
y
left_join(x, y, by="id")

x <- tibble(id=c(1, 2, 2, 3), val_x=c("x1", "x2", "x3", "x4"))
y <- tibble(id=c(1, 2, 2, 3), val_y=c("y1", "y2", "y3", "y4"))
x
y
left_join(x, y, by="id")

semi_join(band_members, band_instruments, by="name")

anti_join(band_members, band_instruments, by="name")

iris %>% head
1:10 %>% mean

a1 <- select(airquality, Ozone, Temp, Month)
a2 <- group_by(a1, Month)
a3 <- summarise(a2, 
                Mean.Ozone=mean(Ozone, na.rm=TRUE), 
                Mean.Temp=mean(Temp, na.rm=TRUE))
a4 <- filter(a3, Mean.Ozone > 30 | Mean.Temp > 70)
a5 <- arrange(a4, desc(Mean.Temp))
a6 <- left_join(a5, tibble(Month=1:12, Month.Name=month.name), by="Month")
a6

air <- airquality %>% 
  select(Ozone, Temp, Month) %>% 
  group_by(Month) %>% 
  summarise(Mean.Ozone=mean(Ozone, na.rm=TRUE), 
            Mean.Temp=mean(Temp, na.rm=TRUE)) %>% 
  filter(Mean.Ozone > 30 | Mean.Temp > 70) %>% 
  arrange(desc(Mean.Temp)) %>% 
  left_join(tibble(Month=1:12, Month.Name=month.name), by="Month")
air

###################
## 9.8 반복 적용 ##
###################

## apply 패밀리

x <- 1:20
dim(x) <- c(4,5)
x

apply(X=x, MARGIN=1, FUN=max)

apply(x, 2, min)

y <- 1:24
dim(y) <- c(4,3,2)
y

apply(y, 1, paste, collapse=",")
apply(y, 2, paste, collapse=",")
apply(y, 3, paste, collapse=",")

apply(y, c(1,2), paste, collapse=",")

str(Titanic)

apply(Titanic, 1, sum)

apply(Titanic, 2, sum)
apply(Titanic, 3, sum)
apply(Titanic, 4, sum)

apply(Titanic, c(1,4), sum)

exams <- list(s1=c(78, 89, 91, 85, 95, 98),
              s2=c(85, 86, 97, 99, 90),
              s3=c(98, 96, 89, 90, 93, 85, 92),
              s4=c(98, 96, 91, 88, 93, 99))
exams

lapply(exams, length)
sapply(exams, length)

sapply(exams, mean)
sapply(exams, sd)

sapply(exams, range)

lapply(iris, class)

sapply(iris, class)

sapply(iris, mean)

sapply(iris, function(x) ifelse(is.numeric(x), mean(x), NA))

mapply(rep, 1:4, 4:1)

list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))

## purrr 패키지

exams <- list(s1=c(78, 89, 91, 85, 95, 98),
              s2=c(85, 86, 97, 99, 90),
              s3=c(98, 96, 89, 90, 93, 85, 92),
              s4=c(98, 96, 91, 88, 93, 99))
exams
library(purrr)
map(.x=exams, .f=mean)

map_dbl(exams, mean)

map_dbl(exams, mean, trim=0.3)

exams %>% 
  map_dbl(mean, trim=0.3)

exams %>% 
  map(range) %>% 
  map_dbl(diff)

exams %>% 
  map(function(x) x*1.1) 

exams %>% 
  map(~.x*1.1)

exams %>% 
  map(~.*1.1)

fruits <- c("Apple", "Banana", "Strawberry")
fruits %>% 
  map_chr(paste, "Juice", sep="-")
fruits %>% 
  map_chr(~paste(.x, "Juice", sep="-"))

lst <- list(list(num=1:3, letters[1:3]),
            list(num=101:103, chr=letters[4:6]),
            list(),
            list(num=c(9, 99), chr=letters[7:9]))
lst

lst %>% 
  map("num")

lst %>% 
  map("num", .default="???")
lst %>% 
  map("chr", .default=NA)

lst %>% 
  map(2, .default=NA)

lst %>% 
  map(c(2, 2))

lst %>% 
  map_chr(c(2, 2))

lst %>% 
  map_chr(c(2, 2), .default=NA)

lst %>% 
  map(list("num", 3))

lst %>% 
  map_int(list("num", 3), .default=NA)

str(USArrests)
USArrests %>% 
  map_dbl(mean)

USArrests %>% 
  map_dbl(range)
USArrests %>% 
  map(range) 

USArrests %>% 
  map_dfr(range)

str(mtcars)

models <- mtcars %>%
  split(.$am) %>%
  map(~lm(mpg ~ wt, data=.))
models

model0 <- summary(models$`0`)
names(model0)
model0$r.squared

models %>% 
  map(summary) %>% 
  map_dbl(function(x) x$r.squared)

models %>% 
  map(summary) %>% 
  map_dbl(~.$r.squared)
models %>% 
  map(summary) %>% 
  map_dbl(~.x$r.squared)

models %>% 
  map(summary) %>% 
  map_dbl("r.squared")

mtcars %>%
  split(.$am) %>%
  map(~lm(mpg ~ wt, data=.)) %>%
  map(summary) %>% 
  map_dbl("r.squared")

a <- list(1, 2, 3)
b <- list(10, 20, 30)
map2(.x=a, .y=b, .f=function(first, second) second - first)

map2(a, b, ~.y-.x)

map2_dbl(a, b, ~.y-.x)

set.seed(123)
map2(b, a, rnorm, n=5)

set.seed(123)
list(rnorm(mean=10, sd=1, n=5),
     rnorm(mean=20, sd=2, n=5),
     rnorm(mean=30, sd=3, n=5))

by.am <- mtcars %>%
  split(.$am)
by.am
models <- by.am %>% 
  map(~lm(mpg ~ wt, data=.))
models

map2(models, by.am, predict)

a <- list(1, 2, 3)
b <- list(10, 20, 30)
c <- list(100, 200, 300)
pmap(.l=list(a, b, c), .f=sum)

pmap_dbl(list(a, b, c), sum)

pmap_dbl(list(a, b, c), function(first, second, third) second - first + third)

pmap_dbl(list(a, b, c), ~..2-..1+..3)

pmap_dbl(list(alpha=a, beta=b, gamma=c), 
         function(gamma, beta, alpha) beta - alpha + gamma)

plus <- function(x, y) x + y
pmap_dbl(list(a, b, c), plus)

plus2 <- function(x, y, ...) x + y
pmap_dbl(list(a, b, c), plus2)

args <- list(mean=c(0, 5, 10),
             sd=c(1, 2, 3),
             n=c(1, 3, 5))
set.seed(123)
args %>% 
  pmap(rnorm)

set.seed(123)
list(rnorm(mean=0, sd=1, n=1),
     rnorm(mean=5, sd=2, n=3),
     rnorm(mean=10, sd=3, n=5))

args.df <- data.frame(mean=c(0, 5, 10),
                      sd=c(1, 2, 3),
                      n=c(1, 3, 5))
set.seed(123)
args.df %>% 
  pmap(rnorm)

args2 <- list(c(1, 3, 5),
              c(0, 5, 10),
              c(1, 2, 3))
set.seed(123)
args2 %>% 
  pmap(rnorm)

reduce(.x=c(1, 3, 5, 7), .f=`*`)

paste2 <- function(u, v, sep=".") paste(u, v, sep=sep)
letters[1:4] %>% 
  reduce(paste2)

dfs <- list(data.frame(name="Superman", age=30),
            data.frame(name=c("Spiderman", "Wonderwoman"), sex=c("M", "F")),
            data.frame(name="Batman", grade="A"))
dfs

library(dplyr)
dfs %>% 
  reduce(bind_rows)

vs <- list(c(1, 3, 5, 6, 7, 8, 10),
           c(2, 3, 7, 8, 10),
           c(1, 2, 3, 5, 7, 9, 10))
vs %>% 
  reduce(intersect)

set.seed(123)
x <- sample(10)
x
x %>% 
  reduce(`+`)
x %>% 
  accumulate(`+`)

cumsum(x)

paste2 <- function(u, v, sep=".") paste(u, v, sep=sep)
reduce2(.x=letters[1:4], .y=c("-", ".", "-"), .f=paste2)

accumulate2(letters[1:4], c("-", ".", "-"), paste2)

p1 <- letters[[1]]
p1
p2 <- paste2(p1, letters[[2]], "-")
p2
p3 <- paste2(p2, letters[[3]], ".")
p3
p4 <- paste2(p3, letters[[4]], "-")
p4

x <- list(c(0, 1), c(2, 3), c(4, 5))
y <- list(c("a", "b"), c("c", "d"))
reduce2(x, y, paste)
accumulate2(x, y, paste)

q1 <- x[[1]]
q1
q2 <- paste(q1, c(2, 3), c("a", "b"))
q2
q3 <- paste(q2, c(4, 5), c("c", "d"))
q3

###################
## 9.9 형태 변환 ##
###################

## reshape2 패키지

library(reshape2)
smiths

smiths.long <- melt(data=smiths)
smiths.long

smiths.long <- melt(smiths, id.vars="subject")
smiths.long

smiths.wide <- dcast(data=smiths.long, formula=subject ~ variable)
smiths.wide

str(airquality)
head(airquality)

aq.long <- melt(airquality)

head(aq.long)
tail(aq.long)

aq.long <- melt(airquality, id.vars=c("Month", "Day"))
head(aq.long)

aq.wide <- dcast(aq.long, Month + Day ~ variable)
aq.wide <- dcast(aq.long, Month + Day ~ variable, value.var="value")
head(aq.wide)

dcast(aq.long, Month ~ variable)

dcast(aq.long, Month ~ variable, fun.aggregate=mean, na.rm=TRUE)

aq.long <- melt(airquality, 
                id.vars=c("Month", "Day"),
                measure.vars=c("Ozone", "Solar.R", "Wind", "Temp"),
                variable.name="Factor",
                value.name="Measurement")
head(aq.long)

aq.wide <- dcast(aq.long, Month + Day ~ Factor)
head(aq.wide)
aq.wide <- dcast(aq.long, Month + Day ~ Factor, value.var="Measurement")
head(aq.wide)

## tidyr 패키지

library(tidyr)
head(airquality)
aq.long <- gather(data=airquality, key="Factor", value="Measurement", Ozone:Temp)
head(aq.long)
tail(aq.long)

gather(airquality, "Factor", "Measurement", -Month, -Day)

gather(airquality, "Factor", "Measurement", 1:4)
gather(airquality, "Factor", "Measurement", Ozone, Solar.R, Wind, Temp)

airquality %>% 
  gather("Factor", "Measurement", Ozone:Temp)

aq.wide <- spread(data=aq.long, key=Factor, value=Measurement)
head(aq.wide)
tail(aq.wide)

aq.long %>% 
  spread(Factor, Measurement)

aq.long <- pivot_longer(data=airquality, cols=Ozone:Temp)
aq.long <- pivot_longer(data=airquality, cols=Ozone:Temp,
                        names_to="Factor", values_to="Measurement")
head(aq.long)
tail(aq.long)

aq.wide <- pivot_wider(data=aq.long, names_from=Factor, values_from=Measurement)
head(aq.wide)
tail(aq.wide)

df <- tibble(x=c(1, 1, 1, 2, 2, 3), y=1:6, z=6:1)
df
df.nested <- nest(.data=df, ndata=c(y, z))
df.nested
df.nested$ndata
df.nested$ndata[[2]]

unnest(df.nested, cols=ndata)

str(iris)
iris %>%
  nest(sepal=c("Sepal.Length", "Sepal.Width"),
       petal=c("Petal.Length", "Petal.Width"))

iris %>%
  nest(sepal=starts_with("Sepal"), petal=starts_with("Petal"))

head(mtcars)
library(dplyr)
mtcars.n <- mtcars %>%
  group_by(cyl) %>%
  nest() 
mtcars.n

library(purrr)
mtcars.m <- mtcars.n %>% 
  mutate(model=map(data, ~lm(mpg ~ wt, data=.x))) %>% 
  arrange(cyl)
mtcars.m
mtcars.m$model

coefficients(mtcars.m$model[[1]])
coefficients(mtcars.m$model[[1]])[[2]]

summary(mtcars.m$model[[1]])
names(summary(mtcars.m$model[[1]]))
summary(mtcars.m$model[[1]])$r.squared

mtcars.m %>% 
  transmute(cyl, beta=map_dbl(model, ~coefficients(.)[[2]])) %>% 
  ungroup()
mtcars.m %>% 
  transmute(cyl, summary=map(model, summary)) %>% 
  transmute(cyl, R.squared=map_dbl(summary, "r.squared")) %>% 
  ungroup()

mtcars.m %>% 
  transmute(cyl, R.squared=map_dbl(map(model, summary), "r.squared")) %>% 
  ungroup()

head(iris)
iris.long <- pivot_longer(data=iris, cols=-Species, 
                          names_to="Element", values_to="Measurement")
head(iris.long)

iris.sep <- separate(data=iris.long, col=Element, into=c("Part", "Measures"))
head(iris.sep)

iris.unite <- unite(data=iris.sep, col="Factor", Part, Measures, sep="_")
head(iris.unite)

str(PlantGrowth)
PlantGrowth
plant.wide <- unstack(PlantGrowth)
plant.wide
plant.long <- stack(plant.wide)
plant.long

##############
## 연습문제 ##
##############

# 9-1
x <- 5:10
x

x[c(1,2)] <- 2:3
x

x[-1] <- 1:5
x

# 9-2
data(mtcars)

mtcars$weight[mtcars$wt > median(mtcars$wt)] <- "heavy"
mtcars$weight[mtcars$wt <= median(mtcars$wt)] <- "light"
mtcars

# 9-3
data(mtcars)

mtcars[, order(names(mtcars))]

# 9-4
data(mtcars)

mtcars[mtcars$cyl = 4, ] #Incorrect
mtcars[mtcars$cyl == 4, ] #Correct

mtcars[-1:4, ] #Incorrect

mtcars[mtcars$cyl <= 5] #Incorrect
mtcars[mtcars$cyl <= 5,] #Correct

mtcars[mtcars$cyl == 4 | 6, ] #Incorrect
mtcars[mtcars$cyl == 4 | mtcars$cyl == 6, ] #Correct

mtcars[mtcars$cyl %in% c(4, 6), ] #Correct

# 9-5
data(mtcars)

mtcars[1:15] #Incorrect
mtcars[1:15,] #Correct

# 9-6
data(iris)

sample.index <- sample(1:nrow(iris), 0.7*nrow(iris))
sample.index
iris.sample <- iris[sample.index,]
iris.sample

library(dplyr)
slice_sample(iris, prop=0.7)

# 9-7
names <- c("Gates", "Jobs", "Bezos")

lapply(names, nchar)

sapply(names, nchar)

# 9-8
lst1 <- list(A=matrix(1:12, nrow=3), B=matrix(1:12, nrow=2), C=1:12)
lst2 <- list(A=matrix(1:12, nrow=3), B=matrix(1:12, nrow=6), C=12:1)

mapply(identical, lst1, lst2)

# 9-9
apply(state.x77, 2, mean)

apply(state.x77, 2, sd)

# 9-10
library(nycflights13)
flights

library(dplyr)
flights %>% 
  group_by(dest) %>% 
  summarise(count=n(),
            dist=mean(distance, na.rm=TRUE),
            delay=mean(arr_delay, na.rm=TRUE)) %>% 
  filter(count >= 50) %>% 
  slice_max(order_by=delay, n=10)

# 9-11
library(dplyr)
library(nycflights13)
flights
airlines
airports

flights %>%
  select(year:day, hour, origin, dest, tailnum, carrier) %>% 
  left_join(airlines, by="carrier")

dest.popular <- flights %>% 
  count(dest, sort=TRUE) %>% 
  head(10)
dest.popular

flights %>% 
  semi_join(dest.popular, by="dest") %>% 
  left_join(airports, by=c("dest"="faa")) %>% 
  select(year:day, hour, origin, dest, name, tailnum, carrier)

# 9-12
library(dplyr)
library(gapminder)
gapminder
country_codes

gapminder %>%
  group_by(continent) %>%
  summarise(n.obs=n(), n.countries=n_distinct(country))

gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(lifeExp.med=median(lifeExp))

gapminder %>%
  filter(year == 2007, country %in% c("Korea, Rep.", "United States", "France")) %>%
  select(country, continent) %>% 
  left_join(country_codes, by="country")

# 9-13
tbl1 <- tibble(name="Oliver", age=25)
tbl2 <- tibble(name=c("Oliver", "Emma"), sex=c("Male", "Female"))
tbl3 <- tibble(name="Emma", grade="A")
lst <- list(age=tbl1, gender=tbl2, grade=tbl3)
lst

library(purrr)
reduce(lst, full_join)

accumulate(lst, full_join)

# 9-14
tbl1 <- tibble(name=c("Mouse", "Keyboard", "USB"), price=c(30000, 90000, 50000))
tbl2 <- tibble(part=c("Mouse", "Keyboard", "Monitor"), quantity=c(20, 30, 10))
tbl3 <- tibble(product=c("Keyboard", "USB", "Webcam"), madein=c("Korea", "USA", "China"))
lst <- list(price=tbl1, quantity=tbl2, madein=tbl3)
lst

library(purrr)
by <- list(c("name"="part"), c("name"="product"))
reduce2(lst, by, left_join)

accumulate2(lst, by, left_join)

# 9-15
library(dplyr)
library(purrr)
library(tidyr)
library(gapminder)
gapminder

gapminder.nested <- gapminder %>% 
  group_by(continent) %>% 
  nest()
gapminder.nested

gapminder.nested %>% 
  mutate(lifeExp.avg=map_dbl(data, ~mean(.x$lifeExp))) %>% 
  ungroup()

gapminder.nested %>% 
  mutate(model=map(data, ~lm(lifeExp ~ pop + gdpPercap + year, data=.x))) %>% 
  mutate(summary=map(model, summary)) %>% 
  mutate(R.squared=map_dbl(summary, "r.squared")) %>% 
  ungroup()

# 9-16
drug <- data.frame(ID=c(1,1,2,2),
                   Type=c("T1","T2","T1","T2"),
                   X1=c(4,7,2,5),
                   X2=c(3,6,4,1))
drug
str(drug)

library(reshape2)
drug.long <- melt(drug, id.vars=c("ID", "Type"))
drug.long

drug.wide1 <- dcast(drug.long, ID + Type ~ variable)
drug.wide1
drug.wide2 <- dcast(drug.long, ID + variable ~ Type)
drug.wide2
drug.wide3 <- dcast(drug.long, ID ~ variable + Type)
drug.wide3

drug.wide4 <- dcast(drug.long, ID ~ variable, mean)
drug.wide4
drug.wide5 <- dcast(drug.long, Type ~ variable, mean)
drug.wide5
drug.wide6 <- dcast(drug.long, ID ~ Type, mean)
drug.wide6

# 9-17
head(ChickWeight)

library(reshape2)
ChickWeight.long <- melt(ChickWeight, id.vars=2:4)
head(ChickWeight.long)

dcast(ChickWeight.long, Time ~ variable, mean)
dcast(ChickWeight.long, Diet ~ variable, mean)
dcast(ChickWeight.long, Diet ~ Time, mean)

# 9-18
library(tidyr)
relig_income
gather(relig_income, "income", "count", !religion)

pivot_longer(relig_income, !religion, names_to="income", values_to="count")

# 9-19
library(tidyr)

table4b
pivot_longer(table4b, c("1999", "2000"), names_to="year", values_to="population")

table2
pivot_wider(table2, names_from=type, values_from=count)
