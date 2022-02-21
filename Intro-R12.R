
#######################
## 제12장 데이터분석 ##
#######################

###################
## 12.1 통계분석 ##
###################

## 평균검정

library(MASS)
str(cats)

t.test(cats$Bwt, mu=2.6)

t.test(cats$Bwt, mu=2.7)

t.test(cats$Bwt, mu=2.6, alternative="greater")

cats.t <-t.test(cats$Bwt, mu=2.6)
class(cats.t)
str(cats.t)

cats.t$p.value
cats.t$conf.int

t.test(cats$Bwt, mu=2.6, conf.level=0.99)

prop.test(x=18, n=30, p=0.5, alternative="greater")

t.test(Bwt ~ Sex, data=cats)

Bwt.f <- cats$Bwt[cats$Sex=="F"]
Bwt.m <- cats$Bwt[cats$Sex=="M"]
t.test(Bwt.f, Bwt.m)

patients <- c(86, 93, 136, 82)
smokers  <- c(83, 90, 129, 70)
prop.test(x=smokers, n=patients)

## 분산분석

str(InsectSprays)

sprays.aov <- aov(count ~ spray, data=InsectSprays)
sprays.aov

summary(sprays.aov)

model.tables(sprays.aov, type="mean")
model.tables(sprays.aov, type="effects")
model.tables(sprays.aov)

sprays.compare <- TukeyHSD(sprays.aov)		
sprays.compare

sprays.compare$spray['D-C',]

str(ToothGrowth)

ToothGrowth$dose <- factor(ToothGrowth$dose, 
                           levels=c(0.5, 1.0, 2.0), labels=c("low", "med", "high"))
str(ToothGrowth)
ToothGrowth[seq(1,60,5),]

ToothGrowth.aov <- aov(len ~ supp * dose, data=ToothGrowth)

summary(ToothGrowth.aov)

model.tables(ToothGrowth.aov, type="means")

TukeyHSD(ToothGrowth.aov)

TukeyHSD(ToothGrowth.aov, which=c("dose"), conf.level=0.99)

## 회귀분석

library(MASS)
lm(Hwt ~ Bwt, data=cats)

cats.lm <- lm(Hwt ~ Bwt, data=cats)
class(cats.lm)
cats.lm
summary(cats.lm)

cats.lm.summary <- summary(cats.lm)
coef(cats.lm.summary)

anova(cats.lm)

cats.lm.anova <- anova(cats.lm)
cats.lm.anova["Bwt", "Pr(>F)"]
cats.lm.anova[1,5]

coef(cats.lm)

confint(cats.lm)

confint(cats.lm, level=0.99)

fitted(cats.lm)[1:5]

lm(Hwt ~ Bwt, data=cats, subset=(Sex=="F"))

lm(Hwt ~ Bwt, data=cats, subset=(Hwt < 10.0))

lm(Hwt ~ Bwt, data=cats, subset=1:50)

cats.new <- data.frame(Bwt=c(2.0, 2.5, 3.0))
predict(cats.lm, newdata=cats.new)

predict(cats.lm, newdata=cats.new, interval="confidence")

###################
## 12.2 군집분석 ##
###################

## 계층적 군집분석

install.packages("flexclust")
library(flexclust)
data(nutrient)
head(nutrient, 5)

d <- dist(nutrient)
as.matrix(d)[1:5, 1:5]

data(nutrient)
nutrition <- nutrient
row.names(nutrition) <- tolower(row.names(nutrition))
nutrition.scaled <- scale(nutrition)

d <- dist(nutrition.scaled)
clustering.average <- hclust(d, method="average")

# [그림 12-2]
windows(width=7.0, height=5.5)
plot(clustering.average, hang=-1, cex=0.9,
     xlab="Food", main="Hierarchical Clustering with Average Linkage")

install.packages("NbClust")
library(NbClust)
nc <- NbClust(nutrition.scaled, distance="euclidean",
              min.nc=3, max.nc=15, method="average")
str(nc)

nc$Best.nc

table(nc$Best.nc[1,])

clusters <- cutree(clustering.average, k=5)
clusters

table(clusters)

# [그림 12-3]
windows(width=7.0, height=5.5)
plot(clustering.average, hang=-1, cex=0.9, 
     xlab="Food", 
     main="Hierarchical Clustering with Average Linkage\n Five Clusters")
rect.hclust(clustering.average, k=5)

aggregate(nutrition, by=list(cluster=clusters), mean)

aggregate(nutrition.scaled, by=list(cluster=clusters), mean)

## 분할적 군집분석

head(state.x77)
state.scaled <- scale(state.x77)

library(NbClust)
nc <- NbClust(state.scaled, distance="euclidean",
              min.nc=2, max.nc=15, method="kmeans")
