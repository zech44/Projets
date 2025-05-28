getwd()
setwd("D:/Probabilité & statistique numérique")
#-----------------------------------------------
ozone_data <- read.table("ozone.txt", header = TRUE)
summary(ozone_data[c("maxO3", "T12")])
plot(maxO3~T12,data=ozone_data,pch=15,cex=.5)
reg.s <- lm(maxO3~T12,data=ozone_data)
summary(reg.s)
names(reg.s)
reg.s$coef
plot(maxO3~T12,data=ozone_data,pch=15,cex=.5)
grillex <- seq(min(ozone_data[,"T12"]),max(ozone_data[,"T12"]),length=100)
grilley <- reg.s$coef[1]+reg.s$coef[2]*grillex
lines(grillex,grilley,col=2)
#-------------------------------------------------------------------------------
xnew<-19
xnew<- as.data.frame(xnew)
colnames(xnew)<-"T12"
predict(reg.s,xnew,interval="pred")