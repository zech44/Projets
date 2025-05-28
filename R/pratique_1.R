getwd()
setwd("D:/Probabilité & statistique numérique")
don<-read.table("poulpeF.csv",header = T)
summary(don)
mean(don$Poids)
sd(don$Poids)
hist(don$Poids,main="Distribution des poids",nclass=12,freq=FALSE,xlab="Poids",ylab="")
lines(density(don$Poids),col="red")
require(ggplot2)
ggplot(don)+aes(x=Poids,y=..density..)+geom_histogram(bins=12)+ylab("")+geom_line(stat="density",col="red")+ggtitle("Distribution des poids")
t.test(don$Poids,conf.level=0.95)$conf.int
View(don)


#test de Khi deux 
tab<-matrix(c(592,544,119,97,849,677,504,451,36,14),ncol = 5)
rownames(tab)<-c("garcon","fille")
colnames(tab)<-c("blond","roux","chatain","brun","noir de jais")
par(nfrow=c(2,1))
couleur<-c("gold","orangered","goldenrod","brown","black")
par(mar=c(1,1,1,1))
barplot(tab[1,],main="garcon",col=couleur)
barplot(tab[2,],main="fille",col=couleur)
round(100*prop.table(tab,margin = 1),1)
round(100*prop.table(tab,margin = 2),1)
resultat<-chisq.test(tab)
resultat
names(resultat)
round(100*resultat$residual^2/resultat$statistic)
