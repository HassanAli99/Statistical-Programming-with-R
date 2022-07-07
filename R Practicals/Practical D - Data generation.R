
set.seed(123)


draw1 = rnorm(10)

draw1.mean = mean(draw1)
draw1.sd = sd(draw1)

draw2 = rnorm(1000)

draw2.mean = mean(draw1)
draw2.sd = sd(draw1)

means <- c(0, draw1.mean, draw2.mean)
sds <- c(1, draw1.sd, draw2.sd)



result <- data.frame(n=c(Inf, 10, 1000), mean=means, sd=sds)
row.names(result) <- c("population", "draw1 (seed=125)", "draw2 (seed=125)")
round(result, 3)

set.seed(123)

draw3 <- rnorm(10)
draw4 <- rnorm(1000)

draw5 <- rnorm(22, mean=8, sqrt(144))

all.equal(draw1, draw3)
all.equal(draw2, draw4)

draw.norm <- rnorm(1000, mean=50, sd= 20)
draw.t <- rt(1000, df=11)
draw.unif <- runif(1000, min=5, max=6)
draw.binorm <- rbinom(1000, size=1, prob=.8)
draw.F = rf(1000, df1 = 1, df2 = 2)
draw.pois = rpois(1000, lambda = 5)

hist(draw.norm, breaks =25)
hist(draw.t, breaks =25)
hist(draw.unif, breaks =25)
hist(draw.binorm, breaks =25)
hist(draw.F, breaks =25)
hist(draw.pois, breaks =25)

invisible(apply(data, 2, function(x) hist(x, break = 25)))

data <- data.frame(normal = draw.norm, 
                   t = draw.t, 
                   uniform = draw.unif, 
                   binomial = draw.binorm,
                   Fdistr = draw.F,
                   poisson = draw.pois)
summary(data)
