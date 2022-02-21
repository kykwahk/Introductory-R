
#######################
## 제7장 입력과 출력 ##
#######################

##############
## 7.1 입력 ##
##############

## 키보드

product <- data.frame(id=c("A001", "A002", "A003"),
                      name=c("Mouse", "Keyboard", "USB"),
                      price=c(30000, 90000, 50000))
product

product <- data.frame()
product
product <- edit(product)

fix(product)

p <- readClipboard()
p

p <- readClipboard()
p

p <- read.table(file="clipboard", sep="\t", header=TRUE)
p

?Quotes

mytxt <- "
id name price
A001 Mouse 30000
A002 Keyboard 90000
A003 USB 50000
"
p <- read.table(text=mytxt, header=TRUE)
p

## 파일

read.csv(file="product.csv")

read.csv("product-with-no-header.csv", header=FALSE)

read.table(file="product.txt")

read.table("product.txt", header=TRUE)

read.table("product-colon.txt", sep=":", header=TRUE)

read.table("product-missing.txt", header=TRUE)
read.table("product-missing.txt", header=TRUE, na.strings=".")

read.table("product-comment.txt", header=TRUE)

brand.eval <- read.table("brand-eval.csv", header=TRUE, 
                         row.names="BrandID", sep=",")
brand.eval
str(brand.eval)

brand.eval <- read.table("brand-eval.csv", header=TRUE, 
                         row.names="BrandID", sep=",", 
                         colClasses=c("character", "character", 
                                      "numeric", "numeric", "numeric"))
brand.eval
str(brand.eval)

read.fwf(file="product-fwf.txt", widths=c(4,-1,10,8))

read.fwf("product-fwf.txt", widths=c(4,-1,10,8), col.names=c("id", "name", "price"))

readLines(con="won-dollar.txt")

paste(readLines(con="won-dollar.txt"), collapse=" ")

readLines("won-dollar.txt", n=2)

scan(file="won-dollar.txt", what=character())

scan("won-dollar.txt", what=list(character(), numeric(), numeric()))

scan("won-dollar.txt", 
     what=list(date=character(), buy=numeric(), sell=numeric()))

scan("won-dollar.txt", 
     what=list(date=character(), buy=numeric(), sell=numeric()),
     nlines=2)
scan("won-dollar.txt",
     what=list(date=character(), buy=numeric(), sell=numeric()),
     skip=3)

library(readxl)
read_excel(path="product.xlsx", sheet=1)

library(openxlsx)
read.xlsx(xlsxFile="product.xlsx", sheet=1)

# readr 패키지
library(readr)
read_csv(file="product.csv")
read_csv(file="product.csv", show_col_types=FALSE)

read_csv("product-with-no-header.csv", col_names=FALSE)
read_csv("product-with-no-header.csv", col_names=c("id", "name", "price"))

read_csv("product-missing.csv", na=".")

read_csv("product-comment.csv", comment="#")
read_csv("product-comment.csv", skip=1)

read_delim(file="product.txt", delim=" ")
read_delim("product-with-no-header.csv", delim=",", 
           col_names=c("id", "name", "price"))

read_fwf(file="product-fwf.txt", 
         col_positions=fwf_empty(file="product-fwf.txt", 
                                 col_names=c("id", "name", "price")))

read_fwf("product-fwf.txt", 
         col_positions=fwf_widths(widths=c(5, 10, 8), c("id", "name", "price")))

read_fwf("product-fwf.txt", 
         col_positions=fwf_positions(start=c(6, 16), end=c(15, 23), 
                                     c("name", "price")))

read_fwf("product-fwf.txt", 
         col_positions=fwf_cols(name=c(6, 15), price=c(16, 23)))
read_fwf("product-fwf.txt", 
         col_positions=fwf_cols(id=5, name=10, price=8))

read_table(file="product-fwf.txt", col_names=c("id", "name", "price"))
read_table(file="product.txt")

