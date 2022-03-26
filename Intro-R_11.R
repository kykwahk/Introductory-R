
#############################
##   R 기초와 활용(2판)    ##
## (곽기영, 도서출판 청람) ## 
#############################

########################
## 제11장 고급 그래픽 ##
########################

#########################
## 11.1 lattice 패키지 ##
#########################

## 그래프 생성

library(lattice)
windows(width=7.0, height=5.5)

# [그림 11-1]
library(car)
str(Salaries)

xyplot(salary ~ yrs.since.phd | sex, data=Salaries,
       main="Salary vs. Years Since Ph.D by Gender",
       xlab="Years Since Ph.D", ylab="Salary (dollars)")

windows(width=7.0, height=5.5)
data(mtcars)
mtcars$gear <- factor(mtcars$gear, levels=c(3, 4, 5), 
                      labels=c("3 gears", "4 gears", "5 gears"))
mtcars$cyl <- factor(mtcars$cyl, levels=c(4, 6, 8),
                     labels=c("4 cylinders", "6 cylinders", "8 cylinders"))
histogram( ~ mpg | cyl, data=mtcars, main="histogram()", xlab="Miles per Gallon")
densityplot( ~ mpg | cyl, data=mtcars, 
             main="densityplot()", xlab="Miles per Gallon")
bwplot( ~ mpg | gear, data=mtcars, main="bwplot()", xlab="Miles per Gallon")
xyplot(mpg ~ wt | cyl * gear, data=mtcars,
       main="xyplot()", xlab="Car Weight", ylab="Miles per Gallon")
cloud(mpg ~ wt * disp | cyl, data=mtcars, main="cloud()")
dotplot(cyl ~ mpg | gear, data=mtcars, main="dotplot()", xlab="Miles per Gallon")

# [그림 11-2]
data(mtcars)
mtcars$gear <- factor(mtcars$gear, levels=c(3, 4, 5), 
                      labels=c("3 gears", "4 gears", "5 gears"))
mtcars$cyl <- factor(mtcars$cyl, levels=c(4, 6, 8),
                     labels=c("4 cylinders", "6 cylinders", "8 cylinders"))
g1 <- histogram( ~ mpg | cyl, data=mtcars,
                 main="histogram()", xlab="Miles per Gallon")
g2 <- densityplot( ~ mpg | cyl, data=mtcars,
                   main="densityplot()", xlab="Miles per Gallon")
g3 <- bwplot( ~ mpg | gear, data=mtcars, 
             main="bwplot()", xlab="Miles per Gallon")
g4 <- xyplot(mpg ~ wt | cyl * gear, data=mtcars,
             main="xyplot()", xlab="Car Weight", ylab="Miles per Gallon")
g5 <- cloud(mpg ~ wt * disp | cyl, data=mtcars, 
            main="cloud()")
g6 <- dotplot(cyl ~ mpg | gear, data=mtcars,
              main="dotplot()", xlab="Miles per Gallon")
library(gridExtra)
windows(width=10.0, height=15)
grid.arrange(g1, g2, g3, g4, g5, g6, ncol=2)

## 산점도

library(lattice)
windows(width=7.0, height=5.5)

# [그림 11-3]
data(mtcars)
xyplot(mpg ~ wt, data=mtcars)

# [그림 11-4]
data(mtcars)
mtcars$cyl <- factor(mtcars$cyl, levels=c(4,6,8),
                     labels=c("4 cylinders", "6 cylinders", "8 cylinders"))
xyplot(mpg ~ wt | cyl, data=mtcars)

# [그림 11-5]
xyplot(mpg ~ wt | cyl, data=mtcars, layout=c(3,1))

# [그림 11-6]
xyplot(mpg ~ wt | cyl, data=mtcars, type="r", layout=c(3,1))

?panel.xyplot

# [그림 11-7]
xyplot(mpg ~ wt | cyl, data=mtcars, type=c("p", "r"), layout=c(3,1))

# [그림 11-8]
xyplot(mpg ~ wt | cyl, data=mtcars, type=c("p", "r"), layout=c(3,1),
       main="Fuel Consumption vs. Weight by Number of Cylinders",
       xlab="Weight (1,000 lbs)",
       ylab="Fuel Consumption (miles per gallon)")

# [그림 11-9]
xyplot(mpg ~ wt | cyl, data=mtcars, type=c("p", "r"), layout=c(3,1),
       main=list(label="Fuel Consumption vs. Weight by Number of Cylinders",
                 cex=0.9, col="brown"),
       xlab=list(label="Weight (1,000 lbs)", cex=0.75),
       ylab=list(label="Fuel Consumption (miles per gallon)", cex=0.75),
       scales=list(cex=0.6, alternating=1))

# [그림 11-10]
xyplot(mpg ~ wt | cyl, data=mtcars, layout=c(3,1),
       type=c("p", "r"), pch=19, col="red", lwd=2, lty=3, col.line="blue", 
       main=list(label="Fuel Consumption vs. Weight by Number of Cylinders",
                 cex=0.9, col="brown"),
       xlab=list(label="Weight (1,000 lbs)", cex=0.75),
       ylab=list(label="Fuel Consumption (miles per gallon)", cex=0.75),
       scales=list(cex=0.6, alternating=1))

