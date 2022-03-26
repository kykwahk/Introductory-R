
#############################
##   R 기초와 활용(2판)    ##
## (곽기영, 도서출판 청람) ## 
#############################

###################
## 제10장 그래픽 ##
###################

######################
## 10.1 그래픽 개요 ##
######################

str(faithful)

# [그림 10-1]
windows(width=7.0, height=5.5)
plot(faithful)

eruptions.long <- with(faithful, faithful[eruptions > 3,])

# [그림 10-2]
windows(width=7.0, height=5.5)
plot(faithful)
points(eruptions.long, col="red", pch=19)

dev.off()
points(eruptions.long, col="red", pch=19)

faithful.lm <- lm(waiting ~ eruptions, data=faithful)

# [그림 10-3]
windows(width=7.0, height=5.5)
plot(faithful)
points(eruptions.long, col="red", pch=19)
lines(x=faithful$eruptions, y=fitted(faithful.lm), col="blue")

abline(v=3, col="purple")
abline(h=mean(faithful$waiting), col="green")

abline(a=coef(faithful.lm)[1], b=coef(faithful.lm)[2], col="blue")
abline(faithful.lm, col="blue")

##############################
## 10.2 그래프 생성 및 저장 ##
##############################

str(cars)

# [그림 10-4]
windows(width=7.0, height=5.5)
plot(cars$speed, cars$dist)

plot(cars)

str(ToothGrowth)

# [그림 10-5]
windows(width=7.0, height=5.5)
plot(ToothGrowth$supp, ToothGrowth$len)

str(iris)

# [그림 10-6]
windows(width=7.0, height=5.5)
plot(iris[1:4])

str(nhtemp)

# [그림 10-7]
windows(width=7.0, height=5.5)
plot(nhtemp)

str(UCBAdmissions)

# [그림 10-8]
windows(width=7.0, height=5.5)
plot(UCBAdmissions)

str(faithful)

# [그림 10-9]
windows(width=7.0, height=5.5)
old.par <- par(mfrow=c(2,2))
faithful.lm <- lm(waiting ~ eruptions, data=faithful)
class(faithful.lm)
plot(faithful.lm)
par(old.par)

windows(width=7.0, height=5.5)
plot(faithful)
savePlot(filename="myplot.pdf", type="pdf")

library(pander)
openFileInOS("myplot.pdf")

?Devices

png("myplot.png", width=648, height=432)
plot(faithful)
dev.off()

openFileInOS("myplot.png")

###############################
## 10.3 그래프 패러미터 설정 ##
###############################

## 제목과 축

# [그림 10-10]
windows(width=7.0, height=5.5)
plot(faithful,
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time (minutes)",
     ylab="Waiting time to next eruption (minutes)")

# [그림 10-11]
windows(width=7.0, height=5.5)
old.par <- par(mfrow=c(2,2))
plot(faithful, las=0, main="las=0")
plot(faithful, las=1, main="las=1")
plot(faithful, las=2, main="las=2")
plot(faithful, las=3, main="las=3")
par(old.par)

plot(faithful, bty="]")

# [그림 10-12]
windows(width=7.0, height=5.5)
old.par <- par(mfrow=c(2,2))
plot(faithful, bty="o", main='bty="o"')
plot(faithful, bty="n", main='bty="n"')
plot(faithful, bty="l", main='bty="l"')
plot(faithful, bty="]", main='bty="]"')
par(old.par)

plot(faithful, bty="7", main='bty="7"')
plot(faithful, bty="c", main='bty="c"')
plot(faithful, bty="u", main='bty="u"')

## 심볼과 선 

# [그림 10-13]
windows(width=6.5, height=9.0)
old.par <- par(mfrow=c(3,2))
plot(faithful, pch=3, main='pch=3')
plot(faithful, pch=8, main='pch=8')
plot(faithful, pch=19, col="green3", main='pch=19, col="green3"')
plot(faithful, pch=21, main='pch=21')
plot(faithful, pch=22, col="red", main='pch=22, col="red"')
plot(faithful, pch=24, col="red", bg="blue", main='pch=24, col="red", bg="blue"')
par(old.par)

?points

windows(width=7.0, height=5.5)
plot(LakeHuron)
plot(LakeHuron, lty="solid")

# [그림 10-14]
windows(width=6.5, height=9.0)
old.par <- par(mfrow=c(3,2))
plot(LakeHuron, lty="solid", main='lty="solid" or 1')
plot(LakeHuron, lty="dashed", main='lty="dashed" or 2')
plot(LakeHuron, lty="dotted", main='lty="dotted" or 3')
plot(LakeHuron, lty="dotdash", main='lty="dotdash" or 4')
plot(LakeHuron, lty="longdash", main='lty="longdash" or 5')
plot(LakeHuron, lty="twodash", main='lty="twodash" or 6')
par(old.par)

## 그래프 유형

plot(pressure)

# [그림 10-15]
windows(width=7.0, height=4.0)
old.par <- par(mfrow=c(1,2))
plot(pressure, type="p", main='Scatterplot (type="p")')
plot(pressure, type="l", main='Line plot (type="l")')
par(old.par)

# [그림 10-16]
windows(width=7.0, height=5.5)
old.par <- par(mfrow=c(2,2))
plot(pressure, type="b", main='type="b"')
plot(pressure, type="o", main='type="o"')
plot(pressure, type="h", main='type="h"')
plot(pressure, type="s", main='type="s"')
par(old.par)

plot(pressure, type="S", main='type="S"')

# [그림 10-17]
windows(width=7.0, height=5.5)
x <- 1:10
y1 <- exp(1:10)
y2 <- exp(10:1)
plot(x, y1, xlab="x", ylab="y", type="n")
lines(x, y1, type="o", pch=21, col="red")
lines(x, y2, type="o", pch=22, col="blue")

# [그림 10-18]
windows(width=7.0, height=5.5)
plot(faithful, type="n")
grid()
points(faithful, pch=19, col="blue")

