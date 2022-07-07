library(dplyr)
library(magrittr)
library(mice)
library(ggplot2)

set.seed(123)

#Create a scatterplot between age and bmi in the mice::boys data set
boys <- mice::boys

plot(x=boys$age, y=boys$bmi, main="Scatterplot boys data") 


boys2 <- boys
boys3 <- boys
boys4 <- boys
boys5 <- boys
boys6 <- boys

boys2 <-
  boys %>% 
  filter(boys2$bmi < 18.5)
  plot(x=boys2$age, y=boys2$bmi, main="Scatterplot boys data subset", col = "light blue")

boys4 <-
  boys %>% 
  filter(boys$bmi > 18.5, boys$bmi < 25)
  plot(x=boys$age, y=boys$bmi, main="Scatterplot boys data subset", col = "light green")
  
boys5 <-
  boys %>% 
  filter(boys$bmi > 25, boys$bmi < 30)
  plot(x=boys$age, y=boys$bmi, main="Scatterplot boys data subset", col = "orange")
  
  
boys6 <-
  boys %>% 
  filter(boys$bmi > 30)
  plot(x=boys$age, y=boys$bmi, main="Scatterplot boys data subset", col = "red")
  
  
  
  
  
  

  
  

