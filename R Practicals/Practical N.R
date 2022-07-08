

library(boot)
library(mice)
library(dplyr)
library(magrittr)
library(ggplot2)


set.seed(123)

corfun <- function(data, i){
  data.sample <- data[i,]
  stat <- cor(data.sample$age, data.sample$wgt, use = "pairwise.complete.obs")
  return(stat)
}

bootstr.cor <- 
  boys %>%
  boot(corfun, R = 1000)

attributes(bootstr.cor)
head(bootstr.cor$data)

bootstr.cor$t0
bootstr.cor$t
head(bootstr.cor$data)

# Plot the histogram of the individual bootstrapped estimates for every bootstrapped sample (i.e. $t).

plotdata <- data.frame(t = bootstr.cor$t)

plotdata %>% 
  ggplot(aes(t))+
  geom_histogram(bins=20)+
  geom_density(col = "orange") +
  geom_vline(xintercept = bootstr.cor$t0, col = "orange", linetype = "dotted")


boys2 <- boys %>%
  mutate(ovw = if_else(bmi <= 25, "Not Overweight", "Overweight"))








