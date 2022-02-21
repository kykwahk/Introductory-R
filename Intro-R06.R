
#########################
## 제6장 텍스트와 날짜 ##
#########################

################
## 6.1 텍스트 ##
################

x <- "We have a dream"
nchar(x)
length(x)

y <- c("We", "have", "a", "dream")
length(y)
nchar(y[4])
nchar(y)

sort(letters)
sort(letters, decreasing=TRUE)

fox.says <- "It is only with the HEART that one can See Rightly"
tolower(fox.says)
toupper(fox.says)

fox.said <- "what is essential is invisible to the eye"
fox.said
strsplit(x=fox.said, split=" ")

strsplit(x=fox.said, split="")

fox.said.words <- unlist(strsplit(fox.said, " "))
fox.said.words
fox.said.words <- strsplit(fox.said, " ")[[1]]
fox.said.words
fox.said.words[3]

p1 <- "You come at four in the afternoon, then at three I shall begin to be happy"
p2 <- "One runs the risk of weeping a little, if one lets himself be tamed"
p3 <- "What makes the desert beautiful is that somewhere it hides a well"
littleprince <- c(p1, p2, p3)
strsplit(littleprince, " ")
strsplit(littleprince, " ")[[3]]
strsplit(littleprince, " ")[[3]][5]

fox.said <- "WHAT IS ESSENTIAL is invisible to the Eye"
fox.said.words <- strsplit(fox.said, " ")[[1]]
fox.said.words
unique(fox.said.words)
unique(tolower(fox.said.words))

paste("Everybody", "wants", "to", "fly")

paste(c("Everybody", "wants", "to", "fly"))

fox.said <- "WHAT IS ESSENTIAL is invisible to the Eye"
fox.said.words <- strsplit(fox.said, " ")[[1]]
fox.said.words
paste(fox.said.words)

paste("Everybody", "wants", "to", "fly", sep="-")
paste("Everybody", "wants", "to", "fly", sep="")
paste0("Everybody", "wants", "to", "fly")

paste(pi, sqrt(pi))
paste("25 degrees Celsius is", 25*1.8 + 32, "degrees Fahrenheit")

heroes <- c("Batman", "Captain America", "Hulk")
colors <- c("Black", "Blue", "Green")
paste(colors, heroes)

paste("Type", 1:5)
heroes <- c("Batman", "Captain America", "Hulk")
paste(heroes, "wants", "to", "fly")

paste(c("Everybody", "wants", "to", "fly"))
paste(c("Everybody", "wants", "to", "fly"), collapse=" ")

heroes <- c("Batman", "Captain America", "Hulk")
paste(heroes, "wants", "to", "fly")
paste(heroes, "wants", "to", "fly", collapse=", and ")

heroes <- c("Batman", "Captain America", "Hulk")
paste(heroes, "wants", "to", "fly", sep="-", collapse="; ")
paste(month.abb, 1:12, sep="_", collapse="-")

outer(c(1,2,3), c(3,2,1))

asian.countries <- c("Korea", "China", "Japan")
info <- c("GDP", "Population", "Area")
outer(asian.countries, info, FUN=paste, sep="-")

out <- outer(asian.countries, info, FUN=paste, sep="-")
as.vector(out)

outer(asian.countries, asian.countries, paste, sep="-")

x <- outer(asian.countries, asian.countries, paste, sep="-")
x[!lower.tri(x)]

customer <- "Jobs"
buysize <- 10
deliveryday <- 3
paste("Hello ", customer, ", your order of ", buysize, 
      " product(s) will be delivered within ", deliveryday, " day(s).", sep="")

sprintf("Hello %s, your order of %s product(s) will be delivered within %s days.", 
        customer, buysize, deliveryday)

customers <- c("Jobs", "Gates", "Bezos")
buysizes <- c(10, 7, 12)
deliverydays <- c(3, 2, 7.5)
sprintf("Hello %s, your order of %s product(s) will be delivered within %s days.", 
        customers, buysizes, deliverydays)

