
#########################
## 제5장  데이터프레임 ##
#########################

###########################
## 5.1 데이터프레임 생성 ##
###########################

v1 <- c("A001", "A002", "A003")
v2 <- c("Mouse", "Keyboard", "USB")
v3 <- c(30000, 90000, 50000)
product <- data.frame(v1, v2, v3)
product

unclass(product)

product <- data.frame(row.names=v1, v2, v3)
product

product <- data.frame(id=v1, name=v2, price=v3)
product

str(product)

mat <- matrix(c(1,3,5,7,9,
                2,4,6,8,10,
                2,3,5,7,11), ncol=3)
mat
as.data.frame(mat)

number <- as.data.frame(mat)
colnames(number) <- c("odd", "even", "prime")
number

v1 <- c("A001", "A002", "A003")
v2 <- c("Mouse", "Keyboard", "USB")
v3 <- c(30000, 90000, 50000)
lst <- list(v1,v2,v3)
lst
as.data.frame(lst)
product <- as.data.frame(lst)
colnames(product)
colnames(product) <- c("id", "name", "price")
product

nrow(product)

ncol(product)
length(product)

dim(product)

## tibble 패키지

library(tibble)
v1 <- c("A001", "A002", "A003")
v2 <- c("Mouse", "Keyboard", "USB")
v3 <- c(30000, 90000, 50000)
product <- tibble(id=v1, name=v2, price=v3)
product
str(product)

product <- tribble(
  ~id, ~name, ~price,
  "A001", "Mouse", 30000,
  "A002", "Keyboard", 90000,
  "A003", "USB", 50000
)
product

tbl <- tibble(id=c(1, 2, 3),
              data=list(tibble(x=1, y=2),
                        tibble(x=4:5, y=6:7),
                        tibble(x=10)))
tbl
tbl$data
tbl$data[[2]]

str(iris)
head(iris, 3)
as_tibble(iris)

library(Lahman)
str(Batting)
head(Batting, 3)

Batting.tbl <- as_tibble(Batting)
Batting.tbl
class(Batting.tbl)

print(Batting.tbl, n=20)
print(Batting.tbl, n=3, width=Inf)
print(Batting.tbl, n=Inf)

Batting.df <- as.data.frame(Batting.tbl)
class(Batting.df)

###########################
## 5.2 데이터프레임 확장 ##
###########################

id <- c("A001", "A002", "A003")
name <- c("Mouse", "Keyboard", "USB")
price <- c(30000, 90000, 50000)
product <- data.frame(id, name, price)
product

product <- rbind(product, c("A004", "Monitor", 250000))
product

new.rows <- data.frame(id=c("A005", "A006"), 
                       name=c("Memory", "CPU"), 
                       price=c(35000, 320000))
new.rows
product <- rbind(product, new.rows)
product

rbind(product, data.frame(name=c("Memory", "CPU"), 
                          price=c(35000, 320000),
                          id=c("A005", "A006")))

product <- cbind(product, madein=c("Korea", "China", "China", 
                                   "Korea", "Korea", "USA"))
product

product$madein <- c("Korea", "China", "China", "Korea", "Korea", "USA")
product

new.cols <- data.frame(manufacturer=c("Logitech", "Logitech", "Samsung",
                                      "Samsung", "Samsung", "Intel"),
                       quantity=c(20, 15, 50, 30, 40, 10))
product <- cbind(product, new.cols)
product

cols1 <- data.frame(x=c("a", "b", "c"), y=c(1,2,3))
cols2 <- data.frame(x=c("alpha", "beta", "gamma"), y=c(100,200,300))
cbind(cols1, cols2)

df1 <- data.frame(sex="female", months=1, weight=3.5)
df2 <- data.frame(sex="male", months=3, weight=4.8)
df3 <- data.frame(sex="male", months=4, weight=5.3)
df4 <- data.frame(sex="female", months=9, weight=9.4)
df5 <- data.frame(sex="female", months=7, weight=8.3)
lst <- list(df1, df2, df3, df4, df5)
lst
str(lst)

lst[[1]]
str(lst[[1]])

rbind(lst[[1]], lst[[2]])

do.call(rbind, lst)

