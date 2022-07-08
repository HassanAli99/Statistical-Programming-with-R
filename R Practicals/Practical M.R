
library(dplyr)    # Data manipulation
library(magrittr) # Pipes
library(ggplot2)  # Plotting suite
library(MASS)     # Dataset
library(class)    # K-nearest Neighbour
library(mvtnorm)  # Multivariate Normal tools

helpIAmColourblind <- scale_color_manual(values = c("orange", 
                                                    "blue", 
                                                    "dark green"))

# Reproduce the data from slide 18 twice, but now instead of ±1.5 use an adjustment of ±.5 and ±2.5, respectively

set.seed(123)


sigma <- matrix(c(1, .5, .5, 1), 2, 2)
rownames(sigma) <- colnames(sigma) <- c("x1", "x2")


sim.data <- mvtnorm::rmvnorm(n     = 100, 
                             mean  = c(5, 5), 
                             sigma = sigma)


colnames(sim.data) <- c("x1", "x2")


sim.data %>% 
  as_tibble %>%
  ggplot(aes(x1, x2)) +
  geom_point()

sim.data <- 
  sim.data %>%
  as_tibble %>%
  mutate(class = sample(c("A", "B", "C"), size = 100, replace = TRUE))


sim.data1 <- 
  sim.data %>%
  mutate(x2 = case_when(class == "A" ~ x2 + .5,
                        class == "B" ~ x2 - .5,
                        class == "C" ~ x2 + .5),
         x1 = case_when(class == "A" ~ x1 - .5,
                        class == "B" ~ x1 - 0,
                        class == "C" ~ x1 + .5))

sim.data2 <- 
  sim.data %>%
  mutate(x2 = case_when(class == "A" ~ x2 + 2.5,
                        class == "B" ~ x2 - 2.5,
                        class == "C" ~ x2 + 2.5),
         x1 = case_when(class == "A" ~ x1 - 2.5,
                        class == "B" ~ x1 - 0,
                        class == "C" ~ x1 + 2.5))

sim.data1 %>% 
  as_tibble %>%
  ggplot(aes(x=x2, y=x1, colour=class))+
  geom_point()+
  helpIAmColourblind

sim.data2 %>% 
  as_tibble %>%
  ggplot(aes(x=x2, y=x1, colour=class))+
  geom_point()+
  helpIAmColourblind

sim.data1.1 <-
  sim.data1 %>% 
  mutate(set = sample(c("Train", "Test"), size = 100, 
                      prob = c(.25, .75), replace = TRUE))

train.data <- subset(sim.data1.1, set == "Train", select = c(x1, x2))
test.data <-  subset(sim.data1.1, set == "Test",  select = c(x1, x2))
obs.class <-  subset(sim.data1.1, set == "Train", select = class)


fit.knn <- knn(train = train.data,
               test  = test.data, 
               cl    = as.matrix(obs.class),
               k     = 3)

class.test <- subset(sim.data1.1, set == "Test", select = class) %>%
  as.matrix()
correct <- fit.knn == class.test
mean(correct)