plot(faithful, pch=19, col="blue")
grid()

## 색상

length(colors())
head(colors(), 10)
grep("purple", colors(), value=TRUE)

palette()
palette(rainbow(6))
palette()
palette("default")

#/
palette()
palette("R3") # R version 3
palette()
palette("default")
palette()
#/

# [그림 10-19]
windows(width=7.0, height=5.5)
n <- 12
pie(rep(1,n), col=1:n)

# [그림 10-20]
windows(width=6.5, height=9.0)
old.par <- par(mfrow=c(3,2), mar=c(1,1,1,1))
n <- 12
pie(rep(1,n), col=rainbow(n), main="rainbow")
pie(rep(1,n), col=heat.colors(n), main="heat.colors")
pie(rep(1,n), col=terrain.colors(n), main="terrain.colors")
pie(rep(1,n), col=topo.colors(n), main="topo.colors")
pie(rep(1,n), col=cm.colors(n), main="cm.colors")
pie(rep(1,n), col=gray(level=seq(0, 1, length=n)), main="gray")
par(old.par)

# [그림 10-21]
windows(width=6.5, height=3.5)
old.par <- par(mfrow=c(1,2), mar=c(1,1,1,1))
n <- 12
pie(rep(1,n), col=rainbow(n, alpha=seq(0, 1, length=n)), 
    main="rainbow with alpha channel", cex.main=0.8)
pie(rep(1,n), col=gray(level=seq(0, 1, length=n), alpha=seq(0, 1, length=n)), 
    main="gray with alpha channel", cex.main=0.8)
par(old.par)

install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()
display.brewer.pal(3, "Dark2")
display.brewer.pal(9, "Blues")

# [그림 10-22]
windows(width=6.5, height=9.0)
old.par <- par(mfrow=c(3,2), mar=c(1,1,1,1))
n <- 9
pie(rep(1,n), col=brewer.pal(n, "Blues"), main="Blues")
pie(rep(1,n), col=brewer.pal(n, "Greens"), main="Greens")
pie(rep(1,n), col=brewer.pal(n, "BuGn"), main="BuGn")
pie(rep(1,n), col=brewer.pal(n, "GnBu"), main="GnBu")
pie(rep(1,n), col=brewer.pal(n, "Purples"), main="Purples")
pie(rep(1,n), col=brewer.pal(n, "Reds"), main="Reds")
par(old.par)

# [그림 10-23]
windows(width=7.0, height=5.5)
plot(faithful, pch=19, col="tomato",
     main="Old Faithful Geyser", 
     sub="Yellowstone National Park",
     xlab="Eruption time (minutes)",
     ylab="Waiting time to next eruption (minutes)",
     col.main="navy", col.sub="purple", col.lab="royalblue", col.axis="brown")

## 크기

# [그림 10-24]
windows(width=7.0, height=5.5)
old.par <- par(mfrow=c(2,1))
x <- seq(0.5, 1.5, 0.25)
y <- rep(1, length(x))
plot(x, y, pch=19, cex=x, main="Effects of cex on symbol and text size")
text(x, y+0.2, labels=x, cex=x)
plot(x, y, pch=19, cex=x, main="Effects of cex on symbol and text size",
     cex.main=1.5, cex.lab=1.0, cex.axis=0.75)
par(old.par)

# [그림 10-25]
windows(width=7.0, height=7.0)
old.par <- par(mfrow=c(2,1))
plot(LakeHuron, lwd=1, main="lwd=1")
plot(LakeHuron, lwd=2, main="lwd=2")
par(old.par)

## 글꼴과 글씨체

windowsFonts()

windowsFonts(A=windowsFont("Arial Black"),
             B=windowsFont("Book Antiqua"),
             C=windowsFont("Calisto MT"))

plot(faithful, pch=19, col="tomato",
     main="Old Faithful Geyser", 
     xlab="Eruption time (minutes)",
     ylab="Waiting time to next eruption (minutes)",
     family="C")

names(pdfFonts()) 
pdf(file="myplot.pdf", family="Courier")
plot(faithful, pch=19, col="tomato",
     main="Old Faithful Geyser", 
     xlab="Eruption time (minutes)",
     ylab="Waiting time to next eruption (minutes)")
dev.off()

openFileInOS("myplot.pdf")

names(postscriptFonts()) 
postscript(file="myplot.ps", family="Courier")
plot(faithful, pch=19, col="tomato",
     main="Old Faithful Geyser", 
     xlab="Eruption time (minutes)",
     ylab="Waiting time to next eruption (minutes)")
dev.off()

openFileInOS("myplot.ps")

# [그림 10-26]
windows(width=7.0, height=5.5)
plot(faithful, pch=19, col="cornflowerblue",
     main="Old Faithful Geyser", 
     sub="Yellowstone National Park",
     xlab="Eruption time (minutes)",
     ylab="Waiting time to next eruption (minutes)",
     family="serif",
     font.main=4, font.sub=1, font.lab=3, font.axis=2)

## 그래프 패러미터의 글로벌 설정

par("lty")
par("bg")
par("lwd")

par(lwd=2)
par("lwd")

dev.off()
par("lwd")

par()
?par

######################
## 10.4 그래프 배치 ##
######################

dev.set()

windows()
win.graph()
windows(width=7.0, height=5.5)

par(mai=c(1,0.5,1,0.2))
par("mai")
par(mar=c(5,4,4,2) + 0.2)
par("mar")
par(mar=c(5,4,4,2) + 0.1)

x1 <- 1:10
y1 <- log(x1)
x2 <- 1:10
y2 <- sqrt(x2)

# [그림 10-27]
windows(width=7.0, height=4.5)
old.par <- par(mfrow=c(1,2))
plot(x1, y1, type="l", col="red", xlab="X", ylab="Y", main="Bad")
lines(x2, y2, lty="dashed", col="blue")

range(y1)
range(y2)