read_lines(file="won-dollar.txt")

read_lines("won-dollar.txt", skip=1, n_max=3)

read_file(file="won-dollar.txt")

parse_number("$100")
parse_number("30%")
parse_number("61.3kg")
parse_number("Salary per year: $250,000")

parse_number("61,3kg", locale=locale(decimal_mark=","))
parse_number("Salary per year: $250.000", locale=locale(grouping_mark="."))

## 웹사이트

url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
iris.UCI <- read.csv(url, header=FALSE)
head(iris.UCI)

url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
local.copy <- "iris.csv"
download.file(url=url, destfile=local.copy)
iris.UCI <- read.csv(local.copy, header=FALSE)
head(iris.UCI)

url <- "https://github.com/chadwickbureau/baseballdatabank/archive/master.zip"
local.copy <- "lahman.zip"
download.file(url, local.copy)
baseball.salary <- read.csv(unzip(zipfile=local.copy, 
                                  "baseballdatabank-master/core/Salaries.csv"))
head(baseball.salary)

url <- "http://www.nrc.gov/reading-rm/doc-collections/event-status/reactor-status/PowerReactorStatusForLast365Days.txt"
library(httr)
get <- GET(url)
txt <- content(get, as="text")
cat(txt)

library(readr)
npower <- read_delim(txt, delim="|")
head(npower, 3); tail(npower, 3)
npower$ReportDt <- as.Date(npower$ReportDt, format="%m/%d/%Y")
head(npower, 3); tail(npower, 3)
dim(npower)

# [그림 7-4]
library(lattice)
some <- npower[npower$Unit %in% unique(npower$Unit)[1:12],]
windows(width=7.0, height=5.5)
xyplot(Power ~ ReportDt | Unit, data=some,
       strip=strip.custom(par.strip.text=list(cex=0.8)),
       type="l", col.line="black", xlab="Time", ylab="Power")

cloud.seeding <- scan("http://lib.stat.cmu.edu/datasets/cloud",
                      skip=15,
                      nlines=108,
                      what=list(period=character(),
                                seeded=character(),
                                season=character(),
                                te=numeric(),
                                tw=numeric(),
                                nc=numeric(),
                                sc=numeric(),
                                nwc=numeric()))

str(cloud.seeding)
cloud.seeding
cloud.seeding$season

cloud.seeding <- as.data.frame(cloud.seeding)
cloud.seeding

summary(cloud.seeding[4:8])
colMeans(subset(cloud.seeding, select=c(te, tw), 
                subset=(seeded=="S" & season=="AUTUMN")))
colMeans(subset(cloud.seeding, select=c(te, tw), 
                subset=(seeded=="U" & season=="AUTUMN")))

url <- "http://www.abrahamlincolnonline.org/lincoln/speeches/gettysburg.htm"
html <- readLines(url)
html[1:5]
pattern <- "<.*?>"
text <- gsub(pattern, "", html)
length(text)
text[1:5]
cat(paste(text, collapse="\n"))

text <- paste(text, collapse=" ")
text <- gsub("[\n\t]", "", text)
text <- trimws(text)
text

pattern <- 
  "</?\\w+((\\s+\\w+(\\s*=\\s*(?:\".*?\"|'.*?'|[^'\">\\s]+))?)+\\s*|\\s*)/?>"

library(RCurl)
url <- "http://www.abrahamlincolnonline.org/lincoln/speeches/gettysburg.htm"
html <- getURL(url)
str(html)
length(html)
cat(html)

#/
library(xml2)
html <- read_html(url)
html <- as(html, "character")
html
html <- readLines(url)
html
#/

library(XML)
html.parsed <- htmlParse(html) #/ html.parsed <- htmlParse(url)
str(html.parsed)
html.parsed

html.node <- xpathSApply(doc=html.parsed, path="//p")
str(html.node)
html.node

html.node[[2]]

text <- xmlValue(html.node[[2]])
str(text)
text
cat(text)