# [그림 11-11]
xyplot(mpg ~ wt | cyl, data=mtcars, layout=c(3,1),
       strip=strip.custom(bg="lightgoldenrod",
                          par.strip.text=list(col="black", cex=0.8, font=4)),
       main="Fuel Consumption vs. Weight by Number of Cylinders",
       xlab="Weight (1,000 lbs)",
       ylab="Fuel Consumption (miles per gallon)")

# [그림 11-12]
mpgwt.xyplot <- xyplot(mpg ~ wt | cyl, data=mtcars, layout=c(3,1))
mpgwt.xyplot

mpgwt.xyplot2 <- update(mpgwt.xyplot, type=c("p", "r"),
                        pch=19, col="tomato", col.line="royalblue")
mpgwt.xyplot2

xyplot(mpg ~ wt | cyl, data=mtcars)
xyplot(mpg ~ wt | cyl, data=mtcars, panel=panel.xyplot)

# [그림 11-13]
mypanel <- function(x, y) {
  panel.xyplot(x, y, pch=19)
  panel.rug(x, y)
  panel.grid(h=-1, v=-1)
  panel.lmline(x, y, col="red", lty=2)
}
xyplot(mpg ~ wt | cyl, data=mtcars, layout=c(3,1),
       main="Fuel Consumption vs. Weight by Number of Cylinders",
       xlab="Weight (1,000 lbs)",
       ylab="Fuel Consumption (miles per gallon)",
       panel=mypanel)

# [그림 11-14]
mtcars$am <- factor(mtcars$am, levels=c(0,1),
                    labels=c("Automatic", "Manual"))
mypanel2 <- function(x, y) {
  panel.xyplot(x, y)
  panel.grid(h=-1, v=-1)
  panel.loess(x, y, col="orangered")
  panel.abline(h=mean(y), col="darkgreen", lty=2, lwd=2)
}
xyplot(mpg ~ wt | am, data=mtcars, 
       main="Fuel Consumption vs. Weight by Transmission Type",
       xlab="Weight (1,000 lbs)",
       ylab="Fuel Consumption (miles per gallon)",
       sub="Dashed Lines are Group Means",
       scales=list(cex=0.8, col="red"),
       panel=mypanel2)

# [그림 11-15]
data(mtcars)
mtcars$cyl <- factor(mtcars$cyl, levels=c(4, 6, 8),
                     labels=c("4 cylinders", "6 cylinders", "8 cylinders"))
xyplot(mpg ~ wt, data=mtcars, groups=cyl, 
       main="Fuel Consumption vs. Weight by Number of Cylinders",
       xlab="Weight (1,000 lbs)",
       ylab="Fuel Consumption (miles per gallon)",
       auto.key=TRUE)

# [그림 11-16]
data(mtcars)
mtcars$cyl <- factor(mtcars$cyl, levels=c(4, 6, 8),
                     labels=c("4 cylinders", "6 cylinders", "8 cylinders"))
mtcars$am <- factor(mtcars$am, levels=c(0,1),
                    labels=c("Automatic", "Manual"))
xyplot(mpg ~ wt | cyl, data=mtcars, groups=am, layout=c(3,1),
       main="Fuel Consumption vs. Weight by Number of Cylinders",
       xlab="Weight (1,000 lbs)",
       ylab="Fuel Consumption (miles per gallon)",
       auto.key=TRUE)

# [그림 11-17]
longley
str(longley)

library(tidyr)
longley.long <- pivot_longer(longley, cols=-Year, names_to="variable", values_to="value")
longley.long

library(reshape2)
longley.long <- melt(longley, id.vars="Year")
longley.long

xyplot(value ~ Year | variable, data=longley.long)

# [그림 11-18]
xyplot(value ~ Year | variable, data=longley.long, scales="free")

## 막대도표

library(lattice)
windows(width=7.0, height=5.5)

# [그림 11-19]
data(mtcars)
mtcars$model <- row.names(mtcars)
barchart(model ~ mpg, data=mtcars, scales=list(cex=0.65))

# [그림 11-20]
mtcars$am <- factor(mtcars$am, levels=c(0,1), 
                    labels=c("Automatic", "Manual"))
barchart(model ~ mpg, data=mtcars, scales=list(cex=0.65), 
         groups=am, auto.key=TRUE, 
         main=list(label="Fuel Comsumption by Models and Transmission Type",
                   col="brown"),
         xlab=list(label="Fuel Consumption (miles per gallon)", cex=0.8),
         par.settings=simpleTheme(col=c("orange", "seagreen")))

# [그림 11-21]
barchart(model ~ mpg | am, data=mtcars, col="cornflowerblue", scales=list(cex=0.65),
         main=list(label="Fuel Comsumption by Models and Transmission Type",
                   col="brown"),
         xlab=list(label="Fuel Consumption (miles per gallon)", cex=0.8),
         par.strip.text=list(cex=0.8, col="blue"))

# [그림 11-22]         
mtcars$cyl <- factor(mtcars$cyl, levels=c(4, 6, 8),
                     labels=c("4 cylinders", "6 cylinders", "8 cylinders"))
