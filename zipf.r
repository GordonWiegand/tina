setwd("/Volumes/hd2/privat/tina/tinaStat")
library(ggplot2)
d <- read.csv("test.csv")

d$pHut <- 1/(d$rank*log(1.78*sum(d$freq)))*sum(d$freq)

d <- d[1:100,]

d0 <-
    data.frame(Rang=rep(1:nrow(d),2),Anzahl=c(d$freq,d$pHut),Legende=c(rep("tatsächlich",nrow(d)),rep("geschätzt",nrow(d))))
p <- ggplot(data=d0, aes(,x=Rang, y=Anzahl,  colour=Legende)) + geom_line()
ggsave("zipfAlle.pdf",plot=p,dpi=900)