sprintf("Hello %s, your order of %s product(s) will be delivered within %.1f days.", 
        customers, buysizes, deliverydays)

?sprintf

substr("Data Analytics", start=1, stop=4)
substr("Data Analytics", 6, 14)
substring("Data Analytics", 6)

class <- c("Data Analytics", "Data Mining", "Data Visualization")
substr(class, 1, 4)

countries <- c("Korea, KR", "United States, US", "China, CN")
substr(countries, nchar(countries)-1, nchar(countries))

head(islands)
landmasses <- names(islands)
landmasses

grep(pattern="New", x=landmasses)

index <- grep("New", landmasses)
landmasses[index]

grep("New", landmasses, value=TRUE)

landmasses[grep(" ", landmasses)]
grep(" ", landmasses, value=TRUE)

grepl("New", landmasses)

landmasses[grepl("New", landmasses)]
sum(grepl("New", landmasses))

string <- c("data analytics is useful",
            "business analytics is helpful",
            "visualization of data is interesting for data scientists")
regexpr(pattern="data", text=string)

gregexpr("data", string)

regmatches(x=string, m=regexpr("data", string))
regmatches(string, gregexpr("data", string))

sub(pattern="data", replacement="text", x=string)

gsub(pattern="data", replacement="text", x=string)

x <- c("product.csv", "customer.csv", "supplier.csv")
gsub(".csv", "", x)

words <- c("at", "bat", "cat", "chaenomeles", "chase", "chasse", 
           "cheap", "check", "cheese",  "chick", "hat")

grep("che", words, value=TRUE)
grep("at", words, value=TRUE)

grep("[ch]", words, value=TRUE)
grep("[at]", words, value=TRUE)

grep("ch|at", words, value=TRUE)

grep("ch(e|i)ck", words, value=TRUE)

grep("chas?e", words, value=TRUE)
grep("chas*e", words, value=TRUE)
grep("chas+e", words, value=TRUE)
grep("ch(a*|e*)se", words, value=TRUE)

grep("^c", words, value=TRUE)
grep("t$", words, value=TRUE)

grep("^c.*t$", words, value=TRUE)

grep("^[hc]?at", words, value=TRUE)

words2 <- c("12 Dec", "OK", "http://", "<TITLE>Time?</TITLE>", "12345", "Hi there" )
grep("[[:alnum:]]", words2, value=TRUE)
grep("[[:alpha:]]", words2, value=TRUE)
grep("[[:digit:]]", words2, value=TRUE)
grep("[[:punct:]]", words2, value=TRUE)
grep("[[:space:]]", words2, value=TRUE)

grep("\\w", words2, value=TRUE)
grep("\\d", words2, value=TRUE)
grep("\\s", words2, value=TRUE)

## stringr 패키지

library(stringr)
string <- c("data analytics is useful",
            "business analytics is helpful",
            "visualization of data is interesting for data scientists")
str_detect(string=string, pattern="data")

str_detect(string, fixed("DATA", ignore_case=TRUE))

str_locate(string, "data")
str_locate_all(string, "data")

str_extract(string, "data")
str_extract_all(string, "data")

str_replace(string=string, pattern="data", replacement="text")
str_replace_all(string, "data", "text")

str_split(string, " ")

unlist(str_split(string, " "))
unique(unlist(str_split(string, " ")))

##############
## 6.2 날짜 ##
##############

Sys.Date()
date()

Sys.time()

class(Sys.Date())

as.Date("2030-12-31")
as.Date("12/31/2030")
as.Date("12/31/2030", format="%m/%d/%Y")

d <- as.Date("2030-12-31")
format(d, format="%m/%d/%Y")

?strptime

today <- Sys.Date()
today
format(today, format="%Y/%m/%d %A")

d <- as.Date("2030-12-31")
weekdays(d)

d + 7
d + 1:7

weekdays(d + 1:7)

