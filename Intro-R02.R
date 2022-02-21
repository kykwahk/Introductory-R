
################
## ¡¶2¿Â ∫§≈Õ ##
################

###################
## 2.1 ∫§≈Õ ª˝º∫ ##
###################

c(1,2,3,4,5,6,7,8,9,10)
c("We", "love", "Data Analytics")
c(TRUE, FALSE, TRUE, FALSE)

odd <- c(1,3,5)
even <- c(2,4,6)
c(odd, even)

3:9
5:-3

seq(from=3, to=9)
seq(from=3, to=9, by=2)
seq(from=3.5, to=1.5, by=-0.5)

seq(from=0, to=100, length.out=5)
seq(from=-1, to=1, length.out=5)

rep(1, times=3)
rep(c(1,2,3), times=3)
rep(c(1,2,3), each=3)
rep(c(1,2,3), times=c(1, 2, 3))
rep(1:3, length.out=8)

num <- c(1,2,3)
cha <- c("X", "Y", "Z")
c(num, cha)

num <- c(1,2,3)
cha <- c("X", "Y", "Z")
str(num)
str(cha)

length(num)

LETTERS
letters
month.abb
month.name
pi

month <- c(12,9,3,5,1)
month.name[month]

#####################
## 2.2 ∫§≈Õ ¿Œµ¶ΩÃ ##
#####################

num <- 0:30
num

prime <- c(2,3,5,7,11,13,17,19)
prime
prime[1]
prime[2]
prime[3]

prime <- c(2,3,5,7,11,13,17,19)
prime[1:3]
prime[4:6]

prime <- c(2,3,5,7,11,13,17,19)
prime[c(1,1,5,5)]
prime[c(1,3,5,7)]
prime[c(7,5,3,1)]

prime <- c(2,3,5,7,11,13,17,19)
indices <- c(1,3,5,7)
prime[indices]

prime <- c(2,3,5,7,11,13,17,19)
prime[-1]
prime[-1:-3]
prime[-(1:3)]

prime <- c(2,3,5,7,11,13,17,19)
length(prime)
prime[1:(length(prime)-1)]
prime[-length(prime)]

prime <- c(2,4,5,7,11,14,17,18)
prime[2] <- 3
prime
prime[c(6,8)] <- c(13,19)
prime

prime <- c(2,3,5,7,11,13,17,19)
length(prime)
prime[9] <- 23
prime
prime[c(10,11)] <- c(29,31)
prime
prime[15] <- 47
prime

prime <- c(2,3,5,7,11,13,17,19)
prime < 10
prime[prime < 10]
prime %% 2 == 0
prime[prime %% 2 == 0]

prime <- c(2,3,5,7,11,13,17,19)
seq_along(prime)
prime[seq_along(prime) %% 2 == 0]
prime[seq_along(prime) %% 3 == 0]

prime <- c(2,3,5,7,11,13,17,19)
prime[c(FALSE, TRUE)]
prime[c(FALSE, FALSE, TRUE)]

rainfall <- c(21.6,23.6,45.8,77.0,102.2,133.3,
              327.9,348.0,137.6,49.3,53.0,24.9)
rainfall > 100
which(rainfall > 100)
month.abb[which(rainfall > 100)]
month.name[which.min(rainfall)]
month.name[which.max(rainfall)]

rainfall[rainfall > 100]
rainfall[which.min(rainfall)]
rainfall[which.max(rainfall)]

traffic.death <- c(842,729,786,751,844,851,702)
names(traffic.death) <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
names(traffic.death)
traffic.death

traffic.death["Sat"]
traffic.death[c("Tue", "Thu", "Sun")]
weekend <- c("Fri", "Sat", "Sun")
traffic.death[weekend]

names(traffic.death[traffic.death > 800])

traffic.death > 800
traffic.death[traffic.death > 800]
names(traffic.death[traffic.death > 800])

###################
## 2.3 ∫§≈Õ ø¨ªÍ ##
###################

1 + 2
2^10
10 %% 3
10 %/% 3

1 + 2
"+"(1,2)

c(1,2,3) + c(4,5,6)

c(1,2,3) * c(4,5,6)

k <- c(10,20,30)
k / c(2,4,6)
k %% c(3,5,7)
k %/% c(3,5,7)

x <- c(1:3)
x
y <- c(4:9)
y
x + y

c(1,3,5) + 10

c(1,2,3) + c(4,5,6,7,8)

v <- pi
w <- 10/3
v == w
v != w
v > w
v < w
!(v > w)
(v == w) | (v < w)
(v == w) & (v < w)
isTRUE(v == w)

y <- c(0,25,50,75,100)
z <- c(50,50,50,50,50)
y == z
y != z
y > z
y < z

y <- c(0,25,50,75,100)
y == 50
y > 50