table(nc$Best.nc[1,])

set.seed(123)
clustering.km <- kmeans(state.scaled, centers=3, nstart=25)
str(clustering.km)

clustering.km$cluster
clustering.km$centers
clustering.km$size

aggregate(state.x77, by=list(cluster=clustering.km$cluster), mean)

# [그림 12-4]
install.packages("cluster")
library(cluster)
windows(width=7.0, height=5.5)
clusplot(x=state.x77, clus=clustering.km$cluster, color=TRUE, shade=TRUE,
         labels=2, lines=0, main="Cluster Plot for USA States")

###################
## 12.3 분류분석 ##
###################

## 로지스틱 회귀분석

install.packages("mlbench")
library(mlbench)
data(BreastCancer)
str(BreastCancer)

bc <- BreastCancer[-1]
bc <- cbind(lapply(bc[-10], function(x) as.numeric(as.character(x))), bc[10])
str(bc)
set.seed(123)
train <- sample(nrow(bc), 0.7*nrow(bc))
bc.train <- bc[train,]
bc.test <- bc[-train,]
table(bc.train$Class)
table(bc.test$Class)

bc.logit <- glm(Class ~ ., data=bc.train, family=binomial())
summary(bc.logit)

exp(coef(bc.logit))

z <- coef(bc.logit)[1] + (as.matrix(bc.test[-10])%*%coef(bc.logit)[-1])
p <- 1/(1+exp(-z))

head(p)

bc.logit.pred <- predict(bc.logit, newdata=bc.test, type="response")
head(bc.logit.pred)

bc.logit.pred <- factor(bc.logit.pred > 0.5, levels=c(FALSE, TRUE),
                        labels=c("benign", "malignant"))
head(bc.logit.pred)
table(bc.logit.pred)

bc.logit.perf <- table(bc.test$Class, bc.logit.pred, dnn=c("Actual", "Predicted"))
bc.logit.perf
mean(bc.test$Class==bc.logit.pred, na.rm=TRUE)
(142+58)/(142+58+6+1)

## 의사결정나무

library(mlbench)
data(BreastCancer)
bc <- BreastCancer[-1]
bc <- cbind(lapply(bc[-10], function(x) as.numeric(as.character(x))), bc[10])
set.seed(123)
train <- sample(nrow(bc), 0.7*nrow(bc))
bc.train <- bc[train,]
bc.test <- bc[-train,]
table(bc.train$Class)
table(bc.test$Class)

install.packages("rpart")
library(rpart)
set.seed(123)
bc.dtree <- rpart(Class ~ ., data=bc.train, method="class", 
                  parms=list(split="information"))

bc.dtree

install.packages("rpart.plot")
library(rpart.plot)

# [그림 12-5]
windows(width=7.0, height=5.5)
cols <- ifelse(bc.dtree$frame$yval==2, "darkred", "green4")
prp(bc.dtree, type=2, extra=104, fallen.leaves=TRUE, branch.lty=3,
    col=cols, border.col=cols, shadow.col="gray",
    split.cex=1.2, split.suffix="?",
    split.box.col="lightgray", split.border.col="darkgray", split.round=0.5,
    main="Decision Tree for Breast Cancer Test")

bc.dtree.pred <- predict(bc.dtree, newdata=bc.test, type="class")
head(bc.dtree.pred)

predict(bc.dtree, newdata=bc.test, type="prob")

bc.dtree.perf <- table(bc.test$Class, bc.dtree.pred, dnn=c("Actual", "Predicted"))
bc.dtree.perf
mean(bc.test$Class==bc.dtree.pred)
(140+56)/(140+56+10+4)

######################
## 12.4. 텍스트분석 ##
######################

url <- "http://news.stanford.edu/2005/06/14/jobs-061505/"
library(httr)
html <- GET(url)

library(XML)
html.parsed <- htmlParse(html)
text <- xpathSApply(html.parsed, path="//p", xmlValue)
text

text <- text[4:30]
text

library(tm)
getSources()
docs <- VCorpus(VectorSource(text))
class(docs)

docs
inspect(docs[26])

inspect(docs[[26]])

as.character(docs[[26]])
lapply(docs, as.character)

str(docs[26])
docs[[26]]$content
lapply(docs, function(x)(x$content))

getTransformations()

toSpace <- content_transformer(function(x, pattern) 
  {return(gsub(pattern, " ", x))})

docs <- tm_map(docs, toSpace, ":")
docs <- tm_map(docs, toSpace, ";")
docs <- tm_map(docs, toSpace, "’")

docs <- tm_map(docs, removePunctuation)

docs[[25]]$content

docs <- tm_map(docs, toSpace, "“")
docs <- tm_map(docs, toSpace, "”")
docs[[25]]$content

