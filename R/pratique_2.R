getwd()
setwd("D:/Probabilité & statistique numérique")
don<-read.table("poulpe.csv",header = T, sep = ";")
summary(don)
aggregate(don$Poids, by=list(don$Sexe), FUN=summary)
tapply(don$Poids, don$Sexe, sd, na.rm=TRUE)
select.males <- don[,"Sexe"]=="Male"
shapiro.test(don[select.males, "Poids"])
select.femelle<- don[,"Sexe"]=="Femelle"
shapiro.test(don[select.femelle, "Poids"])
var.test(Poids~Sexe, conf.level=.95, data = don)

#-----------------------------------------------

t.test(Poids~Sexe, alternative="two.sided", conf.level=.95, var.equal=FALSE, data=don)
t.test(Poids~Sexe, alternative="greater", conf.level=.95, var.equal=FALSE, data=don)

#-----------------------------------------------

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
binom.test(x=592, n=1136, p=0.5, alternative = "two.sided")
prop.test(c(544, 97, 677, 451, 14), n=c(1136, 216, 1526, 955, 50))
