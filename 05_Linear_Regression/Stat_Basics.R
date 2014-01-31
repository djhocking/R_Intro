# Basic Statistics in R

### Daniel J. Hocking
### 21 January 2014
### UNH R Working Group

## Load Data and packages
```{r}
library(RCurl)
setwd("/Users/Dan/Documents/Teaching/R_intro/05_Linear_Regression/")

foo <- getURL("https://raw.github.com/djhocking/R_Intro/master/Data/Salamander_Demographics.csv", followlocation = TRUE, cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))

demo <- read.table(textConnection(foo), header = TRUE, sep = ",", na.strings = NA)
```

## Linear Regression

Remember our plot from last time showing the relationship between mass and snout-vent length:

```{r}
library(ggplot2)
p1 <- ggplot(data = demo, aes(x = svl, y = mass, colour = sex, shape = sex))
p1 + geom_point() + xlab("Snout-vent length (mm)") + ylab("Mass (g)") + theme_bw(legend_position = c(0.1, 0.8))
```

We're interested in the relationship between length and mass. It is nonlinear, so we can log transform both variables to make it linear. A simple linear regression would be:

```{r}
m1 <- lm(log(mass) ~ log(svl), data = demo)
m1 # doesn't show us much information
summary(m1) # shows us the info we're genearlly looking for
```

In the `lm` function in R, the intercept is assumed so it is not written in the model usually. However, it can be explicitly added and the model is the same. Most people do not write the `1` for the intercept but if it helps you better understand the model you can include it.

```{r}
m1a <- lm(log(mass) ~ 1 + log(svl), data = demo)
summary(m1a)
```

This is fine, but based on our plot the sex of animals could influence the mass so we can add that as a parameter.

```{r}
m2 <- lm(log(mass) ~ log(svl) + sex, data = demo)
summary(m2)
```

To see how to add polynomial functions, we will simulate some data and analyze it using a squared term in a linear regression. Lets imagine we're counting the number of beetles on a mountain and we expect they are rare at low and high elevations but abundant at mid elevations.

```{r}
elev <- seq(from = 100, to = 2000, by = 50) # sample stations every 50 m elevation
intercept <- 3
b.elev <- 2
b.elev2 <- -1
error <- rnorm(length(elev), 0, 2.2)
count <- intercept + b.elev * elev + b.elev2 * elev ^ 2 + error

df <- data.frame(count, elev)
ggplot(df, aes(x = elev, y = count)) + geom_point()
```

Linear Regression

```{r}
lm.count <- lm(count ~ elev + I(elev ^ 2), data = df)
summary(lm.count)
```

Now let's make sure our models fit the assumptions of linear regression such as normally distributed error, homogeneity of variance. There are some tests for these but it's often best just to examine the residual plots.

```{r}
plot(lm.count)
```

```{r}
plot(m2)

ggplot(aes(x = fitted(m2), y = predict(m2))) + geom_point()
ggplot(aes(x = fitted(m2), y = resid(m2))) + geom_point()
```

## ANOVA

ANOVA is a bit tricky in R. It is different than in SAS. In R the order of the factors matters (equivalent to Type I ANOVA is SAS).

```{r}
a1 <- anova(mass ~ sex + plot, data = demo)
summary(a1)

a2 <- anova(mass ~ plot + sex, data = demo)
summary(a2)
```

The easiest way to get an ANOVA more inline with SAS is to use the `car` package which goes along with John Fox's book, "Companion to Applied Regression".

```{r}
library(car)
a1.car <- Anova(mass ~ sex + plot, data = demo)
summary(a1.car)

a2.car <- Anova(mass ~ plot + sex, data = demo)
summary(a2.car)
```