xlim <- range(c(x1, x2))
ylim <- range(c(y1, y2))
plot(x1, y1, xlim=xlim, ylim=ylim,
     type="l", col="red", xlab="X", ylab="Y", main="Good")
lines(x2, y2, lty="dashed", col="blue")
par(old.par)

# [그림 10-28]
windows(width=7.0, height=5.5)
old.par <- par(mfrow=c(2,2))

plot(faithful, main="First: Old Faithful Geyser", col="blue", pch=19)
plot(pressure, main="Second: Temperature vs. Pressure", type="l", col="red")
plot(LakeHuron, main="Third: Lake Huron", col="green", lwd=2)
plot(ToothGrowth$supp, ToothGrowth$len, 
     main="Fourth: Tooth Growth of Guinea Pig", col="orange")
par(old.par)

par(mfrow=c(1,1))
par("mfrow")
old.par <- par(mfrow=c(2,2))
par("mfrow")
old.par
plot(faithful, main="First: Old Faithful Geyser", col="blue", pch=19)
plot(pressure, main="Second: Temperature vs. Pressure", type="l", col="red")
plot(LakeHuron, main="Third: Lake Huron", col="green", lwd=2)
plot(ToothGrowth$supp, ToothGrowth$len, 
     main="Fourth: Tooth Growth of Guinea Pig", col="orange")
par(old.par)
par("mfrow")
plot(faithful, main="First: Old Faithful Geyser", col="blue", pch=19)

# [그림 10-29]
windows(width=7.0, height=5.5)
old.par <- par(no.readonly=TRUE)
layout(matrix(c(1,1,4,2,3,4), 2, 3, byrow = TRUE))
matrix(c(1,1,4,2,3,4), 2, 3, byrow = TRUE)
plot(faithful, main="First: Old Faithful Geyser", col="blue", pch=19)
plot(pressure, main="Second:\nTemperature vs. Pressure", type="l", col="red")
plot(LakeHuron, main="Third: Lake Huron", col="green", lwd=2)
plot(ToothGrowth$supp, ToothGrowth$len, 
     main="Fourth:\nTooth Growth of Guinea Pig", col="orange")
layout.show(4)
par(old.par)

# [그림 10-30]
windows(width=7.0, height=5.5)
old.par <- par(no.readonly=TRUE)
layout(matrix(c(1,1,4,2,3,4), 2, 3, byrow = TRUE),
       widths=c(1,1,1.5), heights=c(2,1))
plot(faithful, main="First: Old Faithful Geyser", col="blue", pch=19)
plot(pressure, main="Second:\nTemperature vs. Pressure", type="l", col="red")
plot(LakeHuron, main="Third: Lake Huron", col="green", lwd=2)
plot(ToothGrowth$supp, ToothGrowth$len, 
     main="Fourth: Tooth Growth of Guinea Pig", col="orange")
par(old.par)

###########################
## 10.5 그래프 요소 추가 ##
###########################

# [그림 10-31]
windows(width=7.0, height=5.5)
plot(faithful, 
     main="Old Faithful Geyser", 
     sub="Yellowstone National Park",
     xlab="Eruption time (minutes)",
     ylab="Waiting time to next eruption (minutes)",
     xlim=c(1, 6), ylim=c(40, 100),
     las=1, bty="l", col="maroon", pch=19,
     family="serif",
     font.main=4, font.lab=3, font.axis=2,
     cex.main=1.5, cex.lab=1.0, cex.axis=0.75,
     col.main="tomato", col.sub="orange", col.lab="firebrick", col.axis="khaki4")

## 제목과 축

# [그림 10-32]
states <- data.frame(state.x77)
attach(states)
windows(width=7.0, height=5.5)
old.par <- par(no.readonly=TRUE)
par(mar=c(5,4,4,8) + 0.2)

plot(Murder, Life.Exp, pch=20, col="tomato", ylim=c(35,75), 
     yaxt="n", col.axis="darkorchid4", cex.axis=0.75, ann=FALSE)
points(Murder, HS.Grad, pch=22, col="blue", bg="skyblue")

axis(side=2, at=seq(68, 76, 2), labels=seq(68,76, 2), 
     col.axis="red", cex.axis=0.75, las=2)
axis(side=4, at=seq(35, 70, 5), labels=seq(35, 70, 5), 
     col.axis="blue", cex.axis=0.75, las=2, tck=-0.02)

mtext(text="High School\nGraduates\n(percent)", 
      side=4, line=3, cex=0.9, las=2, col="tan4")

title(main="Murder vs. Life Expectancy vs. High School Graduates",
      xlab="Murder (rate per 100,000 population)",
      ylab="Life Expectancy (years)",
      col.main="maroon", col.lab="tan4", cex.lab=0.9)
detach(states)
par(old.par)

## 범례

# [그림 10-33]
windows(width=7.0, height=5.5)
head(Orange)
tree1 <- subset(Orange, Tree==1)
tree2 <- subset(Orange, Tree==2)
xlim <- range(c(tree1$age, tree2$age))
ylim <- range(c(tree1$circumference, tree2$circumference))
plot(tree1$age, tree1$circumference, type="b", xlim=xlim, ylim=ylim,
     pch=16, lty=1, col="red",
     main="Growth of Orange Tree",
     xlab="Age (days)", ylab="Circumference (mm)")
lines(tree2$age, tree2$circumference, type="b",
      pch=15, lty=2, col="blue")

legend("topleft", inset=0.05, title="Tree ID", legend=c("Tree 1", "Tree 2"),
       lty=c(1, 2), pch=c(16, 15), col=c("red", "blue"))

install.packages("Hmisc")
library(Hmisc)
minor.tick(nx=3, ny=3, tick.ratio=0.5)

## 텍스트

# [그림 10-34]
windows(width=7.0, height=5.5)
plot(1:5, 1:5, type="n", xaxt="n", yaxt="n", las=1, ann=FALSE)
text(2,2, font=1, col="red", cex=1.0, 
     labels="Default text: Sans text with plain (font=1)")