start <- as.Date("2031-01-01")
end <- as.Date("2031-01-31")
seq(from=start, to=end, by=1)

seq(from=start, by=1, length.out=7)

seq(from=start, by="7 days", length.out=9)
seq(from=start, by="week", length.out=9)
seq(from=start, by="month", length.out=12)
seq(from=start, by="3 months", length.out=4)
seq(from=start, by="year", length.out=10)

seq(from=as.Date("2031-01-30"), by="month", length.out=6)

start <- as.Date("2031-01-01")
qrt <- seq(from=start, by="3 months", length.out=4)
months(qrt)
quarters(qrt)

Sys.getlocale()

Sys.setlocale("LC_TIME", "C")
months(qrt)

Sys.setlocale()
Sys.setlocale("LC_TIME", "Korean_Korea.949")
months(qrt)

pct <- as.POSIXct("2030/03/15, 15:03:04", format="%Y/%m/%d, %H:%M:%S")
pct
class(pct)
as.integer(pct)

plt <- as.POSIXlt("2030-03-15, 15:03:04", format="%Y-%m-%d, %H:%M:%S")
plt
class(plt)

unclass(plt)

plt$mday
plt$mon
plt$year
plt$wday
plt$hour

dposix <- as.Date("2030-12-31")
dposix
as.POSIXlt(dposix)$wday
as.POSIXlt(dposix)$yday
as.POSIXlt(dposix)$year + 1900
as.POSIXlt(dposix)$mon + 1

strptime("2030-12-31", format="%Y-%m-%d")
class(strptime("2030-12-31", format="%Y-%m-%d"))
strptime("2030-12-31", format="%Y-%m-%d")$year + 1900
dates <- c("05/05/81", "06/06/92", "08/15/03", "10/03/14", "12/25/25")
times <- c("22:05:19", "20:29:46", "05:03:30", "17:11:05", "15:36:25")
dt <- paste(dates, times)
strptime(dt, "%m/%d/%y %H:%M:%S")

moon <- as.POSIXct("1969/07/20, 20:17:39", format="%Y/%m/%d, %H:%M:%S", tz="UTC")
moon
format(moon, "The time of the Apollo moon landing was %Y-%b-%d, at %H:%M:%S.")
format(moon, "인류 최초의 달 착륙은 %Y년 %m월 %d일, %H시 %M분 %S초에 이루어졌다.")

y <- 2030
m <- 12
d <- 31
ISOdate(y, m, d)
class(ISOdate(y, m, d))

as.Date(ISOdate(y, m, d))

years <- c(2030, 2031, 2032, 2033)
months <- c(1, 4, 7, 10)
days <- c(12, 19, 25, 17)
ISOdate(years, months, days)
as.Date(ISOdate(years, months, days))

jdate <- as.Date("2030-12-31")
as.integer(jdate)
julian(jdate)

as.integer(as.Date("1970-01-01"))
as.integer(as.Date("1969-12-31"))
as.integer(as.Date("1970-01-02"))
as.integer(as.Date("1970-01-03"))

as.Date(as.integer(jdate), origin="1970-01-01")
as.Date(julian(jdate), origin="1970-01-01")

moon <- as.POSIXct("1969/07/20, 20:17:39", format="%Y/%m/%d, %H:%M:%S", tz="UTC")
moon
moon + 2*60*60

moon + 7*24*60*60
moon - 7*24*60*60

as.Date(moon) + 7

start <- as.Date("1988-09-17")
end <- as.Date("2018-02-09")
days <- end - start
days

today <- Sys.Date()
Pororo <- as.Date("2003-11-27")
difftime(today, Pororo, units="weeks")

Sys.time()
moon <- as.POSIXct("1969/07/20, 20:17:39", format="%Y/%m/%d, %H:%M:%S", tz="UTC")
moon
Sys.time() > moon
Sys.Date()
as.Date(moon)
Sys.Date() > as.Date(moon)
period <- seq(as.POSIXct("1950-01-01", tz="UTC"), by="10 years", length.out=5)
period
period > moon