barchart(model ~ mpg | cyl, data=mtcars, scales=list(cex=0.65),
         groups=am, auto.key=TRUE, 
         par.settings=simpleTheme(col=c("orange", "seagreen")),
         main=list(label="Fuel Comsumption by Models",
                   col="brown"),
         xlab=list(label="Fuel Consumption (miles per gallon)", cex=0.8),
         par.strip.text=list(cex=0.8, col="blue"),
         layout=c(3,1))

# [그림 11-23]
barley
str(barley)

windows(width=6.0, height=7.5)
barchart(yield ~ variety | site, data=barley, origin=0,
         groups=year, layout=c(1,6), 
         auto.key=list(space="right"),
         xlab="Variety of Barley",
         ylab="Barley Yield (bushels/acre)",
         scales=list(x=list(rot=45)))

# [그림 11-24]
windows(width=6.0, height=7.5)
barchart(yield ~ variety | site, data=barley, 
         groups=year, layout=c(1,6), stack=TRUE,
         key=simpleKey(title="Year", cex.title=0.9,  
                       text=levels(barley$year), cex=0.8,
                       space="bottom", columns=2, points=FALSE, rectangles=TRUE),
         xlab="Variety of Barley",
         ylab="Barley Yield (bushels/acre)",
         scales=list(x=list(abbreviate=TRUE, minlength=4)))

## 상자도표

library(lattice)
windows(width=7.0, height=5.5)

# [그림 11-25]
singer
str(singer)

bwplot(voice.part ~ height, data=singer, xlab="Height (inches)")

# [그림 11-26]
bwplot( ~ height | voice.part, data=singer, layout=c(2,4), xlab="Height (inches)")

# [그림 11-27]
data(mtcars)
mtcars$cyl <- factor(mtcars$cyl, levels=c(4, 6, 8),
                     labels=c("4 cylinders", "6 cylinders", "8 cylinders"))
bwplot( ~ mpg | factor(cyl), data=mtcars, layout=c(1,3),
       fill="tomato", pch="|", notch=TRUE, 
       xlab="Fuel Consumption (miles per gallon)")

## 히스토그램과 밀도도표

library(lattice)
windows(width=7.0, height=5.5)

# [그림 11-28]
data(mtcars)
histogram( ~ mpg, data=mtcars)

# [그림 11-29]
mtcars$cyl <- factor(mtcars$cyl, levels=c(4, 6, 8),
                     labels=c("4 cylinders", "6 cylinders", "8 cylinders"))
histogram( ~ mpg | cyl, data=mtcars, type="count", nint=12)

# [그림 11-30]
densityplot( ~ mpg | cyl, data=mtcars)

# [그림 11-31]
colors = c("red", "darkgreen", "blue")
lines = c(1,2,3) 
points = c(15,16,17)
densityplot( ~ mpg, groups=cyl, data=mtcars, 
             pch=points, lty=lines, col=colors, lwd=2, jitter=0.005,
             xlab="Fuel Consumption (miles per gallon)",
             key=list(title="Cylinders", x=0.65, y=0.8, corner=c(0,0),
                      text=list(levels(mtcars$cyl)),
                      points=list(pch=points, col=colors),
                      lines=list(col=colors, lty=lines),
                      cex.title=1, cex=.9))

# [그림 11-32]
histogram( ~ height | voice.part, data=singer, nint=17, col="pink",
           endpoints=c(59.5, 76.5), layout=c(4,2), aspect=1.2,
           xlab="Height (inches)", ylab="Percent")

# [그림 11-33]
densityplot( ~ height | voice.part, data=singer, layout=c(2,4),  
             xlab="Height (inches)", ylab="Density", bw=5)

## 점도표와 스트립도표

library(lattice)

# [그림 11-34]
windows(width=7.0, height=5.5)
dotplot(variety ~ yield | site, data=barley, groups=year,
        layout=c(3,2), aspect=1, 
        key=simpleKey(levels(barley$year), space="right"),
        xlab="Barley Yield (bushels/acre) ")

# [그림 11-35]
windows(width=5.5, height=5.5)
stripplot(voice.part ~ jitter(height), data=singer, aspect=1,
          jitter.data=TRUE, xlab="Height (inches)")

## 그래프 패러미터의 글로벌 설정

library(lattice)
windows(width=7.0, height=5.5)

# [그림 11-36]
show.settings()

# [그림 11-37]
mysettings <- trellis.par.get()
names(mysettings)

mysettings$superpose.symbol

mysettings$superpose.symbol$pch <- c(1:10)
trellis.par.set(mysettings)
mysettings$superpose.symbol$pch

data(mtcars)
mtcars$cyl <- factor(mtcars$cyl, levels=c(4, 6, 8),
                     labels=c("4 cylinders", "6 cylinders", "8 cylinders"))
xyplot(mpg ~ wt, data=mtcars, groups=cyl, 
       main="Fuel Consumption vs. Weight by Number of Cylinders",
       xlab="Weight (1,000 lbs)",
       ylab="Fuel Consumption (miles per gallon)",
       auto.key=TRUE)

## 그래프 배치 및 저장

library(lattice)
windows(width=7.0, height=5.5)

?print.trellis

# [그림 11-38]
g1 <- histogram(~ height | voice.part, data=singer)
g2 <- bwplot(voice.part ~ height, data=singer)
plot(g1, split=c(1, 1, 2, 1))
plot(g2, split=c(2, 1, 2, 1), newpage=FALSE)