text(3,3, font=2, col="darkgreen", cex=1.2, family="mono", 
     labels="Mono text with bold (font=2)")
text(4,4, font=3, col="blue", cex=1.4, family="serif", 
     labels="Serif text with italic (font=3)")
text(2,4, font=2, col="magenta", cex=1.4, family="HersheyScript", 
     labels="HersheyScript text (srt=25)", srt=25)
mtext(text="Windows Fonts: Sans, Mono, Serif, and HersheyScript", 
      side=1, line=1, col="deeppink")

# [그림 10-35]
windows(width=7.0, height=5.5)
attach(mtcars)
plot(wt, mpg, pch=19, col="royalblue",
     main="Car Mileage vs. Car Weight",
     xlab="Weight (1,000 lbs)", ylab="Mileage (Miles per Gallon)")
text(wt, mpg, row.names(mtcars), cex=0.6, pos=4, col="maroon")
detach(mtcars)

######################
## 10.6 그래픽 함수 ##
######################

## 원도표

# [그림 10-36]
windows(width=7.0, height=3.5)
old.par <- par(mfrow=c(1,2), mar=c(1,2,2,2))
slice <- c(325, 285, 706, 885)
lbl <- c("1st Class", "2nd Class", "3rd Class", "Crew")
pie(slice, labels=lbl, main="Pie Chart from Vector")

str(Titanic)
class <- margin.table(x=Titanic, margin=1)
class
pie(class, main="Pie Chart from Table")
par(old.par)

# [그림 10-37]
windows(width=7.0, height=3.5)
old.par <- par(mfrow=c(1,2), mar=c(1,2,2,2))
lbl <- paste(names(class), ": ", class, sep="")
pie(class, labels=lbl, main="Pie Chart with Sample Sizes")

class.pct <- round(class/sum(class)*100)
class.pct
lbl <- paste(names(class), "\n ", class.pct, "%", sep="")
pie(class.pct, labels=lbl, col=rainbow(length(class.pct)),
    main="Pie Chart with Percentages")
par(old.par)

# [그림 10-38]
install.packages("plotrix")
library(plotrix)
windows(width=7.0, height=5.5)
class <- margin.table(x=Titanic, margin=1)
fan.plot(class, labels=names(class), main="Fan Plot of Titanic Passengers")

## 막대도표

# [그림 10-39]
windows(width=8.5, height=5.0)
old.par <- par(mfrow=c(1,2))
class <- margin.table(Titanic, 1)
class
barplot(class, main="Simple Bar Chart")

barplot(class, horiz=TRUE, 
        xlab="Number of Passengers", ylab="Class",
        main="Horizontal Bar Chart")
par(old.par)

# [그림 10-40]
windows(width=8.5, height=5.0)
old.par <- par(mfrow=c(1,2))
survival.by.class <- margin.table(Titanic, c(4,1))
survival.by.class
barplot(survival.by.class, main="Stacked Bar Chart")

barplot(survival.by.class, ylim=c(0, 1000), beside=TRUE, 
        col=c("red", "green"), legend=TRUE,
        ylab="Survivors", las=1, cex.names=0.75,
        names.arg=c("1st Class", "2nd Class", "3rd Class", "Crew"),
        main="Grouped Bar Chart")
par(old.par)

# [그림 10-41]
windows(width=7.0, height=5.5)
barplot(survival.by.class, ylim=c(0, 1000), beside=TRUE, 
        col=c("coral", "khaki4"),
        ylab="Survivors", las=1, cex.names=0.8,
        names.arg=c("1st Class", "2nd Class", "3rd Class", "Crew"),
        main="Grouped Bar Chart with Customized Legend")
legend(x=1, y=900, legend=c("Dead", "Alive"), 
       fill=c("coral", "khaki4"), title="Status")

# [그림 10-42]
windows(width=7.0, height=5.5)
survival.by.class <- margin.table(Titanic, c(4,1))
survival.prop <- prop.table(x=survival.by.class, margin=2)
survival.prop

barplot(survival.prop, col=c("maroon", "skyblue"), 
        xlab="Class", ylab="Ratio of Survivors", las=1,
        main="Survivors by Class (Ratio)")

# [그림 10-43]
install.packages("vcd")
library(vcd)
windows(width=7.0, height=5.5)
survival.by.class <- margin.table(Titanic, c(4,1))
t(survival.by.class)
spine(t(survival.by.class), gp=gpar(fill=c("mistyrose", "lightblue")), 
      main="Spine Plot of Survivors by Class")

# [그림 10-44]
windows(width=7.0, height=5.5)
str(chickwts)
heights <- tapply(chickwts$weight, chickwts$feed, mean)
heights

barplot(heights, xlab="Feed Type", ylab="Mean Chicken Weights (g)",
        ylim=c(0, 400), las=1, main="Chicken Weights by Feed Type")

windows(width=7.0, height=5.5)
rel.heights <- (heights - min(heights))/(max(heights) - min(heights))
rank(rel.heights)
colors <- cm.colors(length(rel.heights))[rank(rel.heights)]
barplot(heights, xlab="Mean Chicken Weights (g)", xlim=c(0, 400),
        col=colors, las=1, horiz=TRUE, main="Colors")
par("mar")

# [그림 10-45]
windows(width=7.5, height=9.0)
old.par <- par(mar=c(5, 7, 4, 2), mfrow=c(2,1))

heights <- tapply(chickwts$weight, chickwts$feed, mean)
rel.heights <- (heights - min(heights))/(max(heights) - min(heights))
colors <- cm.colors(length(rel.heights))[rank(rel.heights)]
barplot(heights, xlab="Mean Chicken Weights (g)", xlim=c(0, 400),
        col=colors, las=1, horiz=TRUE, main="Colors")

grays <- gray(1 - rel.heights)
barplot(heights, xlab="Feed Type", ylab="Mean Chicken Weights (g)", ylim=c(0, 400),
        col=grays, las=1, main="Grays")