text <- sapply(html.node, xmlValue)
str(text)
text[2]
text[4]
cat(paste(text, collapse="\n"))

text <- xpathSApply(html.parsed, path="//p", fun=xmlValue)

text <- xpathSApply(html.parsed, path="//text()", fun=xmlValue)
text[1:10]
cat(paste(text, collapse=" "))

text <- paste(text, collapse=" ")
text <- gsub("[\n\t]", "", text)
text <- trimws(text)
text

library(httr)
library(XML)
url <- "https://www.nationmaster.com/country-info/stats/Cost-of-living/Average-monthly-disposable-salary/After-tax"
html <- GET(url)
html.parsed <- htmlParse(html)
html.tab <- readHTMLTable(doc=html.parsed)

str(html.tab)
head(html.tab[[1]])
salary <- html.tab[[1]]
str(salary)

salary <- readHTMLTable(doc=html.parsed, which=1)
str(salary)

salary <- salary[,-5]
salary$AMOUNT <- sapply(salary[,3], function(x) gsub(",", "", as.character(x)))
salary$AMOUNT <- as.numeric(substring(salary$AMOUNT, 2))
str(salary)
head(salary)

summary(salary$AMOUNT)

library(quantmod)
ibm <- getSymbols(Symbols="IBM", from="2021-01-01", to="2021-12-31", 
                  auto.assign=FALSE)
head(ibm, 3)
tail(ibm, 3)

packageVersion("quantmod")
options(getSymbols.auto.assign=FALSE)

library(WDI)
WDIsearch("unemployment")
tail(WDIsearch("unemployment"), 3)

WDIsearch("Unemployment, Total")
WDIsearch("gdp.*capita.*current.*\\$")

WDI(country="KR", indicator=c("NY.GDP.PCAP.CD", "SL.UEM.TOTL.ZS"), 
    start=2011, end=2020)

library(wbstats)
wb_search("Unemployment, Total")
wb_search("gdp.*capita.*current.*\\$")

wb_data(country="KR", indicator=c("NY.GDP.PCAP.CD", "SL.UEM.TOTL.ZS"), 
        start_date=2011, end_date=2020)

wb_data(country="KR", indicator=c("NY.GDP.PCAP.CD", "SL.UEM.TOTL.ZS"), mrv=10)

wb_data(country="KR", indicator=c("NY.GDP.PCAP.CD", "SL.UEM.TOTL.ZS"), 
        start_date=2011, end_date=2020, return_wide=FALSE)

wb.data <- wb_data(country=c("KR", "JP", "EU", "US"), indicator="NY.GDP.PCAP.CD", 
                   start_date=1981, end_date=2020)
wb.data
print(wb.data, n=Inf)

# [그림 7-5]
library(ggplot2)
library(scales)
windows(width=9.0, height=5.5)
ggplot(wb.data, aes(x=date, y=NY.GDP.PCAP.CD, color=country)) + 
  geom_line(size=1.5) +
  scale_y_continuous(labels=comma) +
  labs(x="", y="US Dollars", title="GDP per Capita") +
  theme(plot.title=element_text(face="bold"),
        legend.position=c(0.1, 0.85), 
        legend.title=element_blank())

##############
## 7.2 출력 ##
##############

## 화면

pi
sqrt(3)

print(pi)
print(sqrt(3))

print(matrix(c(1,2,3,4), ncol=2))
print(list("Batman", "Spiderman", "Ironman"))

print(1, 3, 5)

cat(1, 3, 5, "\n")

name <- "Jenny"	
cat("Hello", name, "\b,\n", "Isn\'t it", "\t", "A LOVELY DAY?\n")

prime <- c(2,3,5,7,11,13,17,19)
cat("The prime numbers are:", prime, "...\n")
hero <- list("Batman", "Spiderman", "Ironman")
cat(hero)
cat(unlist(hero), "\n")

pi
pi*100
pi/100