# [그림 11-39]
g1 <- histogram(~ height | voice.part, data=singer)
g2 <- bwplot(voice.part ~ height, data=singer)
g3 <- densityplot( ~ height, groups=voice.part, data=singer)
plot(g1, position=c(0, 0, 0.6, 1))
plot(g2, position=c(0.6, 0.5, 1, 1), newpage=FALSE)
plot(g3, position=c(0.6, 0, 1, 0.5), newpage=FALSE)

# [그림 11-38] reproduction
g1 <- histogram(~ height | voice.part, data=singer)
g2 <- bwplot(voice.part ~ height, data=singer)
install.packages("gridExtra")
library(gridExtra)
grid.arrange(g1, g2, ncol=2, widths=c(0.5, 0.5))

# [그림 11-39] reproduction
g1 <- histogram(~ height | voice.part, data=singer)
g2 <- bwplot(voice.part ~ height, data=singer)
g3 <- densityplot( ~ height, groups=voice.part, data=singer)
grid.arrange(g1, arrangeGrob(g2, g3, nrow=2, heights=c(0.5, 0.5)), 
             ncol=2, widths=c(0.6, 0.4))

myxyplot <- xyplot(mpg ~ wt | factor(cyl), data=mtcars)
png("myplot.png", width=648, height=432)
print(myxyplot)
dev.off()

library(pander)
openFileInOS("myplot.png")

myxyplot <- xyplot(mpg ~ wt | factor(cyl), data=mtcars)
trellis.device(device="png", filename="myplot.png")
print(myxyplot)
dev.off()

openFileInOS("myplot.png")

#########################
## 11.2 ggplot2 패키지 ##
#########################

## 그래프 생성

install.packages("ggplot2")
library(ggplot2)
windows(width=7.0, height=5.5)

# [그림 11-40]
str(mtcars)
ggplot(data=mtcars, mapping=aes(x=wt, y=mpg)) + 
  geom_point() +
  labs(title="Fuel Consumption vs. Weight", 
       x="Weight (1,000 lbs)", y="Fuel Consumption (miles per gallon)") 

# [그림 11-40] reproduction
ggplot() + 
  geom_point(mapping=aes(x=wt, y=mpg), data=mtcars) +
  labs(title="Fuel Consumption vs. Weight", 
       x="Weight (1,000 lbs)", y="Fuel Consumption (miles per gallon)")

data(mtcars)
mtcars$cyl <- factor(mtcars$cyl, levels=c(4, 6, 8),
                     labels=c("4 cylinders", "6 cylinders", "8 cylinders"))
ggplot(data=mtcars, mapping=aes(x=mpg)) + geom_histogram() + facet_grid(cyl ~ .) +
  labs(title="geom_histogram()", x="Miles per Gallon")
ggplot(data=mtcars, mapping=aes(x=cyl, y=mpg)) + geom_boxplot() +
  labs(title="geom_boxplot()", x="Number of Cylinders", y="Miles per Gallon")
ggplot(data=mtcars, mapping=aes(x=mpg, fill=cyl)) + geom_density(outline.type="full") +
  labs(title="geom_density()", x="Miles per Gallon")
ggplot(data=mtcars, mapping=aes(x=wt, y=mpg, col=cyl)) + geom_point() +
  labs(title="geom_point()", x="Weight (1,000 lbs)", y="Miles per Gallon")
ggplot(data=mtcars, mapping=aes(x=wt, y=mpg)) + geom_smooth() +
  labs(title="geom_smooth()", x="Weight (1,000 lbs)", y="Miles per Gallon")
ggplot(data=economics, mapping=aes(x=date, y=unemploy)) + geom_line() +
  labs(title="geom_line()", x="Year", y="Number of Unemployed (thousands)")

# [그림 11-41]
data(mtcars)
mtcars$cyl <- factor(mtcars$cyl, levels=c(4, 6, 8),
                     labels=c("4 cylinders", "6 cylinders", "8 cylinders"))
g1 <- ggplot(data=mtcars, mapping=aes(x=mpg)) + geom_histogram() + facet_grid(cyl ~ .) +
  labs(title="geom_histogram()", x="Miles per Gallon")
g2 <- ggplot(data=mtcars, mapping=aes(x=cyl, y=mpg)) + geom_boxplot() +
  labs(title="geom_boxplot()", x="Number of Cylinders", y="Miles per Gallon")
g3 <- ggplot(data=mtcars, mapping=aes(x=mpg, fill=cyl)) + geom_density(outline.type="full") +
  labs(title="geom_density()", x="Miles per Gallon")
g4 <- ggplot(data=mtcars, mapping=aes(x=wt, y=mpg, col=cyl)) + geom_point() +
  labs(title="geom_point()", x="Weight (1,000 lbs)", y="Miles per Gallon")
g5 <- ggplot(data=mtcars, mapping=aes(x=wt, y=mpg)) + geom_smooth() +
  labs(title="geom_smooth()", x="Weight (1,000 lbs)", y="Miles per Gallon")
g6 <- ggplot(data=economics, mapping=aes(x=date, y=unemploy)) + geom_line() +
  labs(title="geom_line()", x="Year", y="Number of Unemployed (thousands)")

