#Import packages
library(dplyr)
library(magrittr)
library(mice)

#Set seed
set.seed(123)

# draw1 = rnorm(1000, mean=5)
# 
# mat = matrix(draw1, ncol=2, byrow=FALSE)
# 
# plot(mat)

#use a pipe and create a normal distributed data, make a matrix 
#and plot the data
rnorm(1000, mean=5) %>%
  matrix(ncol=2, byrow=FALSE) %>%
  plot()


#Use a pipe to assign values 1:5 to object x and verify that the object exists.

#we need to specify the environment when assiaging variables in a pipe
#because the after the pipe is done creating the variable it is 
#deleted from the namespace of the pipe

#general way of assigning variables 
x <- 1:5


#this does not work
"x" %>% assign(1:5)

#do this instead
env <- environment()
"x" %>% assign(1:5, envir = env)
x

#Use a pipe to calculate the correlation matrix on the anscombe data set

anscombe %>%
  cor()

#Now use a pipe to calculate the correlation for the pair (x4, y4) on the anscombe data set
#We use %$% to expose the columns to the pipe

anscombe %$%
  cor(x=x4, y=y4)


#Use a pipe to calculate the correlation between hgt and wgt in the boys data set from package mice.

boys%>%
  subset(select = c("wgt", "hgt")) %>%
  cor(use = "pairwise.complete.obs")

#In the boys data set, hgt is recorded in centimeters. 
#Use a pipe to transform hgt in the boys dataset to height in meters and verify the transformation

boys%$%
  mutate(hgt = (hgt/100))
  # cor(use = "pairwise.complete.obs")