print(pi, digits=3)
print(pi*100, digits=3)

cat(pi, "\n")
cat(format(pi, digits=3), "\n")

pnorm(-3:3)
print(pnorm(-3:3), digits=3)

z <- c(0, 1.64, 1.96, 2.58)
ptbl <- data.frame(Z=z, Lower=pnorm(-z), Upper=pnorm(z))
ptbl
print(ptbl, digits=3)

## 파일

prime <- c(2,3,5,7,11,13,17,19)
cat(prime, file="prime.txt", sep="\t", "\n")
library(pander)
openFileInOS("prime.txt")

id <- c("A001", "A002", "A003")
name <- c("Mouse", "Keyboard", "USB")
price <- c(30000, 90000, 50000)
cat(id, file="product-cat.txt", sep="\t", "\n")
cat(name, file="product-cat.txt", sep="\t", append=TRUE, "\n")
cat(price, file="product-cat.txt", sep="\t", append=TRUE, "\n")
openFileInOS("product-cat.txt")

con <- file("product-cat.txt", open="w")
cat(id, file=con, sep="\t", "\n")
cat(name, file=con, sep="\t", "\n")
cat(price, file=con, sep="\t", "\n")
close(con)
openFileInOS("product-cat.txt")

fah <- readline("Fahrenheit? ")
fah <- as.numeric(fah)
print(paste("Fahrenheit = ", fah))
cel <- (fah-32)/1.8
print(paste("Celsius =", cel))

sink("FahToCel-output.txt")
source("FahToCel.R")
sink()
openFileInOS("FahToCel-output.txt")

Orange
write.csv(x=Orange, file="orange.csv", row.names=FALSE)
openFileInOS("orange.csv")

write.csv(Orange, "orange2.csv")
openFileInOS("orange2.csv")

write.table(x=Orange, file="orange.txt", sep=";", row.names=FALSE)
openFileInOS("orange.txt")

z <- c(0, 1.64, 1.96, 2.58)
ptbl <- data.frame(Z=z, Lower=pnorm(-z), Upper=pnorm(z))
ls()
save(ptbl, file="ptbl.rda")
rm(ptbl)
ls()
load("ptbl.rda")
ls()

save(ptbl, file="ptbl.txt", ascii=TRUE)
dput(ptbl, file="ptbl.txt")
dump("ptbl", file="ptbl.txt")
library(pander)
openFileInOS("ptbl.txt")

# readr 패키지
library(readr)
Orange
write_csv(x=Orange, file="orange.csv")
read_csv("orange.csv")

write_delim(x=Orange, file="orange.txt", delim=";")
read_delim("orange.txt", delim=";")

write_lines(x=Orange$circumference, file="circumference.txt")
read_lines("circumference.txt")
openFileInOS("circumference.txt")

## 클립보드

names(Orange)
writeClipboard(names(Orange))

head(Orange)
write.table(head(Orange), file="clipboard", sep="\t", row.names=FALSE)

## 파일 탐색

list.files()
list.files(all.files=TRUE)

list.files(pattern="*.txt")
list.files(path="D:/R")

list.dirs()

file.create("temp.txt")
file.exists("temp.txt")
file.remove("temp.txt")
file.exists("temp.txt")

library(pander)
openFileInOS("orange.csv")

######################
## 7.3 데이터베이스 ##
######################

## RODBC 패키지

install.packages("RODBC")
library(RODBC)

library(RODBC)
mlbdb <- odbcConnect(dsn="MLB")

class(mlbdb)

odbcGetInfo(channel=mlbdb)

sqlTables(channel=mlbdb)

sqlColumns(channel=mlbdb, sqtable="Salaries")

salaries <- sqlFetch(channel=mlbdb, sqtable="Salaries")
str(salaries)
head(salaries)

salaries <- sqlFetch(mlbdb, "Salaries")
subset(salaries,
       select=c("yearID", "teamID", "playerID", "salary"),
       subset=(salaries$salary >= 30000000))

