library(mice)
library(ggplot)


hist(boys$hgt, main = "Histogram height of boys")

# result <- lm(age~wgt, boys)
# 
# par(mfraw=c(2,2))
# plot(result)


#1- Provide the data
boys %>% 
  ggplot()


#2- map variables to aesthetics

boys %>% 
  ggplot(aes(x=age, y=bmi)) +
  geom_point(col= "dark green") +
  geom_smooth()+
  geom_boxplot()
  

#3- State which geometric object to display

boys %>% 
  geom_point()


plot(boys)