par(old.par)

# [그림 10-46]
windows(width=7.0, height=7.0)
old.par <- par(mfrow=c(2,2))
str(UCBAdmissions)
admission.by.dept <- margin.table(UCBAdmissions, c(1, 3))
admission.by.dept

barplot(admission.by.dept, density=15, angle=135, main="density=15 / angle=135")
barplot(admission.by.dept, border="red", col=c("lightblue", "mistyrose"),
        main='border="red"')
barplot(admission.by.dept, beside=TRUE, space=c(0.3, 2.0), main="space=c(0.3, 2.0)")
barplot(admission.by.dept, axes=FALSE, main="axes=FALSE")
par(old.par)

## 히스토그램

# [그림 10-47]
windows(width=7.0, height=7.0)
old.par <- par(mfrow=c(2,2))

hist(iris$Sepal.Width, main="Histogram of iris$Sepal.Width")

hist(iris$Sepal.Width, breaks=seq(2.0, 4.4, 0.2), labels=TRUE, 
     density=20, angle=135, col="dimgray", xlim=c(2, 4.5), ylim=c(0, 40),
     xlab="Sepal Width (cm)", main="breaks / labels / density / xlim / ylim")

hist(iris$Sepal.Width, breaks=seq(2.0, 4.4, 0.2), prob=TRUE, 
     col="gold", border="hotpink", xlim=c(2, 4.5), ylim=c(0, 1.5),
     xlab="Sepal Width (cm)", main="rug / density curve")
hist(iris$Sepal.Width, breaks=seq(2.0, 4.4, 0.2), freq=FALSE, 
     col="gold", border="hotpink", xlim=c(2, 4.5), ylim=c(0, 1.5),
     xlab="Sepal Width (cm)", main="rug / density curve")
lines(density(iris$Sepal.Width), col="violet", lwd=2)
rug(quantile(iris$Sepal.Width), col="red", lwd=3)

h <- hist(iris$Sepal.Width, breaks=seq(2.0, 4.4, 0.2),
          col="gold", border="hotpink", xlim=c(2, 4.5), ylim=c(0, 40),
          xlab="Sepal Width (cm)", main="normal curve / box")
s <- iris$Sepal.Width
x <- seq(min(s), max(s), length=40)
y <- dnorm(x, mean=mean(s), sd=sd(s))
y <- y*diff(h$mids[1:2])*length(s)
lines(x, y, col="chocolate", lwd=2)
box()
par(old.par)

#/ 히스토그램 겹쳐 그리기
levels(iris$Species)
h1 <- hist(subset(iris, Species==levels(iris$Species)[1])$Petal.Length)
h2 <- hist(subset(iris, Species==levels(iris$Species)[2])$Petal.Length)
h3 <- hist(subset(iris, Species==levels(iris$Species)[3])$Petal.Length)
range(iris$Petal.Length)
plot(h1, col="lightgreen", xlim=c(0, 7), ylim=c(0, 20), main="Histograms of iris$Petal.Width by Species")
plot(h2, col="aliceblue", xlim=c(0, 7), add=TRUE)
plot(h3, col="mistyrose",, xlim=c(0, 7), add=TRUE)
plot(h1, col="green", xlim=c(0, 7), ylim=c(0, 20), main="Histograms of iris$Petal.Width by Species")
plot(h2, col="red", xlim=c(0, 7), add=TRUE)
plot(h3, col=rgb(0, 0, 1, 0.5), xlim=c(0, 7), add=TRUE)
#/

## 밀도도표

# [그림 10-48]
windows(width=7.0, height=7.0)
old.par <- par(mfrow=c(2,1))
ds <- density(iris$Sepal.Width)
plot(ds)

ds <- density(iris$Sepal.Width)
plot(ds, main="Kernel Density of Sepal Width")
polygon(ds, col="tomato", border="blue")
rug(iris$Sepal.Width, col="brown")
par(old.par)

# [그림 10-49]
library(sm)
windows(width=7.0, height=5.5)
attach(iris)
sm.density.compare(x=Sepal.Width, group=Species, lwd=2, xlab="Sepal Width (cm)")
title(main="Distribution of Sepal Width by Iris Species")
legend("topright", inset=0.05, legend=levels(Species), 
       lty=c(1:length(levels(Species))), col=c(2:(1+length(levels(Species)))))
detach(iris)

## 상자도표

# [그림 10-50]
windows(width=7.0, height=5.5)
boxplot(iris$Sepal.Width,
        ylab="Sepal Width (cm)", main="Sepal Width of Iris")

boxplot.stats(iris$Sepal.Width)

# [그림 10-51]
windows(width=7.0, height=5.5)
boxplot(Sepal.Width ~ Species, data=iris,
        ylab="Sepal Width (cm)", main="Sepal Width by Iris Species")

plot(iris$Species, iris$Sepal.Width)

# [그림 10-52]
windows(width=7.0, height=5.5)
old.par <- par(mar=c(5, 5.5, 4, 2))
boxplot(Sepal.Width ~ Species, data=iris, 
        notch=TRUE, border="royalblue", horizontal=TRUE, las=1,
        col=c("sienna", "plum", "coral"), 
        names=c("setosa", "versicolor", "virginica"),
        xlab="Sepal Width (cm)",
        ylab="",
        main="notch / border / horizontal / las / col / names")
par(old.par)

# [그림 10-53]
windows(width=7.0, height=5.5)
mtcars$cyl.factor <- factor(mtcars$cyl,
                            levels=c(4, 6, 8), labels=c("4", "6", "8"))
mtcars$am.factor <- factor(mtcars$am,
                           levels=c(0, 1), labels=c("Auto", "Manual"))

boxplot(mpg ~ am.factor * cyl.factor, data=mtcars, 
        col=c("salmon", "violet"), las=1,
        varwidth=TRUE, at=c(1, 2, 3.5, 4.5, 6, 7), 
        xlab="Car Type", ylab="Miles per Gallon", 
        main="Car Mileage by Type")