as.numeric(TRUE)
as.numeric(FALSE)
TRUE * TRUE
TRUE * FALSE
TRUE + TRUE

y <- c(0,25,50,75,100)
sum(y > 50)

a <- -3:3
a
any(a > 0)
all(a > 0)

sqrt(2)^2 == 2
sqrt(2)^2 - 2
identical(sqrt(2)^2, 2)

all.equal(sqrt(2)^2, 2)

all.equal(sqrt(2)^2, 3)
isTRUE(all.equal(sqrt(2)^2, 3))
isTRUE(all.equal(sqrt(2)^2, 2))

fruit <- c("Apple", "Banana", "Strawberry")
food <- c("Pie", "Juice", "Cake")
paste(fruit, food)

paste(fruit, "Juice")

###################
## 2.4 ∫§≈Õ «‘ºˆ ##
###################

x <- -3:3
abs(x)

log(1:5, base=3)
log(1:5)
log(1:5, base=exp(1))

log2(1:5)
log(1:5, base=2)
log10(1:5)
log(1:5, base=10)

exp(1:5)
y <- exp(1:5)
log(y)

factorial(1:5)
choose(5, 2)

factorial(5)/(factorial(2)*factorial(5-2))

sqrt(1:5)

options("digits")
pi
pi*100

signif(456.789, digits=2)
signif(456.789, digits=3)
signif(456.789, digits=4)

round(456.789, digits=2)
round(456.789)
round(sqrt(1:5), 2)

round(456.789, digits=-2)
round(456.789, digits=-1)

round(11.5)
round(12.5)
round(13.5)
round(-3.5)
round(-4.5)
round(-5.5)

floor(456.78)
floor(-456.78)
ceiling(456.78)
ceiling(-456.78)
trunc(456.78)
trunc(-456.78)

3/0
5 - Inf
Inf * Inf
Inf * (-Inf)

is.infinite(10^(305:310))

Inf/Inf
Inf * 0
log(-2)
NaN + 3
is.nan(NaN + 3)

k <- NA
k + 5
sqrt(k)

k == NA
is.na(k)
is.na(k + 5)
is.na(NaN)

z <- 1:5
sum(z)
prod(z)
min(z)
max(z)

z <- 1:5
mean(z)
median(z)
range(z)
var(z)
sd(z)

w <- c(1,2,3,4,5,NA)
sum(w)
sum(w, na.rm=TRUE)
sum(na.omit(w))

v <- c(NA,NA,NA,NA,NA)
sum(v, na.rm=TRUE)
prod(v, na.rm=TRUE)
max(v, na.rm=TRUE)
min(v, na.rm=TRUE)

v1 <- c(1,2,3,4,5)
v2 <- c(5,4,3,2,1)
min(v1, v2)
max(v1, v2)
pmin(v1, v2)
pmax(v1, v2)

pmax(c(1, -2, 3, -4, 5, -6, 7, -8, 9), 0)

v1 <- c(1,2,3,4,5)
v2 <- c(5,4,3,2,1)
pmin(v1, v2, pi)
pmax(v1, v2, pi)

traffic.death <- c(842,729,786,751,844,851,702)
cumsum(traffic.death)

u <- c(3,5,1,NA,2)
cumsum(u)

traffic.death <- c(842,729,786,751,844,851,702)
diff(traffic.death)

u <- c(3,5,1,NA,2)
diff(u)

diff(1:5, lag=2)

p <- 1:10
q <- 6:15
union(p, q)
intersect(p, q)
setdiff(p, q)
setdiff(q, p)
setequal(p, q)
is.element(setdiff(p, q), p)
is.element(setdiff(p, q), q)

##############
## 2.5 ∆—≈Õ ##
##############

review <- c("Good", "Good", "Indifferent", "Bad", "Good", "Bad")
review
review.factor <- factor(review)
review.factor

str(review.factor)

as.numeric(review.factor)
as.integer(review.factor)

eventday <- c("Mon", "Mon", "Wed", "Tue", "Mon", "Wed", "Fri", "Thu", "Tue")
eventday.factor <- factor(eventday)
eventday.factor