## lubridate 패키지

library(lubridate)
today()
class(today())
now()
class(now())

ymd("2030-03-15")
mdy("03/15/2030")
dmy("15032030")

ymd("300315")
ymd("2030년 3월 15일")
mdy("3월 15일, 2030")
dmy("15-March-2030")

mdy("March 15th, 2030")

Sys.setlocale("LC_TIME", "C")
mdy("March 15th, 2030")
Sys.setlocale()

ymd(20300315)

ymd_hms("2030-03-15 23:11:59")
mdy_hm("03/15/2030 23:12")
dmy_h("15032030 23")

years <- c(2030, 2031, 2032, 2033)
months <- c(1, 4, 7, 10)
days <- c(12, 19, 25, 17)
hours <- c(3, 7, 11, 20)
mins <- c(5, 12, 33, 59)
secs <- c(15, 5, 27, 55)

dt <- data.frame(years, months, days, hours, mins, secs)
dt

make_date(year=dt$years, month=dt$months, day=dt$days)
make_datetime(year=dt$years, month=dt$months, day=dt$days, 
              hour=dt$hours, min=dt$mins, sec=dt$secs)

today()
as_datetime(today())
ymd("2030-03-15")
as_datetime(ymd("2030-03-15"))

now()
as_date(now())
ymd_hms("2030-03-15 23:11:59")
as_date(ymd_hms("2030-03-15 23:11:59"))

datetime <- ymd_hms("1969/07/20, 20:17:39")
datetime
year(datetime)
month(datetime)
mday(datetime)
hour(datetime)
minute(datetime)
second(datetime)
yday(datetime)
wday(datetime)

Sys.setlocale("LC_TIME", "C")
month(datetime, label=TRUE)
month(datetime, label=TRUE, abbr=FALSE)
wday(datetime, label=TRUE)
wday(datetime, label=TRUE, abbr=FALSE)
Sys.setlocale()

month(datetime, label=TRUE)
wday(datetime, label=TRUE)

datetime
year(datetime) <- 2030
datetime
month(datetime) <- 8
datetime
hour(datetime) <- hour(datetime) + 1
datetime

update(datetime, year=2031, month=8, mday=15, hour=11)
update(datetime, yday=1)

datetime <- ymd_hms("1969/07/20, 20:17:39")
datetime
semester(datetime)
quarter(datetime)
am(datetime)
pm(datetime)

datetime
round_date(datetime, unit="year")
round_date(datetime, unit="month")
round_date(datetime, unit="day")
round_date(datetime, unit="week")
floor_date(datetime, unit="month")
ceiling_date(datetime, unit="month")

years(1)
months(3)
days(7)
weeks(2)

hours(c(12, 24))
minutes(1:5)
seconds(seq(0, 10, by=2))

10 * (months(6) + days(2))
days(60) + hours(12) + minutes(15)

moon <- ymd("1969/07/20")
moon
moon + days(10000)
moon + months(1000)
moon - years(100)

mars <- ymd("2021/02/18")
mars
mars - moon

interval(moon, mars)
class(interval(moon, mars))

moon %--% mars

as.period(moon %--% mars)

as.duration(moon %--% mars)

moon.to.mars <- as.duration(moon %--% mars)
as.numeric(moon.to.mars, "years")
as.numeric(moon.to.mars, "months")
as.numeric(moon.to.mars, "days")
as.numeric(moon.to.mars, "hours")
as.numeric(moon.to.mars, "minutes")

class(as.period(moon %--% mars))

class(as.duration(moon %--% mars))

dyears(1)
dmonths(1)
ddays(1)
dweeks(1)
dhours(1)
dminutes(1)
dseconds(1)

2 * dyears(1)
dyears(1) + dweeks(4) + dhours(12)

ymd("2029-01-01") + years(1)
ymd("2029-01-01") + dyears(1)

