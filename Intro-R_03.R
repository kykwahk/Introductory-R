
#############################
##   R 기초와 활용(2판)    ##
## (곽기영, 도서출판 청람) ## 
#############################

################
## 제3장 행렬 ##
################

###################
## 3.1 행렬 생성 ##
###################

v <- c(1,2,3,4,5,6,7,8,9,10,11,12)
dim(v) <- c(3,4)
v

v <- c(1,2,3,4,5,6,7,8,9,10,11,12)
matrix(data=v, nrow=3, ncol=4)

matrix(v, 3, 4, byrow=TRUE)

rnames <- c("R1", "R2", "R3")
cnames <- c("C1", "C2", "C3", "C4")
matrix(v, 3, 4, dimnames=list(rnames, cnames))

matrix(0, 3, 4)
matrix(NA, 3, 4)

matrix(v, ncol=4)

mat <- matrix(v, 3, 4)
str(mat)

dim(mat)
dim(mat)[1]
dim(mat)[2]
nrow(mat)
ncol(mat)
length(mat)

v1 <- c(1,2,3,4,5)
v2 <- c(6,7,8,9,10)
rbind(v1, v2)
cbind(v1, v2)

cbind(1:3, 4:6, matrix(7:12, 3, 2))

rbind(matrix(1:6, 2, 3), matrix(7:12, 2, 3))

#####################
## 3.2 행렬 인덱싱 ##
#####################

v <- c(1,2,3,4,5,6,7,8,9,10,11,12)
mat <- matrix(v, 3, 4)
mat
mat[1,]
mat[,3]

mat[1,,drop=FALSE]
mat[,3,drop=FALSE]

mat[2:3,]
mat[,3:4]
mat[1:2, 2:3]
mat[c(1,3),]

mat[,-c(2,3)]

mat[1, 3] <- 77
mat

mat[2,] <- c(22,55)
mat

mat[2:3, 3:4] <- c(1,2,3,4)
mat

city.distance <- c(0,331,238,269,195,
                   331,0,95,194,189,
                   238,95,0,171,130,
                   269,194,171,0,77,
                   195,189,130,77,0)
city.distance.mat <- matrix(city.distance, 5, 5, byrow=TRUE)
city.distance.mat

colnames(city.distance.mat) <- c("Seoul", "Busan", "Daegu", "Gwangju", "Jeonju")
rownames(city.distance.mat) <- c("Seoul", "Busan", "Daegu", "Gwangju", "Jeonju")
colnames(city.distance.mat)
rownames(city.distance.mat)
city.distance.mat

dimnames(city.distance.mat) <-
  list(c("Seoul", "Busan", "Daegu", "Gwangju", "Jeonju"),
       c("Seoul", "Busan", "Daegu", "Gwangju", "Jeonju"))
dimnames(city.distance.mat)

city.distance.mat["Seoul", "Busan"]
city.distance.mat[,"Seoul"]
city.distance.mat[c("Seoul", "Gwangju"),]

###################
## 3.3 행렬 연산 ##
###################

w <- c(1,2,3,4,5,6)
mtx <- matrix(w, 2, 3)
mtx
mtx + 1
mtx - 1
mtx * 2
mtx / 2

matrix(1:6, 2, 3)
matrix(6:1, 2, 3)
matrix(1:6, 2, 3) + matrix(6:1, 2, 3)
matrix(1:6, 2, 3) - matrix(6:1, 2, 3)
matrix(1:6, 2, 3) * matrix(6:1, 2, 3)
matrix(1:6, 2, 3) / matrix(6:1, 2, 3)
matrix(1:6, 2, 3) + matrix(6:1, 3, 2)

w <- c(1,2,3,4,5,6)
matrix(w, 2, 3)
matrix(w, 3, 2)
matrix(w, 2, 3) %*% matrix(w, 3, 2)
matrix(w, 2, 3) %*% matrix(w, 2, 3)

mtx <- matrix(c(1,2,3,4,5,6), 2, 3)
mtx
mtx %*% 1:3
mtx %*% 1:2
1:2 %*% mtx

mtx <- matrix(c(1,2,3,4,5,6), 2, 3)
mtx
mtx + 1:3

mtx <- matrix(c(1,2,3,4,5,6), 2, 3)
mtx
rowSums(mtx)
colSums(mtx)
rowMeans(mtx)
colMeans(mtx)

mtx <- matrix(c(1,2,3,4,5,6), 2, 3)
mtx
t(mtx)

t(1:5)

mtx <- matrix(c(1,2,3,4,5,6), 2, 3)
mtx
mtx[2,]
t(mtx[2,])

##############
## 3.4 배열 ##
##############

a <- 1:24
dim(a) <- c(3,4,2)
a

array(1:12, c(2,3,2))

ary <- array(1:12, c(2,3,2))
ary
ary[1,3,2]

ary[,1,2]

ary[,1,2,drop=FALSE]

ary[2,,]

##############
## 연습문제 ##
##############

# 3-1
mtx <- matrix(1:12, nrow=3, ncol=4)
dimnames(mtx) <- list(letters[1:3], letters[1:4])
mtx

mtx <- matrix(1:12, nrow=3, ncol=4, dimnames=list(letters[1:3], letters[1:4]))
mtx

# 3-2
mtx.c <- cbind(mtx[,c(1,3)], mtx[,c(2,4)])
mtx.c

# 3-3
mtx
mtx.c

3 * mtx
mtx + 3
mtx + mtx.c
mtx - mtx.c
mtx * mtx.c
mtx / mtx.c
mtx %*% mtx.c #Incorrect

# 3-4
matrix(1:4, nrow=2)^(1:4)

# 3-5
x <- 1:10
mtx <- cbind(x1=x, x2=x*2, x3=x*3, x4=x*4, x5=x*5)
rownames(mtx) <- letters[1:10]
mtx
sum(mtx["h",])

# 3-6
v <- 1:9999
mtx <- matrix(v, ncol=9)
mtx.sub <- mtx[(dim(mtx)[1]-2):dim(mtx)[1], (dim(mtx)[2]-1):dim(mtx)[2]]
mtx.sub

# 3-7
x <- c(1:3)
y <- x^2
z <- letters[1:3]
mtx <- cbind(x, y, z)
is.numeric(mtx[,1])
is.numeric(mtx[,2])
is.character(mtx[,3])
mtx

# 3-8
mtx <- matrix(1:12, nrow=3)
mtx

t(t(mtx))
mtx %*% matrix(1, ncol(mtx)) # Not the same
mtx * 1
mtx %*% diag(ncol(mtx))

# 3-9
mtx <- matrix(1:10000, 1000)
mtx[777, 3]

# 3-10
probs <- c(0.43,0.04,0.01,0.49,0.72,0.52,0.08,0.24,0.47)
class.trans <- matrix(probs, nrow=3)
class.trans

rownames(class.trans) <- c("lower", "middle", "upper") 
colnames(class.trans) <- c("lower", "middle", "upper") 
class.trans

rowSums(class.trans)

class.trans2 <- class.trans %*% class.trans
class.trans2

class.trans2[, "upper"]