library(gridExtra)
windows(width=10.0, height=15)
grid.arrange(g1, g2, g3, g4, g5, g6, ncol=2)

# [그림 11-42]
windows(width=7.0, height=5.5)
ggplot(data=mtcars, mapping=aes(x=wt, y=mpg)) + 
  geom_point() + 
  geom_smooth() +
  labs(title="Fuel Consumption vs. Weight", 
       x="Weight (1,000 lbs)", y="Fuel Consumption (miles per gallon)")

## geom 객체 옵션

library(ggplot2)
windows(width=7.0, height=5.5)

# [그림 11-43]
ggplot(data=mtcars, mapping=aes(x=wt, y=mpg)) + 
  geom_point(pch=17, color="blue", size=2) +
  geom_smooth(method="lm", color="red",linetype=2, size=1) +
  labs(title="Fuel Consumption vs. Weight", 
       x="Weight (1,000 lbs)", y="Fuel Consumption (miles per gallon)")

# [그림 11-44]
ggplot(data=mtcars, mapping=aes(x=wt, y=mpg)) + 
  geom_point(pch=17, color="blue", size=2) +
  geom_smooth(method="lm", color="red",linetype=2, size=1) +
  geom_text(label=rownames(mtcars), hjust=0, vjust=1, nudge_y=0.7, size=2) +
  labs(title="Fuel Consumption vs. Weight", 
       x="Weight (1,000 lbs)", y="Fuel Consumption (miles per gallon)")

# [그림 11-45]
library(car)
str(Salaries)
ggplot(Salaries, aes(x=rank, y=salary)) +
  geom_boxplot(fill="coral3", color="black", notch=TRUE) +
  geom_point(position="jitter", color="blue", alpha=0.5) +
  geom_rug(sides="l", color="black")

# [그림 11-46]
library(lattice)
ggplot(singer, aes(x=voice.part, y=height)) + 
  geom_violin(fill="honeydew2") + 
  geom_boxplot(fill="lightgreen", width=0.2)

## 집단별 그래프

library(ggplot2)
windows(width=7.0, height=5.5)

# [그림 11-47]
library(car)
ggplot(Salaries, aes(x=salary, fill=rank)) + 
  geom_density(alpha=0.5, outline.type="full")

# [그림 11-48]
library(car)
ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color=rank, shape=sex)) +
  geom_point()

library(car)
ggplot(Salaries, aes(x=rank, fill=sex)) +
  geom_bar(position="dodge") + 
  labs(title='position="dodge"')
ggplot(Salaries, aes(x=rank, fill=sex)) + 
  geom_bar(position="stack") + 
  labs(title='position="stack"')
ggplot(Salaries, aes(x=rank, fill=sex)) +
  geom_bar(position="fill") + 
  labs(title='position="fill"', y="proportion")

# [그림 11-49]
library(car)
p1 <- ggplot(Salaries, aes(x=rank, fill=sex)) +
  geom_bar(position="dodge") + 
  labs(title='position="dodge"')
p2 <- ggplot(Salaries, aes(x=rank, fill=sex)) +
  geom_bar(position="stack") +  
  labs(title='position="stack"')
p3 <- ggplot(Salaries, aes(x=rank, fill=sex)) +
  geom_bar(position="fill") + 
  labs(title='position="fill"', y="proportion")
library(gridExtra)
windows(width=6.0, height=8.0)
grid.arrange(p1, p2, p3, nrow=3)

# [그림 11-50]
windows(width=7.0, height=5.5)
presummed <- data.frame(Grade=c("A", "B", "C", "D", "F"), 
                        Frequency=c(20, 45, 20, 10, 5))
ggplot(presummed, aes(x=Grade, y=Frequency)) + 
  geom_bar(stat="identity")

ggplot(presummed, aes(x=Grade, y=Frequency)) + 
  geom_col()

# [그림 11-51]
library(lattice)
ggplot(data=singer, aes(x=height)) +
  geom_histogram() +  
  facet_wrap( ~ voice.part, nrow=4)

# [그림 11-52]
windows(width=6.0, height=6.0)
ggplot(data=singer, aes(x=height, fill=voice.part)) +
  geom_density(outline.type="full") +  
  facet_grid(voice.part ~ .)

# [그림 11-53]
windows(width=7.0, height=5.5)
library(car)
ggplot(Salaries, aes(x=yrs.since.phd, y=salary)) + 
  geom_point() + 
  facet_grid(sex ~ rank)

# [그림 11-54]
library(car)
ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color=rank, shape=rank)) +
  geom_point() + 
  facet_grid(. ~ sex)

# [그림 11-54] reproduction
ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color=rank, shape=rank)) +
  geom_point() + 
  facet_wrap(~ sex, ncol=2)

## 그래프 옵션

library(ggplot2)
windows(width=7.0, height=5.5)

# [그림 11-54] reproduction
ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color=rank, shape=rank)) +
  geom_point() + 
  facet_wrap(~ sex, ncol=2) +
  scale_x_continuous() +
  scale_y_continuous() +
  scale_color_discrete() +
  scale_shape_discrete()