ymd("2028-01-01") + years(1)
ymd("2028-01-01") + dyears(1)

leap_year(2029)
leap_year(2028)

years(1)/days(1)
as.duration(ymd("2028-01-01") %--% ymd("2029-01-01"))/ddays(1)
(ymd("2028-01-01") %--% ymd("2029-01-01"))/ddays(1)

Sys.timezone()

OlsonNames()
length(OlsonNames())

kst <- ymd_hm("2030-03-15 15:30", tz="Asia/Seoul")
kst

utc <- ymd_hm("2030-03-15 06:30")
utc

kst - utc

ny <- ymd_hms("2030-01-01 00:00:00", tz="America/New_York")
with_tz(ny, tzone="Asia/Seoul")

##############
## 연습문제 ##
##############

# 6-1
hbirthday <- c("Happy", "Birthday", "to", "You")
hbirthday

length(hbirthday)
sum(nchar(hbirthday))

# 6-2
hbirthday2 <- paste(hbirthday, collapse=" ")
hbirthday2

length(hbirthday2)
sum(nchar(hbirthday2))

# 6-3
paste(LETTERS[1:10], 1:10)

paste(LETTERS[1:10], 1:10, sep="")

# 6-4
paste(c("red", "blue"), "pen")

paste(c("red", "blue"), "pen", sep="-")

paste(c("red", "blue"), "pen", collapse="; ")

paste(c("red", "blue"), "pen", sep="-", collapse="; ")

# 6-5
txt <- "Good Morning"
s <- strsplit(txt, " ")
s

list(s[[1]][1], s[[1]][2])

list(unlist(s)[1], unlist(s)[2])

# 6-6
txt <- c("Yesterday is history, tomorrow is a mystery, today is a gift!",
         "That's why we call it the present - from Kung Fu Panda")
txt

strsplit(txt, split=",? -? ?")

strsplit(txt, split=",? (- )?")

# 6-7
out <- outer(1:6, 1:6, FUN=paste)
out

dice <- as.vector(out)
dice

# 6-8
ssn <- c("941215-1234567","850605-2345678","760830-1357913")
ssn

paste(substr(ssn, 1, 7), "*******", sep="")

# 6-9
str(USArrests)

index <- grep("New", row.names(USArrests))
USArrests[index,]
colMeans(USArrests[index,])

# 6-10
txt <- c("a", "ab", "acb", "accb", "acccb", "accccb")
grep("ac?b", txt, value=TRUE)
grep("ac*b", txt, value=TRUE)
grep("ac+b", txt, value=TRUE)

# 6-11
df <- data.frame(Datetime=c("12/25/2030 23:59:59","1/25/2031 23:59:59",
                            "2/25/2031 23:59:59"))

df$Datetime <- strptime(df$Datetime, format="%m/%d/%Y %H:%M:%S")
df
str(df)

# 6-12
format(seq(as.Date("2030-06-01"), by="day", length.out=7), "%a-%m%d")

# 6-13
mydate <- as.Date(c("2030-12-25", "2031-1-25", "2032-2-25"))
mydate

Sys.setlocale("LC_TIME", "C")
format(mydate, "%B %d, %Y")
Sys.setlocale("LC_TIME", "Korean_Korea.949")

# 6-14
library(stringr)
sentences3 <- sentences[1:3]
sentences3
str_replace_all(sentences3, fixed("the", ignore_case=TRUE), "THE")

# 6-15
d1 <- "January 1, 2030"
d2 <- "2030-Mar-21"
d3 <- c("August 15 (2030)", "July 17 (2030)")
d4 <- "7-Jun-2030"
d5 <- "12/30/30" # 2030년 12월 30일

library(lubridate)

Sys.setlocale("LC_TIME", "C")
mdy(d1)
ymd(d2)
mdy(d3)

Sys.setlocale("LC_TIME", "Korean_Korea.949")
dmy(d4)
mdy(d5)

