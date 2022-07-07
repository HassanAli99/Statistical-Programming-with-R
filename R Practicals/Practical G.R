
library(magrittr) #for pipes
library(MASS)     #for the cats and bacteria data
library(mice)     #for the boys data
library(ggplot2) #for making plots

#set random seed, make things reproducible
set.seed(123)

design <- matrix(NA, 7, 4)

# Name the columns and rows. 
colnames(design) <- paste("condiation", 1:4, sep=" ")
rownames(design) <- paste("condiation", 1:4, sep=" ")

# Put a random ordering in each column.
for (j in 1:ncol(design)) {
  design[, j] <- sample(1:7, replace=FALSE)
}
design

#Generate a vector of 100 random standard normal numbers.

y <- rnorm(100)

#Compute the mean and standard deviation of the vector from question 2.

mean(y)
sd(y)

#Generate a vector of 100 random standard normal numbers (like in Exercise 2) 25 times, and each time store means in object av. 
#Compute the standard deviation of av.
av <- numeric(25)

for (index in 1:25){
  av[index] = mean(rnorm(100))
}

#Create a function that automatically returns a vector like av.

mean.av <- function(n, x){
  av <- numeric(n)
  for (index in 1:n){
    av[index] <- mean(rnorm(x))
  }
  
  return(mean(av))
  }

#Add the option to this function to print a density plot. Set it to TRUE by default.

mean.av2 <- function(n=25, x=100, plotDens=TRUE){
  av <- numeric(n)
  for (index in 1:n){
    av[index] <- mean(rnorm(x))
  }
  average <- mean(av)
  
  if (plotDens){
    plot(density(av, main="Sampling distribution of the mean"))
    
  }
    
  av
  
}

# mean.av2()

par(mfrow = c(2, 2))
mean.av2()


#Generate a random sample of size 20 from a normal population with mean 100 and standard deviation 10.


# rnumbers <- rnorm(x=20, mean=100, sd=10)

