# [그림 11-55]
library(car)
ggplot(Salaries, aes(x=rank, y=salary, fill=sex)) +
  geom_boxplot() +
  scale_x_discrete(breaks=c("AsstProf", "AssocProf", "Prof"),
                   labels=c("Assistant\nProfessor", 
                            "Associate\nProfessor", "Full\nProfessor")) +
  scale_y_continuous(breaks=c(50000, 100000, 150000, 200000),
                     labels=c("$50K", "$100K", "$150K", "$200K")) +
  labs(title="Faculty Salary by Rank and Sex", x="", y="")

# [그림 11-56]
library(car)
ggplot(Salaries, aes(x=rank, y=salary, fill=sex)) +
  geom_boxplot() +
  scale_x_discrete(breaks=c("AsstProf", "AssocProf", "Prof"),
                   labels=c("Assistant\nProfessor", 
                            "Associate\nProfessor", "Full\nProfessor")) +
  scale_y_continuous(breaks=c(50000, 100000, 150000, 200000), 
                     labels=c("$50K", "$100K", "$150K", "$200K")) +
  labs(title="Faculty Salary by Rank and Gender", x="", y="", fill="Gender") +
  theme(legend.position=c(0.1, 0.85))

# [그림 11-56] reproduction
library(car)
ggplot(Salaries, aes(x=rank, y=salary, fill=sex)) +
  geom_boxplot() +
  scale_x_discrete(breaks=c("AsstProf", "AssocProf", "Prof"),
                   labels=c("Assistant\nProfessor", 
                            "Associate\nProfessor", "Full\nProfessor")) +
  scale_y_continuous(breaks=c(50000, 100000, 150000, 200000), 
                     labels=c("$50K", "$100K", "$150K", "$200K")) +
  scale_fill_discrete(name="Gender") +
  labs(title="Faculty Salary by Rank and Gender", x="", y="") +
  theme(legend.position=c(0.1, 0.85))

# [그림 11-57]
data(mtcars)
ggplot(mtcars, aes(x=wt, y=mpg, shape=factor(cyl), color=factor(cyl))) +
  geom_point() + 
  labs(shape="Cylinders", color="Cylinders")

# [그림 11-57] reproduction
ggplot(mtcars, aes(x=wt, y=mpg, shape=factor(cyl), color=factor(cyl))) +
  geom_point() +
  scale_shape_discrete(name="Cylinders") +
  scale_color_discrete(name="Cylinders")

# [그림 11-58]
library(car)
ggplot(Salaries, aes(x=rank, fill=sex)) +  
  geom_bar() + 
  scale_fill_manual(values=c("tomato", "cornflowerblue")) 

# [그림 11-59]
library(car)
ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color=rank)) +
  geom_point(size=2) +
  scale_color_manual(values=c("orange", "violetred", "steelblue"))

# [그림 11-60]
library(car)
ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color=rank)) +
  geom_point(size=2) +
  scale_color_brewer(palette="Accent")
 
library(RColorBrewer)
?RColorBrewer
display.brewer.all()
display.brewer.pal(3, "Accent")

# [그림 11-61]
library(car)
ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color=rank)) +
  geom_point(size=2) +
  scale_color_viridis_d(option="viridis")
?scale_color_viridis_d

# [그림 11-62]
ggplot(data=mtcars, aes(x=wt, y=mpg, size=disp)) + 
  geom_point(shape=21, color="black", fill="wheat") +
  labs(size="Engine\nDisplacement\n(cubic inch)")

# [그림 11-63]
ggplot(data=mtcars, aes(x=wt, y=mpg, size=disp)) + 
  geom_point(shape=21, color="black", fill="wheat") +
  labs(size="Engine\nDisplacement\n(cubic inch)") +
  scale_size_continuous(range=c(1, 12))

# [그림 11-64]
ggplot(data=mtcars, aes(x=wt, y=mpg, color=disp)) + 
  geom_point(size=5) +
  labs(color="Engine\nDisplacement\n(cubic inch)") +
  scale_color_gradient(low="orange", high="maroon")

# [그림 11-65]
ggplot(data=mtcars, aes(x=wt, y=mpg, fill=disp)) + 
  geom_point(shape=21, size=5, color="black") +
  labs(fill="Engine\nDisplacement\n(cubic inch)") +
  scale_fill_distiller(palette="YlOrRd", direction=1)

# [그림 11-66]
ggplot(data=mtcars, aes(x=wt, y=mpg, fill=disp)) + 
  geom_point(shape=21, size=5, color="black") +
  labs(fill="Engine\nDisplacement\n(cubic inch)") +
  scale_fill_viridis_c(option="plasma", direction=-1)

# [그림 11-67]
library(car)
ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color=rank, shape=rank)) +
  scale_shape_manual(values=c(15, 17, 19)) +
  geom_point(size=2)

## 테마

library(ggplot2)
windows(width=7.0, height=5.5)

# [그림 11-68]
library(car)
ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color=rank, shape=rank)) +
  geom_point() + 
  facet_grid(. ~ sex) + 
  theme_dark()

?theme

# [그림 11-69]
library(car)
mytheme <- theme(plot.title=element_text(face="bold.italic", 
                                         size="14", color="brown"),
                 axis.title=element_text(face="bold.italic",
                                         size="10", color="tomato"),
                 axis.text=element_text(face="bold",
                                         size="9", color="royalblue"),
                 panel.background=element_rect(fill="snow", color="darkblue"),
                 panel.grid.major.y=element_line(color="gray", linetype="solid"),
                 panel.grid.minor.y=element_line(color="gray", linetype="dashed"),
                 legend.position="top")
