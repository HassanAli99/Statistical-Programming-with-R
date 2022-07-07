#Statistical Programming with R

library(ggplot2)
library(dplyr)


set.seed(123)

#1
x <- rnorm(10, mean = 0, sd = 2)
t.test(x)


x2 <- rnorm(10, mean = 1.5, sd = 2)
t.test(x2)$p.value


#2
p.value <- function(n = 100, mean.value=0) {
  
  x <- rnorm(n, mean = mean.value)
  
  return(t.test(x)$p.value)
  
}

#3
p.values.new <- numeric(50)

for (i in 1:50){
  p.values.new[i] <- p.value(n=10)
}

qqplot(x=qunif(ppoints(50)), p.values.new)


#4
data <- matrix(c(74, 71, 43, 38, 11, 65), nrow = 2, ncol = 3)
colnames(data) <- c("Acupuncture", "Sham", "Waiting list")
rownames(data) <- c("> 50% reduction", "< 50% reduction")
data


# We use Chisq test because we have categorical data (factors)
X2test <- 
  data %>%
  chisq.test()

X2test$expected

X2test$observed 

X2test$observed - X2test$expected

X2test$residuals

#5

#Patients who received the acupuncture and sham acupuncture treatments were asked to guess their treatment at the end of their trial. 
#What would you conclude from this data?

data <- matrix(c(82, 17, 30, 30, 26, 16), nrow = 3, ncol = 2)
colnames(data) <- c("Acupuncture", "Sham")
rownames(data) <- c("Chinese", "Other", "Don't know")
data


X2test <- 
  data %>%
  chisq.test()s

X2test

X2test$expected



#6start

# Start by drawing a 100 values from a normal distribution with μ=3 and σ=7. Use seed value 32083

set.seed(32083)

x <- rnorm(100, mean=3, sd=7)

# mean(x)

mu = 3
summed <- x-mu
sum.sq <- sum(summed^2)
sum.sq








