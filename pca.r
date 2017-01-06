data("mtcars")

pcaCars <- princomp(mtcars,cor=TRUE)

names(pcaCars)

summary(pcaCars)

plot(pcaCars)