docs <- tm_map(docs, content_transformer(tolower))

docs <- tm_map(docs, removeNumbers)

stopwords("english")

docs <- tm_map(docs, removeWords, stopwords("english"))
docs[[25]]$content

docs <- tm_map(docs, stripWhitespace)

install.packages("SnowballC")
library(SnowballC)
docs <- tm_map(docs, stemDocument)
docs[[15]]$content

docs <- tm_map(docs, content_transformer(gsub), 
               pattern="lover", replacement="love")

dtm <- DocumentTermMatrix(docs)
dtm

inspect(dtm[1:5, 1:10])

term.freq <- colSums(as.matrix(dtm))

head(term.freq)
length(term.freq)

term.freq[head(order(term.freq, decreasing=TRUE))]
term.freq[tail(order(term.freq, decreasing=TRUE))]

findFreqTerms(dtm, lowfreq=10)

# [그림 12-7]
windows(width=7.0, height=5.5)
barplot(subset(term.freq, term.freq >= 7), horiz=TRUE, las=1,
        xlim=c(0, 20), cex.names=0.8, col="mediumseagreen",
        xlab="Words Frequency", ylab="Words")

# [그림 12-8]
install.packages("wordcloud")
library(wordcloud)
term.freq <- colSums(as.matrix(dtm))
set.seed(123)
windows(width=5.5, height=5.5)
wordcloud(words=names(term.freq), freq=term.freq, min.freq=3)

# [그림 12-9]
set.seed(123)
library(RColorBrewer)
windows(width=6, height=6)
wordcloud(words=names(term.freq), freq=term.freq, min.freq=2,
          random.order=FALSE, random.color=FALSE, colors=brewer.pal(5, "Set1"))

##############
## 연습문제 ##
##############

# 12-1
library(car)
str(Salaries)
t.test(salary ~ sex, data=Salaries)

# 12-2
cures <- c(21, 31, 45)
patients <- c(30, 50, 65)
prop.test(cures, patients)

# 12-3
library(car)
salary.aov <- aov(salary ~ sex * rank, data=Salaries)
summary(salary.aov)

# 12-4
str(women)
women.lm <- lm(weight ~ height, data=women)
summary(women.lm)

women.new <- data.frame(height=c(60, 65, 70))
predict(women.lm, newdata=women.new)

# 12-5
str(USArrests)
USArrests.scaled <- scale(USArrests)
d <- dist(USArrests.scaled)
clustering.average <- hclust(d, method="average")

library(NbClust)
nc <- NbClust(USArrests.scaled, distance="euclidean",
              min.nc=3, max.nc=10, method="average")
table(nc$Best.nc[1,])

clusters <- cutree(clustering.average, k=4)
table(clusters)

windows(width=7.0, height=5.5)
plot(clustering.average, hang=-1, cex=0.7, 
     xlab="States", main="Hierarchical Clustering for USA States\nby Crime Rates")
rect.hclust(clustering.average, k=4)

library(cluster)
clusplot(x=USArrests, clus=clusters, color=TRUE, shade=TRUE,
         labels=2, lines=0, main="Cluster Plot for USA States\nby Crime Rates")

# 12-6
USArrests.scaled <- scale(USArrests)
set.seed(123)
clustering.km <- kmeans(USArrests.scaled, centers=4, nstart=25)
clustering.km$size

library(cluster)
clusplot(x=USArrests, clus=clustering.km$cluster, color=TRUE, shade=TRUE,
         labels=2, lines=0, main="Cluster Plot for USA States")

# 12-7
library(titanic)
data(titanic_train)
str(titanic_train)

titanic <- titanic_train[, c(2,3,5,6,7)]
titanic$Survived <- factor(titanic$Survived, levels=c(0,1), 
                           labels=c("Dead", "Alive"))
str(titanic)

set.seed(123)
train <- sample(nrow(titanic), 0.7*nrow(titanic))
titanic.train <- titanic[train,]
titanic.test <- titanic[-train,]
table(titanic.train$Survived)
table(titanic.test$Survived)
titanic.logit <- glm(Survived ~ ., family=binomial(), data=titanic.train)
summary(titanic.logit)

titanic.logit.pred <- predict(titanic.logit, newdata=titanic.test, type="response")
head(titanic.logit.pred)
titanic.logit.pred <- factor(titanic.logit.pred > 0.5, levels=c(FALSE,TRUE),
                             labels=c("Dead", "Alive"))
head(titanic.logit.pred)

titanic.logit.perf <- table(titanic.test$Survived, titanic.logit.pred, 
                            dnn=c("Actual", "Predicted"))
titanic.logit.perf
mean(titanic.test$Survived==titanic.logit.pred, na.rm=TRUE)
(111+62)/(111+62+21+23)
268-217