ls1 <- list(sex="female", months=1, weight=3.5)
ls2 <- list(sex="male", months=3, weight=4.8)
ls3 <- list(sex="male", months=4, weight=5.3)
ls4 <- list(sex="female", months=9, weight=9.4)
ls5 <- list(sex="female", months=7, weight=8.3)
lst <- list(ls1, ls2, ls3, ls4, ls5)
lst
str(lst)

as.data.frame(lst[1])
as.data.frame(lst[2])

do.call(rbind, lapply(lst, as.data.frame))

#############################
## 5.3 데이터프레임 인덱싱 ##
#############################

?state.abb
us.state <- data.frame(state.abb, state.name, state.region, state.area)
us.state
str(us.state)

us.state[[2]]
str(us.state[[2]])
us.state[[3]]
str(us.state[[3]])

us.state[2]
str(us.state[2])

us.state[c(2,4)]

us.state[,2]

us.state[,2,drop=FALSE]

us.state[,c(2,4)]

us.state[["state.name"]]
us.state$state.name
us.state[,"state.name"]

us.state[c("state.name", "state.area")]
us.state[,c("state.name", "state.area")]

str(state.x77)
head(state.x77)

states <- data.frame(state.x77)
str(states)
row.names(states)
states$Name <- row.names(states)
row.names(states) <- NULL
head(states)

rich.states <- states[states$Income > 5000, c("Name", "Income")]
rich.states
large.states <- states[states$Area > 100000, c("Name", "Area")]
large.states

merge(rich.states, large.states)

merge(rich.states, large.states, all=TRUE)

head(iris)
r <- iris$Sepal.Length / iris$Sepal.Width
head(r)

r <- with(iris, Sepal.Length / Sepal.Width)
head(r)

with(iris, {
  print(summary(Sepal.Length))
  plot(Sepal.Length, Sepal.Width)
  plot(Petal.Length, Petal.Width)
})

with(iris, {
  stats <- summary(Sepal.Length)
  stats
})
stats

with(iris, {
  stats.nokeep <- summary(Sepal.Length)
  stats.keep <<- summary(Sepal.Length)
})
stats.nokeep
stats.keep

iris$Sepal.Ratio <- iris$Sepal.Length / iris$Sepal.Width
head(iris$Sepal.Ratio)

iris <- within(iris, Sepal.Ratio <- Sepal.Length / Sepal.Width)
head(iris$Sepal.Ratio)

attach(iris)

search()

r <- Sepal.Length / Sepal.Width
head(r)

detach(iris)
search()

attach(iris)
iris$Sepal.Length <- 0
head(iris$Sepal.Length)
head(Sepal.Length)
detach(iris)

attach(iris)
Sepal.Width <- Sepal.Width * 10
ls()
head(Sepal.Width)
head(iris$Sepal.Width)
detach(iris)
rm(Sepal.Width)

Sepal.Length <- c(4.5,5.3,6.7)
attach(iris)
plot(Sepal.Length, Sepal.Width)
Sepal.Length
detach(iris)

head(mtcars)
subset(mtcars, select=mpg, subset=(mpg > 30))

subset(mtcars, select=c(mpg, hp, wt), subset=(cyl == 4 & am == 0))

subset(mtcars, select=c(mpg, cyl, wt), subset=(mpg > mean(mpg)))

head(USArrests)

cor(USArrests)

cor(subset(USArrests, select=-UrbanPop))

cor(subset(USArrests, select=-c(UrbanPop, Rape)))

install.packages("sqldf")
library(sqldf)