ggplot(Salaries, aes(x=rank, y=salary, fill=sex)) +
  geom_boxplot() +
  labs(title="Salary by Rank and Sex", x="Rank", y="Salary") +
  mytheme

# [그림 11-70]
library(lattice)
ggplot(singer, aes(x=voice.part, y=height)) + 
  geom_boxplot(fill="limegreen") + 
  labs(title="Height by Voice Part", x="Voice Part", y="Height") +
  mytheme

## 그래프 배치 및 저장

library(ggplot2)
windows(width=7.0, height=5.5)

# [그림 11-71]
library(car)
p1 <- ggplot(Salaries, aes(x=rank)) + geom_bar()
p2 <- ggplot(Salaries, aes(x=salary)) + geom_histogram()
p3 <- ggplot(Salaries, aes(x=yrs.since.phd, y=salary)) + geom_point()
p4 <- ggplot(Salaries, aes(x=rank, y=salary)) + geom_boxplot() 

library(gridExtra)
grid.arrange(p1, p2, p3, p4, nrow=2, ncol=2)

# [그림 11-72]
grid.arrange(arrangeGrob(p3, p4, nrow=2, heights=c(0.5, 0.5)), p1,
             ncol=2, widths=c(0.6, 0.4))

myggplot <- ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
ggsave(file="myplot.png", plot=myggplot, width=7.0, height=5.5)

library(pander)
openFileInOS("myplot.png")

ggplot(Salaries, aes(x=rank, y=salary)) + geom_boxplot()
ggsave(file="myplot.png")

openFileInOS("myplot.png")

##############
## 연습문제 ##
##############

# 11-1
windows(width=7.0, height=5.5)
Orange
str(Orange)

library(lattice)
xyplot(circumference ~ age | factor(as.numeric(Tree)), data=Orange, type="b", 
       main="Orange Trees Growth", 
       xlab="Age (days)", ylab="Circumference (mm)")

colors <- c(2:6)
symbols <- c(1:5)
lines <- c(1:5)
key.trees <- list(title="Trees", cex.title=0.9,
                  space="right",
                  text=list(levels(factor(as.numeric(Orange$Tree)))),
                  points=list(pch=symbols, col=colors))
xyplot(circumference ~ age, groups=factor(as.numeric(Tree)), data=Orange, 
       type="b", pch=symbols, col=colors, lty=lines, lwd=2,
       main="Orange Trees Growth", 
       xlab="Age (days)", ylab="Circumference (mm)",
       key=key.trees)

# 11-2
VADeaths
str(VADeaths)
deaths <- data.frame(VADeaths)
deaths$ages <- row.names(deaths)
row.names(deaths) <- NULL
deaths

library(reshape2)
deaths.long <- melt(deaths, id.vars="ages")
deaths.long
str(deaths.long)

library(lattice)
g1 <- xyplot(value ~ variable | ages, data=deaths.long,layout=c(1,5), type="b",
       main=list(label="Death Rates vs. Population Group given Age Group", cex=0.8),
       xlab=list(label="Population Group", cex=0.75),
       ylab=list(label="Death Rates (per 1,000 population per year)", cex=0.75),
       scales=list(cex=0.65))
g2 <- xyplot(value ~ factor(ages) | variable, data=deaths.long,
       layout=c(1,4), type="p",
       main=list(label="Death Rates vs. Age Group given Population Group", cex=0.8),
       xlab=list(label="Age Group", cex=0.75),
       ylab=list(label="Death Rates (per 1,000 population per year)", cex=0.75),
       scales=list(cex=0.65))

library(gridExtra)
windows(width=8.0, height=5.5)
grid.arrange(g1, g2, ncol=2)

# 11-3
windows(width=7.0, height=5.5)
library(car)
Salaries
str(Salaries)

library(lattice)
xyplot(salary ~ yrs.since.phd | sex * rank, data=Salaries,
       main="Salary vs. Years Since Ph.D by Gender and Rank",
       xlab="Years Since Ph.D", ylab="Salary (dollars)")

# 11-4
windows(width=7.0, height=5.5)
faithful
str(faithful)
faithful$length <- ifelse(faithful$eruptions < 3, "short", "long")

library(lattice)
bwplot(waiting ~ length, data=faithful, 
       fill="cornflowerblue", pch="|", notch=TRUE,
       main="Waiting Time Distribution by Eruption Length",
       xlab="Eruptions Length", ylab="Waiting Time (minutes)")

colors <- c("red", "blue")
lines <- c(1, 2) 
points <- c(16, 17)
key.len <- list(title="Eruption Length",
                text=list(levels(factor(faithful$length))),
                space="bottom", columns=2,
                points=list(pch=points, col=colors),
                lines=list(col=colors, lty=lines),
                cex.title=1, cex=.9)
densityplot( ~ waiting, groups=length, data=faithful, 
             pch=points, lty=lines, col=colors, lwd=2, jitter=0.005,
             main="Waiting Time Distribution by Eruption Length", 
             xlab="Waiting Time (minutes)",
             key=key.len)

# 11-5
windows(width=7.0, height=5.5)
faithful$length <- ifelse(faithful$eruptions < 3, "short", "long")

