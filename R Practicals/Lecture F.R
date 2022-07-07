
##Data manipulation and pipes

library(MASS)     # for the cats data
library(dplyr)    # data manipulation
library(haven)    # in/exporting data
library(magrittr) # pipes
library(mice)

# transform(): changing and adding columns
# dplyr::filter(): row-wise selection (of cases)
# table(): frequency tables
# class(): object class
# levels(): levels of a factor
# order(): data entries in increasing order
# haven::read_sav(): import SPSS data
# cor(): bivariate correlation
# sample(): drawing a sample
# t.test(): t-test

head(cats)

fem.cats <- cats[cats$Sex == "F", ]
head(fem.cats)

heavy.cats <- subset(cats, Bwt > 3)
head(heavy.cats)

sorted.cats <- cats[order(cats$Bwt), ]

head(sorted.cats)

dplyr::arrange(cats)

plot( formula = Hwt ~ Sex, data=cats)

plot( formula = Hwt ~ Bwt, data=cats)


#Pipes

boys <- mice::boys

boys <- 
  boys %>% 
  head()

nrow(cats)

cats.outl <- 
  cats %>% 
  filter((Hwt < mean(Hwt) + 3* sd(Hwt)),
         (Hwt < mean(Hwt) - 3* sd(Hwt)))

# "." can be used as place holder

#Exposition operator => %$% exposes the column data to the pipe operator
#We use pipe operator (%>%) to excute chunk of code subsequently without 














