library(mice)


write.table(mammalsleep, "mammalsleep.txt", sep = "\t", dec = ".", row.names = FALSE)


sleepdata <- read.table("mammalsleep.txt", sep = "\t", dec = ".", header = TRUE, stringsAsFactors = TRUE)

str(sleepdata)
summary(sleepdata)

head(sleepdata)

tail(sleepdata)


#bivariate correlations, variable 1 excluded. 
round(cor(sleepdata[, -1], use = "pairwise.complete.obs"), 2)

save.image("Practical_C.RData")
save(sleepdata, file = "Sleepdata.RData")

exclude <- c("Echidna", "Lesser", "short-tailed", "shrew", "Musk shrew")

sleepdata2 <- sleepdata[!sleepdata$species %in% exclude, ]



#part two - Data Manipulation
library(dplyr)

#function to filter data (first var) based on the subset passed in the second argument
filter(sleepdata, !sleepdata$species %in% exclude) # ! makes all TRUES into FALSE

sleepdata3  = sleepdata[-c(16, 32, 38)]

plot(brw ~ species, data = sleepdata2)

#Some animals have much heavier brains than other animals. Find out the names of the animals that have a brain weight 
#larger than 1 standard deviation above the mean brain weight. Replicate the plot from Question 9 with only these animals 
#and do not plot any information about the other animals.


mean.brw <- mean(sleepdata$brw, na.rm = FALSE)
sd.brw  <-  sd(sleepdata$brw, na.rm = FALSE)



sleepdata4 = filter(sleepdata, sleepdata$brw > (mean.brw + (1*sd.brw))) # ! makes all TRUES into FALSE

sleepdata4$species <- factor(sleepdata4$species)


#mean(subset(sleepdata2, brw < 15 & reg != "north" )$age, na.rm = TRUE

plot(brw ~ species, data = sleepdata4)

          