library(ggplot2)
ggplot(faithful, aes(x=length, y=waiting)) +
  geom_boxplot(fill="cornflowerblue", notch=TRUE) + 
  labs(title="Waiting Time Distribution by Eruption Length", 
       x="Eruptions Length", y="Waiting Time (minutes)")

ggplot(faithful, aes(x=waiting, fill=length, linetype=length)) +
  geom_density(alpha=0.5, outline.type="full") +  
  labs(title="Waiting Time Distribution by Eruption Length", 
       x="Waiting Time (minutes)", 
       fill="Eruption\nLength", linetype="Eruption\nLength")

# 11-6
windows(width=7.0, height=5.5)
library(lattice)
singer
str(singer)

library(ggplot2)
ggplot(singer, aes(x=height)) + geom_histogram() +
  labs(title="Height Distribution", x="Height (inches)")

ggplot(singer, aes(x=voice.part, y=height)) + geom_boxplot() +
  labs(title="Height Distribution", 
       x="Voice Part", y="Height (inches)")

# 11-7
windows(width=7.0, height=5.5)
library(ggplot2)

data(mtcars)
mtcars$cyl.factor <- factor(mtcars$cyl,
                            levels=c(4, 6, 8), labels=c("4", "6", "8"))
mtcars$am.factor <- factor(mtcars$am,
                           levels=c(0, 1), labels=c("Automatic", "Manual"))
mtcars$vs.factor <- factor(mtcars$vs,
                           levels=c(0, 1), labels=c("V-Engine", "Straight Engine"))

ggplot(data=mtcars, aes(x=hp, y=mpg, shape=cyl.factor, color=cyl.factor)) + 
  geom_point(size=2) + facet_grid(am.factor ~ vs.factor) +
  labs(title="Fuel Consumption vs. Horsepower by Engine/Transmission Type", 
       x="Horsepower", y="Fuel Consumption (miles per gallon)",
       shape="Cylinders", color="Cylinders")

# 11-8
data(mtcars)
mtcars$model <- row.names(mtcars)
mtcars$model <- factor(mtcars$model)

windows(width=7.0, height=5.5)
library(ggplot2)
library(forcats)
ggplot(mtcars, aes(x=mpg, y=fct_reorder(model, mpg))) +
  geom_point(pch=19, color="salmon", size=2) +
  labs(title="Car Model vs. Fuel Consumption", 
       x="Fuel Consumption (miles per gallon)", y="Car Model")

# 11-9
windows(width=7.0, height=5.5)
library(car)

library(ggplot2)
ggplot(Salaries, 
       aes(x=yrs.since.phd, y=salary, linetype=sex, shape=sex, color=sex)) +
  geom_smooth(method=lm, formula=y ~ poly(x, 2), se=FALSE, size=1) +
  geom_point(size=2) +
  labs(title="Salary vs. Years Since Ph.D by Gender",
       x="Years Since Ph.D", y="Salary (dollars)")

# 11-10
windows(width=7.0, height=5.5)
library(ggplot2)
head(diamonds)
str(diamonds)

ggplot(data=diamonds, aes(x=carat, y=price)) +
  geom_point(color="gray", size=0.8) +
  geom_smooth(aes(color=cut, fill=cut)) + facet_wrap( ~ cut) +
  labs(title="Diamond Price Distribution by Carat and Cut",
       x="Carat", y="Price (dollars)")

# 11-11
windows(width=7.0, height=5.5)
library(ggplot2)

ggplot(diamonds, aes(x=carat, y=price, group=cut_width(carat, width=0.25))) +
  geom_boxplot(color="cornflowerblue", fill="gold") +
  labs(title="Diamond Price Distribution by Carat",
       x="Carat", y="Price (dollars)")

# 11-12
windows(width=7.0, height=5.5)
library(latticeExtra)
data(SeatacWeather)
str(SeatacWeather)

temp <- xyplot(min.temp + max.temp ~ day | month,
               data=SeatacWeather, type="b", layout=c(3,1))
rain <- xyplot(precip ~ day | month, 
               data=SeatacWeather, type="h", lwd=4)
doubleYScale(temp, rain, style1=0, style2=3, add.ylab2=TRUE,
             text=c("min.Temp", "max.Temp", "rainfall"), columns=3)

show.settings()
trellis.par.get("superpose.line")

doubleYScale(temp, rain, style1=0, style2=3, add.ylab2=TRUE,
             text=c("min.Temp", "max.Temp", "rainfall"), columns=3)
update(trellis.last.object(),
       par.settings=simpleTheme(col=c("blue", "red", "black")),
       main="Temperature and Precipitation")

# 11-13
windows(width=9.0, height=5.5)
install.packages("wbstats")
library(wbstats)

b <- wb_search(pattern="birth rate")
b$indicator_id

birth.rate <- wb_data(indicator="SP.DYN.CBRT.IN", 
                      country=c("KOR", "JPN", "CHN"), mrv=50)
birth.rate

library(ggplot2)
ggplot(birth.rate, aes(x=date, y=SP.DYN.CBRT.IN, color=country)) + 
  geom_line(size=1.5) + 
  labs(title="Birth Rate Trend", x="Year", y="Birth Rate (per 1,000 people)") +
  theme(legend.position=c(0.85, 0.85))
