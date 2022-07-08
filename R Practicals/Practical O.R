

library(plyr)
library(dplyr)
library(magrittr)
library(ggplot2)


set.seed(1234)

samples <- lapply(1:100, function(x) rnorm(5000, mean = 0, sd = 1))


info <- function(x){ 
  M <- mean(x)
  SE <- 1 / sqrt(length(x))
  DF <- length(x) - 1
  INT <- qt(.975, DF) * SE
  return(c("Mean"    = M, 
           "Bias"    = M - 0, 
           "Std.Err" = SE, 
           "Lower"   = M - INT, 
           "Upper"   = M + INT))
}

results <- 
  samples %>% 
  sapply(info) %>% 
  t()

results <- results %>%
  as.data.frame() %>%
  mutate(Covered = Lower < 0 & 0 < Upper)

colMeans(results)

noncovered <- results[!results$Covered, ]


library(ggplot2)

ggplot(results, aes(y = Mean, x = 1:100, ymax = Upper, ymin = Lower, 
                    colour = Covered)) + 
  geom_hline(yintercept = 0, color = "dark grey", size = 2) + 
  geom_pointrange() + 
  xlab("Simulations 1-100") +
  ylab("Means and 95% Confidence Intervals") + 
  theme_minimal()


ggplot(noncovered, aes(y = Mean, x = 1:5, ymax = Upper, ymin = Lower)) + 
  geom_hline(aes(yintercept = 0), color = "dark grey", size = 2) + 
  geom_pointrange(col = "red") + 
  xlab("Simulations 1-100") +
  ylab("Means and 95% Confidence Intervals") + 
  theme_minimal()



















  