## 바이올린도표

# [그림 10-54]
install.packages("vioplot")
library(vioplot)
windows(width=7.0, height=5.5)
vioplot(mpg ~ cyl, data=mtcars, 
        names=c("4-cylinder", "6-cylinder", "8-cylinder"), 
        col="gold", colMed="magenta", border="red",
        xlab="Number of Cylinders", ylab="Miles per Gallon",
        main="Car Mileage by Cylinder")

c4 <- mtcars$mpg[mtcars$cyl==4]
c6 <- mtcars$mpg[mtcars$cyl==6]
c8 <- mtcars$mpg[mtcars$cyl==8]
vioplot(c4, c6, c8, names=c("4-cylinder", "6-cylinder", "8-cylinder"), 
        col="gold", colMed="magenta", border="red",
        xlab="Number of Cylinders", ylab="Miles per Gallon",
        main="Car Mileage by Cylinder")

# [그림 10-55]
windows(width=7.0, height=5.5)
x <- mtcars$wt
y <- mtcars$mpg
plot(x, y, xlim=c(0,6), ylim=c(0,36), pch=20, col="darkblue", ann=FALSE)
vioplot(x, col="lightsalmon", horizontal=TRUE, at=4, add=TRUE,  wex=6,
        lty=2, rectCol="gray")
vioplot(y, col="lightblue", horizontal=FALSE, at=1, add=TRUE, lty=2, rectCol="gray")
title("Car Mileage vs. Car Weight", 
      xlab="Weight (1000 lbs)", ylab="Miles per Gallon")

## 점도표

# [그림 10-56]
windows(width=7.0, height=5.5)
dotchart(mtcars$mpg, labels=row.names(mtcars), cex=0.7,
         xlab="Miles per Gallon", main="Mileage for Car Models")

# [그림 10-57]
windows(width=7.0, height=5.5)
cars <- mtcars[order(mtcars$mpg),]
cars$cyl.f <- factor(cars$cyl, levels=c(4, 6, 8),
                     labels=c("4 cylinders", "6 cylinders", "8 cylinders"))

cars$colors[cars$cyl.f=="4 cylinders"] <- "maroon"
cars$colors[cars$cyl.f=="6 cylinders"] <- "deepskyblue"
cars$colors[cars$cyl.f=="8 cylinders"] <- "darkgreen"

dotchart(cars$mpg, labels=row.names(cars), cex=0.7,
         groups=cars$cyl.f, gcolor="black",
         color=cars$colors, pch=19,
         xlab="Miles per Gallon", main="Mileage for Car Models\nby Cylinders")

VADeaths

# [그림 10-58]
windows(width=7.0, height=5.5)
old.par <- par(mfrow=c(1,2))
dotchart(VADeaths, cex=0.8, main="Deaths Rates in Virginia\nBy Population Group")

dotchart(t(VADeaths), cex=0.8, main="Deaths Rates in Virginia\nBy Age Group")
par(old.par)

## 선도표

# [그림 10-59]
windows(width=7.0, height=4.5)
old.par <- par(mfrow=c(1,2))
tree1 <- subset(Orange, Tree==1)
tree1
plot(tree1$age, tree1$circumference,
     main="Growth of Orange Tree 1",
     xlab="Age (days)", ylab="Circumference (mm)")
plot(tree1$age, tree1$circumference, type="o",
     main="Growth of Orange Tree 1",
     xlab="Age (days)", ylab="Circumference (mm)")
par(old.par)

# [그림 10-60]
windows(width=7.0, height=5.5)
xlim <- range(Orange$age)
ylim <- range(Orange$circumference)
plot(xlim, ylim, type="n", las=1, bty="l",
     xlab="Age (days)", ylab="Circumference (mm)",
     main="Growth of Orange Trees")

ntree <- max(as.numeric(Orange$Tree))
colors <- c(1:ntree) + 1
linetype <- c(1:ntree)
plotchar <- c(1:ntree) + 18

for (i in 1:ntree) {
  tree <- subset(Orange, Tree==i)
  lines(tree$age, tree$circumference, 
        type="b", lwd=2, 
        lty=linetype[i], col=colors[i], pch=plotchar[i])
}

legend(xlim[1], ylim[2], 1:ntree, 
       col=colors, pch=plotchar, lty=linetype, title="Trees")

## 산점도

# [그림 10-61]
windows(width=7.0, height=4.5)
old.par <- par(mfrow=c(1,2))
plot(iris$Petal.Length, iris$Petal.Width, main="All")
with(iris, plot(Petal.Length, Petal.Width, main="All"))

plot(Petal.Width ~ Petal.Length, data=iris, main="All")

with(iris, plot(Petal.Length, Petal.Width, 
                pch=as.integer(Species), main="By Species"))
par(old.par)

# [그림 10-62]
windows(width=7.0, height=5.5)
with(iris, plot(Petal.Length, Petal.Width, pch=as.integer(Species)))
legend(x=1.2, y=2.4, legend=c("setosa", "versicolor", "virginica"), pch=1:3)

with(iris, plot(Petal.Length, Petal.Width, pch=as.integer(Species)))
legend(x=1.2, y=2.4, legend=as.character(levels(iris$Species)), 
       pch=1:length(levels(iris$Species)))

with(iris, plot(Petal.Length, Petal.Width, pch=as.integer(Species)))
legend(locator(1), legend=as.character(levels(iris$Species)), 
       pch=1:length(levels(iris$Species)))

# [그림 10-63]
windows(width=7.0, height=4.5)
old.par <- par(mfrow=c(1,2))
with(iris, plot(Petal.Length, Petal.Width, 
                pch=as.integer(Species), col=as.integer(Species), 
                main='pch / col / bty="n"'))
legend(1.1, 2.5, legend=as.character(levels(iris$Species)), 
       pch=1:length(levels(iris$Species)), col=1:length(levels(iris$Species)), 
       bty="n")

