getwd()
setwd("D:/Probabilité & statistique numérique")
#-----------------------------------------------
ozone_data <- read.table("ozone.txt", header = TRUE)
ozone.m <- ozone_data[, 1:11]
summary(ozone.m)
reg.mul <- lm(maxO3~., data=ozone.m)
summary(reg.mul)
#---------------------------------------------------
install.packages("leaps")
library(leaps)
choix <- regsubsets(maxO3~., data=ozone.m, nbest=1, nvmax=11)
plot(choix, scale='bic')
reg.fin <- lm(maxO3~T12 + ne9 + vx9 + maxO3v, data = ozone.m)
summary(reg.fin)