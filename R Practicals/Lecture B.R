library(MASS)


#if conditions
a <- 2

if (a > 5){
  print("a is larger than 5")
}

a <- 8

if (a > 5){
  print("a is larger than 5")
}

a <- 2

if (a > 5){
  print("a is larger than 5")
} else {
  print("a is smaller than 5")
}



#looping through the raws
for (i in 1:nrow(cats)){
  if (cats$Bwt[i] > 2.5){
    cat(i, "is over 2.5. It is:", cats$Bwt[i], "\n")
  }
}

#looping through the columns
for (i in 1:ncol(cats)) {
  print(class(cats[, i]))
}


for (i in 1:nrow(cats)){
  if (cats$Bwt[i] > 2.5){
    cat(i, "is over 2.5. It is:", cats$Bwt[i], "\n")
  }
}


#create emppty matrix and filling the empty values 

empty.cats <- matrix(NA, nrow=nrow(cats), ncol=ncol(cats))

for (i in 1:ncol(cats)) {
  empty.cats[, i] <-rep(i, nrow(cats))
}



#fo loop in a for loop
for (i in 1:3){
  for (j in 1:3) {
    print(paste(i, "x", j, "=", i))
  }
}

my.list <- list(A = c(4, 2, 1:3), B = "Hello.", C = TRUE)

for (list.item in my.list) {
  for (var in list.item) {
    cat("one element is", var, "\n")}
  }

my.list2 <- list(A = c(4, 2, 1:3), B = "Hello.", C = c(TRUE, TRUE, FALSE))

for (iter in 1:length(my.list2)) {
  my.list2[[iter]] <- rev(my.list2[[iter]])
}

my.list2

colMeans(cats[, -1])


#functions

sapply(cats, class)
list.fun = lapply(cats, class)


square <- function(x) {
  x.square <- x^2
  return(x.square)
}
square(12)


rand.vec <- rnorm(10)

for (i in 1:length(rand.vec)) {
  print(rand.vec[i])
  rand.vec[i] <- rand.vec[i] + 10
  print(rand.vec[i])
  #i <- i +10
}