with(iris, plot(Petal.Length, Petal.Width, 
                pch=19, col=as.integer(iris$Species)+1, 
                main='fill / col / bty="n"'))
legend(1.1, 2.5, legend=as.character(levels(iris$Species)), 
       fill=(1:length(levels(iris$Species)))+1, bty="n")
par(old.par)

# [그림 10-64]
install.packages("car")
library(car)
windows(width=7.5, height=5.5)
scatterplot(mpg ~ wt | cyl, data=mtcars, boxplots="xy", lwd=2, 
            pch=c(15, 16, 17), col=c("red", "green3", "blue"),
            xlab="Weight (lbs/1000)", ylab="Miles per Gallon",
            main="Scatterplot of MPG vs. Weight by Cylinders")

## 산점도 행렬

# [그림 10-65]
windows(width=7.0, height=5.5)
plot(iris[1:4])
pairs(iris[1:4], main="Scatterplot Matrix using pairs()")
pairs(~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data=iris,
      main="Scatterplot Matrix using pairs()")

pairs(iris[1:4], upper.panel=NULL, main="Scatterplot Matrix using pairs()")

# [그림 10-66]
install.packages("psych")
library(psych)
windows(width=7.0, height=5.5)
pairs.panels(iris[1:4], main="Scatterplot Matrix using pairs.panels()")

# [그림 10-67]
windows(width=7.0, height=5.5)
pairs.panels(iris[1:4], pch=21, bg=c("red", "green", "blue")[iris$Species], 
             lm=TRUE, main="Scatterplot Matrix using pairs.panels()")

# [그림 10-68]
windows(width=7.0, height=5.5)
pairs.panels(iris[1:4], pch=21+as.integer(iris$Species), 
             bg=c("red", "green", "blue")[iris$Species], hist.col="gold",
             main="Scatterplot Matrix using pairs.panels()")

# [그림 10-69]
install.packages("remotes")
remotes::install_github("braverock/PerformanceAnalytics")

install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
windows(width=7.0, height=5.5)
chart.Correlation(iris[1:4], pch=21, bg=c("red", "green", "blue")[iris$Species], 
                  main="Scatterplot Matrix using chart.Correlation()")

## 고밀도 산점도

n <- 10000
set.seed(123)
block1 <- matrix(rnorm(n, mean=0, sd=1), ncol=2)
block2 <- matrix(rnorm(n, mean=3, sd=1.5), ncol=2)
mysample <- rbind(block1, block2)
mysample <- as.data.frame(mysample)
names(mysample) <- c("X", "Y")
head(mysample, 3); tail(mysample, 3)

# [그림 10-70]
windows(width=10.0, height=5.5)
old.par <- par(mfrow=c(1,2))
plot(mysample$X, mysample$Y, 
     pch=19, xlab="X", ylab="", main="Scatterplot\nwith size of 10,000")

smoothScatter(mysample$X, mysample$Y,
              xlab="X", ylab="Y", main="Scatterplot\nwith Smoothed Density")
par(old.par)

install.packages("hexbin")
install.packages("hexbin", dependencies=TRUE, NSTALL_opts="--no-lock")
library(hexbin)

# [그림 10-71-1]
windows(width=7.0, height=5.5)
plot(hexbin(mysample$X, mysample$Y, xbins=50),
     xlab="X", ylab="Y", 
     main="Scatterplot with size of 10,000\nusing Hexagonal Binning")

# [그림 10-71-2]
windows(width=7.0, height=5.5)
plot(hexbin(mysample$X, mysample$Y, xbins=50), colramp=terrain.colors,
     xlab="X", ylab="Y", 
     main="Scatterplot with size of 10,000\nusing Hexagonal Binning")

## 3차원 산점도

# [그림 10-72]
install.packages("scatterplot3d")
library(scatterplot3d)
windows(width=7.0, height=5.5)
scatterplot3d(mtcars$wt, mtcars$disp, mtcars$mpg, 
              xlab="Weight", ylab="Displacement", zlab="Miles per Gallon",
              main="3D Scatterplot")

# [그림 10-73]
windows(width=7.0, height=5.5)
scatterplot3d(mtcars$wt, mtcars$disp, mtcars$mpg, 
              pch=19, highlight.3d=TRUE, type="h",
              xlab="Weight", ylab="Displacement", zlab="Miles per Gallon",
              main="3D Scatterplot with Vertical Lines")

# [그림 10-74]
windows(width=7.0, height=5.5)
sp3d <- scatterplot3d(mtcars$wt, mtcars$disp, mtcars$mpg, 
                      pch=19, highlight.3d=TRUE, type="h",
                      xlab="Weight", ylab="Displacement", zlab="Miles per Gallon",
                      main="3D Scatterplot with Vertical Lines and Regression Plane")
reg <- lm(mpg ~ wt + disp, data=mtcars)
sp3d$plane3d(reg)

## 조건부도표

# [그림 10-75]
windows(width=7.0, height=5.5)
coplot(Petal.Width ~ Petal.Length | Species, data=iris)

## 그래프 조합

# [그림 10-76]
windows(width=7.0, height=5.5)
old.par <- par(no.readonly=TRUE)
par(fig=c(0, 0.85, 0, 0.85))
attach(faithful)
plot(eruptions, waiting, pch=19, col="royalblue",
     xlab="Eruption time (minutes)",
     ylab="Waiting time to next eruption (minutes)")
par(fig=c(0, 0.85, 0.5, 1), new=TRUE)
boxplot(eruptions, horizontal=TRUE, col="tomato", axes=FALSE)
par(fig=c(0.7, 1, 0, 0.85), new=TRUE)
boxplot(waiting, col="orange", axes=FALSE)
mtext("Old Faithful Geyser", cex=1.2, side=3, outer=TRUE, line=-4)
detach(faithful)
par(old.par)

##############
## 연습문제 ##
##############

