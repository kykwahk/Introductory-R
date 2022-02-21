
###################
## 제4장 리스트  ##
###################

#####################
## 4.1 리스트 생성 ##
#####################

lst <- list(0.6826, 0.9544, 0.9974)
lst

lst <- list(1.23, "Apple", c(2,3,5,7), matrix(1:6, ncol=3), mean)
lst

lst <- list()
lst
lst[[1]] <- 1.23
lst[[2]] <- "Apple"
lst[[3]] <- c(2,3,5,7)
lst[[4]] <- matrix(1:6, ncol=3)
lst[[5]] <- mean

lst <- list(0.6826, 0.9544, 0.9974)
names(lst) <- c("sigma1", "sigma2", "sigma3")
lst
lst <- list(sigma1=0.6826, sigma2=0.9544, sigma3=0.9974)
lst
names(lst)

length(lst)

worldcup1 <- list("Brazil", "South Africa", "Germany")
worldcup2 <- list("Korea-Japan", "France", "USA")
c(worldcup1, worldcup2)

rainfall <- list(21.6,23.6,45.8,77.0,102.2,133.3,
                 327.9,348.0,137.6,49.3,53.0,24.9)
mean(rainfall)

mean(unlist(rainfall))
min(unlist(rainfall))
max(unlist(rainfall))

#######################
## 4.2 리스트 인덱싱 ##
#######################

product <- list("A001", "Mouse", 30000)
product

product[[3]]
product[3]

class(product[[3]])
class(product[3])

product[[3]] * 0.9
product[3] * 0.9

product[c(1,2)]

product[c(FALSE,TRUE,TRUE)]
product[-1]

product <- list(id="A001", name="Mouse", price=30000)
product

product[["name"]]
product$name

product[c("name", "price")]
product["name"]

product[["fourth"]]
product$fourth
product[[4]]

product[c(4,2,5)]
product[c("fourth", "name", "fifth")]

lst <- list(one=1, two=2, three=list(alpha=3.1, beta=3.2))
lst

lst[["three"]]
lst$three

lst[["three"]][["beta"]]
lst$three$beta

lst[["three"]]["beta"]

product <- list(id="A001", name="Mouse", price=30000)
product[[3]] <- 40000
product[["price"]] <- 40000
product$price <- 40000
product

product[3] <- 40000
product["price"] <- 40000
product

product[[3]] <- c(40000, 50000)
product[3] <- list(c(40000, 50000))
product

product[1:3] <- list("A002", "Keyboard", 90000)
product

product[[4]] <- c("Domestic", "Export")
product

product$madein <- c("Korea", "China")
product[["madein"]] <- c("Korea", "China")
product["madein"] <- list(c("Korea", "China"))
product

product[6:9] <- list(0.12, 0.15, 0.22, 0.27)
product[6:9] <- c(0.12, 0.15, 0.22, 0.27)
product

names <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
values <- c(842,729,786,751,844,851,702)
traffic.death <- list()
traffic.death
traffic.death[names] <- values
traffic.death

traffic.death[["Fri"]] <- NULL
traffic.death

traffic.death[c("Sat", "Sun")] <- NULL
traffic.death

traffic.death < 750

traffic.death[traffic.death < 750] <- NULL
traffic.death

##############
## 연습문제 ##
##############

# 4-1
lst1 <- list(list(alpha=pi, beta=sqrt(pi)), gamma=letters, delta=NULL)
lst2 <- list(alpha=pi, beta=sqrt(pi), gamma=letters, delta=NULL)

length(lst1)
length(lst2)

# 4-2
lst <- list(c(3,5,7), c("A", "B", "C"))
lst

lst[[2]][1] <- "Alpha"
lst

# 4-3
lst <- list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))
lst

mean(unlist(lst))

# 4-4
lst <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
lst$alpha <- lst$alpha + 1
lst

# 4-5
lst <- list(L=letters[1:5], M=month.name[1:5])
lst
lst$M[-3]

# 4-6
lst <- list(month.name, month.abb)

names(lst) <- c("mon.name", "mon.abb")
lst

length(lst$mon.name) + length(lst$mon.abb)

lst$mon.num <- 1:12
lst

# 4-7
lst1 <- list("X", "Y", "Z", "x", "y", "z")
lst2 <- list("x", "y", "z")

setdiff(lst1, lst2)

# 4-8
lst <- c(list(a=1, b=2), pi)
lst

lst[[3]]

# 4-9
lst <- list(first=1, second=2, third=list(third.one=3.1, third.two=3.2))
lst

lst[1:2]
lst[-3]
lst[c("first", "second")]
lst[c(TRUE, TRUE, FALSE)]
lst[1,2] # Different

lst$second
lst$s
lst[[2]]
lst[["second"]]
lst[["s"]] # Different

lst[["third"]][["third.one"]]
lst[[c("third", "third.one")]]
lst[["third"]]$third.one
lst[[3]][[1]]
lst[[3]]["third.one"] # Different

                                                                                                                                                                                                                                                                                                         # 4-10
lst <- list("Apple", NULL, "Orange")
lst

lst[sapply(lst, is.null)] <- NULL
lst

# 4-11
lst <- list(-2.4, 0.4, 5.7, 12.5, 17.8, 22.2, 
            24.9, 25.7, 21.2, 14.8, 7.2, 0.4)
names(lst) <- month.abb
lst

lst[lst < 0]

lst[lst < mean(unlist(lst))]

lst[lst < mean(unlist(lst))] <- NULL
lst