# 12-8
library(titanic)
data(titanic_train)
titanic <- titanic_train[, c(2,3,5,6,7)]
titanic$Survived <- factor(titanic$Survived, levels=c(0,1), 
                           labels=c("Dead", "Alive"))
str(titanic)
set.seed(123)
train <- sample(nrow(titanic), 0.7*nrow(titanic))
titanic.train <- titanic[train,]
titanic.test <- titanic[-train,]
table(titanic.train$Survived)
table(titanic.test$Survived)

library(rpart)
set.seed(123)
titanic.dtree <- rpart(Survived ~ ., data=titanic.train, method="class",
                       parms=list(split="gini"))
library(rpart.plot)
windows(width=7.0, height=5.5)
cols <- ifelse(titanic.dtree$frame$yval==2, "darkblue", "red")
prp(titanic.dtree, type=2, extra=104, fallen.leaves=TRUE, branch.lty=3, 
    col=cols, border.col=cols, shadow.col="gray", box.col="snow",
    split.cex=1.2, split.suffix="?",
    split.box.col="lightgray", split.border.col="darkgray", split.round=0.5,
    main="Decision Tree for Titanic Survival")

titanic.dtree.pred <- predict(titanic.dtree, newdata=titanic.test, type="class")
head(titanic.dtree.pred)
titanic.dtree.perf <- table(titanic.test$Survived, titanic.dtree.pred, 
                            dnn=c("Actual", "Predicted"))
titanic.dtree.perf
mean(titanic.test$Survived==titanic.dtree.pred)
(140+74)/(140+74+28+26)

# 12-9
# For NASA website, url <- "https://er.jsc.nasa.gov/seh/ricetalk.htm"
url <- "https://en.wikisource.org/wiki/We_choose_to_go_to_the_moon"
library(httr)
library(XML)
html <- GET(url)
html.parsed <- htmlParse(html)
text <- xpathSApply(html.parsed, path="//p", xmlValue)
text

text <- text[2:32]
text

library(tm)
docs <- VCorpus(VectorSource(text))
lapply(docs, function(x)(x$content))
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeNumbers)
mystopwords <- c(stopwords("english"), 
                 c("ago", "and", "but", "can", "may", "must", "say", "the", "will"))
docs <- tm_map(docs, removeWords, mystopwords)
docs <- tm_map(docs, stripWhitespace)
lapply(docs, function(x)(x$content))
dtm <- DocumentTermMatrix(docs)
dtm

term.freq <- colSums(as.matrix(dtm))
term.freq[head(order(term.freq, decreasing=TRUE), 7)]
findFreqTerms(dtm, lowfreq=8)
term.freq.df <- data.frame(Words=names(term.freq), Frequency=term.freq)
library(ggplot2)
windows(width=7.0, height=5.5)
ggplot(subset(term.freq.df, Frequency >=7), aes(Words, Frequency)) +
  geom_bar(stat="identity", fill="indianred3", color="black") 

library(wordcloud)
term.freq <- colSums(as.matrix(dtm))
set.seed(123)
windows(width=5.5, height=5.5)
wordcloud(words=names(term.freq), freq=term.freq, min.freq=3,
          random.order=FALSE, random.color=FALSE, colors=brewer.pal(6, "Dark2"))

# 12-10
url <- "https://archive.nytimes.com/www.nytimes.com/learning/general/onthisday/big/0911.html"
library(httr)
library(XML)
html <- GET(url)
html.parsed <- htmlParse(html)
text <- xpathSApply(html.parsed, path="//p", fun=xmlValue)
str(text)

text <- text[text != ""]
text <- paste(text, collapse=" ")
text <- gsub("\\s{2,} | \n", "", text)

library(tm)
docs <- VCorpus(VectorSource(text))
inspect(docs)

docs <- tm_map(docs, content_transformer(tolower))
mystopwords <- c(stopwords("english"), 
                 c("also", "among", "but", "even", "four", "get", "one", "said",
                   "the", "there", "two", "three"))
docs <- tm_map(docs, removeWords, mystopwords)
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, stripWhitespace)
docs <- tm_map(docs, stemDocument)
lapply(docs, function(x)(x$content))

dtm <- DocumentTermMatrix(docs)
dtm
inspect(dtm[, 1:10])

term.freq <- colSums(as.matrix(dtm))
term.freq[order(term.freq, decreasing=TRUE)][1:10]

library(wordcloud)
library(RColorBrewer)
set.seed(123)
term.freq <- colSums(as.matrix(dtm))
windows(width=6.5, height=6.5)
wordcloud(words=names(term.freq), freq=term.freq, scale=c(4, 0.2), min.freq=3, 
          rot.per=0, random.order=FALSE, random.color=FALSE, 
          colors=brewer.pal(5, "Set1"))