# 10-1
library(RColorBrewer)
windows(width=7.0, height=5.5)
rows <- rep(1:4, each=7)
cols <- rep(7:1, times=4)
rows <- rows[1:(length(rows)-2)]
cols <- cols[1:(length(cols)-2)]
plot(rows, cols, xlim=c(0.9, 4.5), ylim=c(0.5, 7.5), 
     type="n", xaxt="n", yaxt="n", ann=FALSE)
points(rows, cols, pch=0:25, col=brewer.pal(7, "Dark2"), cex=2)
text(rows, cols, 0:25, pos=4, offset=2, cex=1.5)
title("Plotting Symbols (pch)")

# 10-2
windows(width=7.0, height=5.5)
y <- seq(2, -3)
plot(0, 0, xlim=c(-2, 2), ylim=c(-2, 2),
     type="n", xaxt="n", yaxt="n", ann=FALSE)
for (i in 1:6) abline(a=y[i], b=1, col=i, lty=i, lwd=2)
legend("topleft", inset=0.01, cex=0.8,
       legend=c("solid", "dashed", "dotted", "dotdash", "longdash", "twodash"),
       col=c(1:6), lty=1:6, lwd=2)
title("Line Type (lty)")

# 10-3
windows(width=7.0, height=5.5)
str(ToothGrowth)

boxplot(len ~ supp + dose, data=ToothGrowth, 
        col=c("orange", "yellow"), border="darkblue", 
        las=1, at=c(1,2,3.5,4.5,6,7),
        main="Tooth Growth of Guinea Pigs",
        xlab="Vitamin C (delivery method and dose)", ylab="Tooth Length",
        cex.lab=0.9, cex.axis=0.7)
legend(0.5, 33, legend=c("Orange Juice", "Ascorbic Acid"), 
       fill=c("orange", "yellow"))

# 10-4
windows(width=7.0, height=5.5)
library(ggplot2)
str(economics)

plot(economics$date, economics$unemploy, type="o", cex=0.3,
     main="Unemployment Trend",
     xlab="Year", ylab="Number of Unemployed (thousands)",
     col.main="brown", cex.lab=0.9, cex.axis=0.7)
lines(lowess(economics$date, economics$unemploy), lty=1, lwd=2, col="blue")
unemp.lm <- lm(unemploy ~ date, data=economics)
lines(x=economics$date, y=fitted(unemp.lm), lty=2, lwd=2, col="red")
legend("topleft", inset=0.05, title="Fitted Lines", legend=c("local", "linear"),
       lty=c(1,2), lwd=2, col=c("blue", "red"), bty="n", cex=0.9)

# 10-5
windows(width=7.0, height=5.5)
library(ggplot2)
old.par <- par(mfrow=c(2,1))
plot(economics$date, economics$unemploy, type="l", lwd=2,
     main="Unemployment Trend",
     xlab="Year", ylab="Unemployed",
     col.main="brown", cex.lab=0.9, cex.axis=0.7)
plot(economics$date, economics$pce, type="h", col="skyblue2", lwd=1,
     main="Expenditure Trend",
     xlab="Year", ylab="Expenditure",
     col.main="darkgreen", cex.lab=0.9, cex.axis=0.7)
par(old.par)

# 10-6
windows(width=7.0, height=5.5)
VADeaths

library(RColorBrewer)
barplot(VADeaths, beside=TRUE, ylim=c(0,100), las=1, cex.names=0.9, 
        col=brewer.pal(5, "Set2"), main="Death Rate by Population and Age Group",
        xlab="Population Group", ylab="Death Rates (per 1,000 population)")
legend(x=1, y=95, legend=rownames(VADeaths), horiz=TRUE, 
       title="Ages", fill=brewer.pal(5, "Set2"))

# 10-7 
windows(width=7.0, height=5.5)
library(ggplot2)
str(diamonds)

hist(diamonds$price, breaks=30, col="cornflowerblue", border="pink",
     xlim=c(0, 20000), ylim=c(0, 14000),
     main="Diamonds Price", xlab="Price (dollars)")
rug(quantile(diamonds$price), col="red", lwd=3)

# 10-8
windows(width=7.0, height=5.5)
library(car)
str(Salaries)

levels(Salaries$rank)
Salaries$color[Salaries$rank=="AsstProf"] <- "chocolate"
Salaries$color[Salaries$rank=="AssocProf"] <- "springgreen4"
Salaries$color[Salaries$rank=="Prof"] <- "royalblue"

plot(Salaries$yrs.since.phd, Salaries$salary, pch=21, cex=2, yaxt="n", 
     col="wheat", bg=Salaries$color, cex.axis=0.75, ylim=c(50000, 250000), 
     main="Salary vs. Years Since Ph.D by Rank", 
     xlab="Years Since Ph.D", ylab="Salary (dollars)",
     col.main="brown", col.lab="maroon")
axis(side=2, cex.axis=0.75,las=2, at=seq(50000, 250000, 50000), 
     labels=c("50K", "100K", "150K", "200K", "250K"))
legend("topleft", inset=0.05, bty="n", pch=21, pt.cex=2, 
       legend=c("Assistant Prof", "Associate Prof", "Full Prof"),
       col="wheat", pt.bg=c("chocolate", "springgreen4", "royalblue"))

# 10-9
windows(width=7.0, height=5.5)
library(ggplot2)
library(hexbin)
plot(hexbin(diamonds$price, diamonds$carat, xbin=40), colramp=rainbow,
     main="Carat vs. Price of Diamonds", 
     xlab="Price", ylab="Carat")

# 10-10
windows(width=7.0, height=5.5)
str(chickwts)

library(RColorBrewer)
stripchart(chickwts$weight ~ chickwts$feed, method="jitter", jitter=0.1, 
           las=1, pch=19, col=brewer.pal(6, "Set2"), vertical=TRUE,
           main="Chicken Weights by Feed Type", ylab="Weight (g)")