eventday.factor <- factor(eventday, 
                          levels=c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"))
eventday.factor

eventday.factor <- factor(eventday, levels=unique(eventday))
eventday.factor

review <- c("Good", "Good", "Indifferent", "Bad", "Good", "Bad")
review.factor <- factor(review)
levels(review.factor)

levels(review.factor) <- c("B", "G", "I")
review.factor

nlevels(review.factor)
length(levels(review.factor))

eval <- c("Medium", "Low", "High", "Medium", "High")
eval.factor <- factor(eval)
eval.factor

eval.ordered <- factor(eval, levels=c("Low", "Medium", "High"), ordered=TRUE)
eval.ordered

table(eval.factor)
table(eval.ordered)

eval.factor <- factor(eval, levels=c("Low", "Medium", "High"))
table(eval.factor)

eval.factor[1] > eval.factor[2] 

eval.ordered[1] > eval.ordered[2]

#/
df <- data.frame(id=rep(1:5, each=2), 
                 eval=c("low", "high", "medium", "medium", "low", "medium",
                        "medium", "high", "low", "low"))
df
df$eval <- factor(df$eval, levels=c("low","medium","high"))
aggregate(eval ~ id, data=df, FUN=max)

df$eval <- factor(df$eval, levels=c("low","medium","high"), ordered=TRUE)
aggregate(eval ~ id, data=df, FUN=max)
#/

sex <- c(2,1,2,2,1,0)
sex.factor <- factor(sex, levels=c(1, 2), labels=c("Male", "Female"))

sex.factor
table(sex.factor)

## forcats ∆–≈∞¡ˆ

food <- factor(c("Vegetables", "Fruits", "Vegetables", "Grains", "Fruits", 
                 "Vegetables", "Dairy", "Fruits", "Proteins", "Fruits"))
food

library(forcats)
fct_inorder(food)

fct_infreq(food)

fct_relevel(food, "Fruits", "Vegetables", "Grains", "Proteins", "Dairy")

fct_relevel(food, "Proteins")

fct_relevel(food, "Proteins", "Dairy")

fct_relevel(food, "Proteins", after=2)

fct_relevel(food, "Proteins", after=Inf)

food
value <- c(1000, 1500, 1200, 700, 2000, 
           2000, 1350, 2500, 15000, 3000)
fct_reorder(food, .x=value)

fct_reorder(food, .x=value, .fun=mean)
median(c(1000, 1200, 2000))
mean(c(1000, 1200, 2000))

fct_reorder(food, .x=value, .desc=TRUE)

fct_recode(food, Fats="Proteins", Fats="Dairy")

##############
## ø¨Ω¿πÆ¡¶ ##
##############

# 2-1
1:10
10:1
c(1:10, 9:1)

# 2-2
seq(0, 1, 0.1)
seq(0, 1, length.out=10)

# 2-3
x <- 1:10
y <- 3:1

names(x) <- letters[x]
x

x + y

# 2-4
pi
signif(pi, digits=3)
round(pi)
round(pi, digits=3)
ceiling(pi)
trunc(pi)

# 2-5
heights <- c(179, 161, 165, 185, 158)
weights <- c(75, 72, 60, 100, 65)

bmi <- weights/(heights*0.01)^2
bmi

weights[bmi > 25]

# 2-6
vec <- c(2,5,3)
vec
rep(vec, 5)
rep(vec, length.out=10)
rep(vec, times=c(2,5,3))

# 2-7
c(TRUE, TRUE, FALSE, FALSE) & c(TRUE, FALSE, TRUE, FALSE)
c(TRUE, TRUE, FALSE, FALSE) | c(TRUE, FALSE, TRUE, FALSE)
c(TRUE, TRUE, FALSE, FALSE) + 1:4

# 2-8
sum(1:100 %% 7 == 0)

# 2-9
rep(c("a", "b", "c"), 3)
rep(c(1,3,5), c(1,3,5))
rep(0:2, rep(2,3))
rep(seq(1,3), times=3) + rep(0:2, each=3)

# 2-10
none.true <- c(FALSE, FALSE, FALSE)
some.true <- c(FALSE, TRUE, FALSE)
all.true <- c(TRUE, TRUE, TRUE)
true.missing <- c(TRUE, TRUE, NA)
false.missing <- c(NA, FALSE, NA)
mixed <- c(TRUE, FALSE, NA)

any(none.true)
any(some.true)
any(all.true)
any(true.missing)
any(false.missing)
any(mixed)

all(none.true)
all(some.true)
all(all.true)
all(true.missing)
all(false.missing)
all(mixed)

# 2-11
x <- 1:10
z <- (x - mean(x))/sd(x)
z
mean(z)
sd(z)

# 2-12
exam1 <- c(9,4,7,9)
exam2 <- c(10,5,8,7)
exam3 <- c(8,3,6,9)

pmax(exam1, exam2, exam3)

# 2-13
dice <- c(3,2,5,1,5,6,5)
possible.dice <- c(1,2,3,4,5,6)
labels.dice <- c("one", "two", "three", "four", "five", "six")
dice.f <- factor(dice, levels=possible.dice, labels=labels.dice)
dice.f
table(dice.f)

# 2-14
grade <- factor(c("A", "B", "C", "D", "F"))
grade
count <- c(11, 25, 30, 5, 2)

library(forcats)
fct_relevel(grade, "F")

fct_reorder(grade, count, .desc=TRUE)
