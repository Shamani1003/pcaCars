data("mtcars")

pcaCars <- princomp(mtcars,cor=TRUE)

summary(pcaCars)

plot(pcaCars)

carHC <- hclust(dist(pcaCars$scores),method="ward.D2")

plot(carHC)

carsClusters <- cutree(carHC,k=3)

carsDf <- data.frame(pcaCars$scores,"cluster"=factor(carsClusters))
str(carsDf)

library(ggplot2)
library(ggrepel)

ggplot(carsDf,aes(x=Comp.1, y=Comp.2)) +
  geom_text_repel(aes(label = rownames(carsDf))) +
  geom_point(aes(colour=cluster), alpha=0.5, size=3)
 