data(mtcars)
sqldf("select * from mtcars where mpg > 30", row.names=TRUE)
sqldf("select * from mtcars where cyl=6 order by mpg", row.names=TRUE)
sqldf("select avg(mpg) as avg_mpg, avg(wt) as avg_wt, gear 
      from mtcars where cyl in (4, 6) group by gear")

data(iris)
sqldf("select distinct Species from iris")
sqldf("select * from iris limit 3")

sqldf("select avg([Sepal.Length]) from iris where Species='setosa'")
sqldf('select avg("Sepal.Length") from iris where Species="setosa"')

sqldf("select * from iris where [Sepal.Length] between 4.5 and 4.9 
      and Species in ('versicolor', 'virginica')")
sqldf("select avg([Sepal.Length]) as avg_Sepal_Length, Species 
      from iris group by Species") 

##############
## 연습문제 ##
##############

# 5-1
lst <- list(1:12)
mtx <- matrix(1:12, nrow=4)
df <- data.frame(x=1:4, y=5:8, z=9:12)

length(lst)
length(mtx)
length(df)

# 5-2
str(mtcars)
mtcars[1:4]
mtcars[,1:4]
mtcars[-c(5,6,7,8,9,10,11)]
mtcars[c("mpg", "cyl", "disp", "hp")]
mtcars[-5:11] # Incorrect

# 5-3
name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
sex <- factor(c("F", "M", "F", "M", "F"))
math <- c(85, 76, 99, 88, 67)

df <- data.frame(name, sex, math)
df

levels(df$sex)
levels(df$sex) <- c("M", "F")
df
str(df)

# 5-4
stat <- c(76, 73, 95, 82, 55)
df <- cbind(df, stat)

df$score <- with(df, round((math + stat)/2, 1))
df

df$grade[df$score >= 90] <- "A"
df$grade[df$score >= 80 & df$score < 90] <- "B"
df$grade[df$score >= 70 & df$score < 80] <- "C"
df$grade[df$score < 70] <- "D"

df$grade <- factor(df$grade, levels=c("A", "B", "C", "D"), ordered=TRUE)
df
str(df)

# 5-5
x <- 1:5
y <- 3
z <- x^2 + y

tibble(x, y, z)

# 5-6
str(iris)
iris.new <- iris[-5]
head(iris.new)

colMeans(iris.new)

# 5-7
str(beaver1)
str(beaver2)
beaver1$id <- 1
beaver2$id <- 2

beaver12 <- rbind(beaver1, beaver2)
beaver12 <- beaver12[,c(5, 1:4)]
str(beaver12)

subset(beaver12, subset=(activ == 1))

# 5-8
class(VADeaths)
VADeaths.df <- data.frame(VADeaths)
class(VADeaths.df)

VADeaths.df
VADeaths.df$Age <- row.names(VADeaths.df)
row.names(VADeaths.df) <- NULL
VADeaths.df

VADeaths.df$Average <- rowMeans(VADeaths.df[1:4])
VADeaths.df

VADeaths.df <- VADeaths.df[,c(5, 6, 1:4)]
VADeaths.df

# 5-9
str(USArrests)
USArrests[seq(1, 50, 5),]

nrow(subset(USArrests, subset=(Murder > 15)))

row.names(subset(USArrests, subset=(Murder > mean(Murder))))

row.names(USArrests)[which.max(USArrests$Murder)]
row.names(USArrests)[which.min(USArrests$Murder)]

# 5-10
library(MASS)
str(mammals)
med.body <- median(mammals$body)
med.body
mammals$size <- ifelse(mammals$body > med.body, "large", "small")
head(mammals)

subset(mammals, subset=(size=="large"))

mammals[which.max(mammals$body),]
mammals[which.min(mammals$body),]

mammals$brain.percent <- mammals$brain / (mammals$body * 1000) * 100
mammals[which.max(mammals$brain.percent),]
mammals[which.min(mammals$brain.percent),]

med.brain.percent <- median(mammals$brain.percent)
med.brain.percent
subset(mammals, subset=(mammals$brain.percent > med.brain.percent) 
       & size == "large")

# 5-11
data(mtcars)
library(sqldf)
sqldf("select * from mtcars where mpg > 30", row.names=TRUE)
subset(mtcars, subset=(mpg > 30))

sqldf("select * from mtcars where cyl=6 order by mpg", row.names=TRUE)
subset(mtcars, subset=(cyl == 6))[order(subset(mtcars, subset=(cyl == 6))$mpg),]

data(iris)
sqldf("select * from iris where [Sepal.Length] between 4.5 and 4.9 
      and Species in ('versicolor', 'virginica')")
subset(iris, subset=(Sepal.Length >= 4.5 & Sepal.Length <= 4.9) 
       & Species %in% c('versicolor', 'virginica'))

sqldf("select avg([Sepal.Length]) as avg_Sepal_Length, Species 
      from iris group by Species") 
sapply(split(iris$Sepal.Length, iris$Species), mean)