sqlQuery(channel=mlbdb, 
         query="SELECT yearID, teamID, playerID, salary 
                FROM Salaries WHERE salary >= 30000000")

sqlQuery(mlbdb, "SELECT yearID, teamID, playerID, salary 
                 FROM Salaries WHERE salary >= 20000000", max=10)
sqlGetResults(mlbdb)

odbcClose(channel=mlbdb)

odbcCloseAll()

head(USArrests)

library(RODBC)
arrestdb <- odbcConnect(dsn="Arrest")

sqlTables(channel=arrestdb)
sqlDrop(channel=arrestdb, sqtable="Crime")

sqlSave(channel=arrestdb, dat=USArrests, tablename="Crime", 
        rownames="State", addPK=TRUE)

sqlFetch(arrestdb, "Crime")
odbcClose(channel=arrestdb)

## DBI 패키지

install.packages("RSQLite")
library(RSQLite)

drv <- dbDriver("SQLite")
class(drv)

mlbdb <- dbConnect(drv=drv, dbname="MLB.db")

mlbdb <- dbConnect(SQLite(), dbname="MLB.db")

dbListTables(conn=mlbdb)

dbListFields(conn=mlbdb, name="Salaries")

dbGetQuery(conn=mlbdb,
           statement="SELECT yearID, teamID, playerID, salary 
                      FROM Salaries WHERE salary >= 30000000")

res <- dbSendQuery(mlbdb,
                   "SELECT yearID, teamID, playerID, salary FROM Salaries")
fetch(res, n=5)

dbClearResult(res)
fetch(res)

salaries.read <- dbReadTable(conn=mlbdb, name="Salaries")
dim(salaries.read)
head(salaries.read, 3)
salaries.sql <- dbGetQuery(conn=mlbdb, statement="SELECT * FROM Salaries")
dim(salaries.sql)
head(salaries.sql, 3)

dbDisconnect(mlbdb)
dbUnloadDriver(drv)

head(iris)

library(RSQLite)
irisdb <- dbConnect(SQLite(), "iris.db")
list.files(pattern="iris.db")

dbListTables(conn=irisdb)
dbExistsTable(conn=irisdb, name="iristable")
dbRemoveTable(conn=irisdb, name="iristable")

dbWriteTable(conn=irisdb, name="iristable", value=iris)

dbReadTable(conn=irisdb, name="iristable")
dbDisconnect(irisdb)

##############
## 연습문제 ##
##############

# 7-1
k1 <- c(21.0, 18.2)
k2 <- c(14.8, 14.7, 14.0, 13.8)
k3 <- c(10.9, 10.6, 10.5)
k4 <- c(9.7, 9.2)

KPL <- c(k1, k2, k3, k4)
model <- c(rep("A", 2), rep("B", 4), rep("C", 3), rep("D", 2))
KPL
model

mileage <- data.frame(KPL, model)
mileage
mean(mileage$KPL)

# 7-2
print(pi, digits=20)
format(pi, digits=20)

# 7-3
url <- "http://www.statsci.org/data/general/cherry.txt"
cherry <- read.table(url, header=TRUE)
str(cherry)

head(cherry)
mean(cherry$Height)

# 7-4
url <- "http://www.statsci.org/data/general/flicker.txt"
flicker <- read.table(url, header=TRUE)
str(flicker)

head(flicker, 3); tail(flicker, 3)
mean(subset(flicker, subset=(Colour=="Brown"))$Flicker)

# 7-5
url <- "http://www.itl.nist.gov/div898/strd/univ/data/PiDigits.dat"
pidigits <- read.table(url, skip=60)
str(pidigits)

head(pidigits)
table(pidigits)
length(pidigits$V1)
table(pidigits)/5000

# 7-6
url <- "http://www.amstat.org/publications/jse/datasets/draft70mn.dat.txt"
draft70 <- read.fwf(url, widths=c(-1, rep(c(-1,3), 12)), n=31)
str(draft70)

head(draft70)
names(draft70) <- month.abb
draft70$day <- 1:31
head(draft70, 3); tail(draft70, 3)

draft70$Feb[29]
median(draft70$Jan, na.rm=TRUE)
median(draft70$Dec, na.rm=TRUE)

# 7-7
# 경로: https://airkorea.or.kr/web, 통계정보 > 최종확정 측정자료 조회 > 확정자료 다운로드
# https://airkorea.or.kr/web/last_amb_hour_data?pMENU_NO=123
library(readxl)
airqual <- read_excel(path="확정자료엑셀다운.xls", 
                      col_types=c(rep("text", 3), rep("numeric", 7)), sheet=1)

str(airqual)
colMeans(subset(airqual, subset=(측정소명=="성북구"))["PM2.5"], na.rm=TRUE)
colMeans(subset(airqual, subset=(측정소명=="종로구"))["PM2.5"], na.rm=TRUE)

# 7-8
library(httr)
url <- "https://www.ssa.gov/oact/babynames/"
html.obj <- GET(url)
html <- content(html.obj, type="text")

html <- readLines(url)

name <- unlist(regmatches(x=html, m=gregexpr(pattern="<td>[A-z]+</td>", text=html)))
name <- gsub(pattern="<.*?>", replacement="", x=name)
name
namebook <- data.frame(Rank=1:10, Male_name=name[seq(1, 20, by=2)], 
                       Female_name=name[seq(2, 20, by=2)])
namebook

library(stringr)
name <- unlist(str_extract_all(string=html, pattern="<td>[A-z]+</td>"))
name <- str_replace_all(string=name, pattern="<.*?>", "")
name
namebook <- data.frame(Rank=1:10, Male_name=name[seq(1, 20, by=2)], 
                       Female_name=name[seq(2, 20, by=2)])
namebook

# 7-9
library(httr)
url <- "https://www.loc.gov/rr/print/list/057_chron.html"
html <- GET(url)

library(XML)
html.parsed <- htmlParse(html)

html.tab <- readHTMLTable(html.parsed)
str(html.tab)

presidents <- html.tab[[4]]
str(presidents)
head(presidents, 2); tail(presidents, 2)

years <- strsplit(presidents$YEAR, split="-")
years <- do.call(rbind, years)
years <- as.data.frame(years)
str(years)

names(years) <- c("START", "END")
years$START <- as.numeric(years$START)
years$END <- as.numeric(years$END)

presidents <- cbind(presidents[c("YEAR", "PRESIDENT")], years)
head(presidents)

subset(presidents, select=c(YEAR, PRESIDENT), subset=(END - START) == max(END - START))

# 7-10
library(httr)
url <- "https://en.wikipedia.org/wiki/Heights_of_presidents_and_presidential_candidates_of_the_United_States"
html <- GET(url)

library(XML)
html.parsed <- htmlParse(html)

html.tab <- readHTMLTable(html.parsed, header=TRUE)
str(html.tab)

presidents.heights <- html.tab[[5]]
str(presidents.heights)

presidents.heights$V1 <- substr(presidents.heights$V1, 1, 4)
presidents.heights <- 
  presidents.heights[presidents.heights$V1 >= 1948 
                     & presidents.heights$V1 <= presidents.heights$V1[1],
                     c(1,4,7)]
names(presidents.heights) <- c("election.year", "winner", "opponent")
library(readr)
presidents.heights$winner <- parse_number(presidents.heights$winner)
presidents.heights$opponent <- parse_number(presidents.heights$opponent)
presidents.heights$difference <- 
  presidents.heights$winner - presidents.heights$opponent

str(presidents.heights)
presidents.heights

mean(presidents.heights$winner)
mean(presidents.heights$opponent)
mean(presidents.heights$difference)

sum(presidents.heights$winner > presidents.heights$opponent)
mean(presidents.heights$winner > presidents.heights$opponent)
