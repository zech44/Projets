      #Séance d'application | séance du 27/09/24

v3=1:9
mat1=matrix(v3,3,3,byrow = TRUE)
mat1
dim(mat1);mode(mat1)
mat1[1:2,1:2]
mat1[:,1:2]


      #Séance d'application | séance du 27/09/24

#Les Opérateurs Arithmétiques
c(1, 2, 3) + c(4, 5, 6)
1:3 * 4:6
1:10 + 2
1:10 + rep(2, 10)
1:10 + 1:5 + c(2, 4) # vecteurs recyclés 2 et 5 fois
1:10 + rep(1:5, 2) + rep(c(2, 4), 5) # équivalent
1:10 + c(2, 4, 6)

#Manipulation de vecteurs
seq(1, 9, by = 2)
seq_len(10)
rep(2, 10)
sort(c(4, -1, 2, 6))
rank(c(4, -1, 2, 6))
order(c(4, -1, 2, 6))
rev(1:10)
head(1:10, 3); head(1:10, -3)
tail(1:10, 3); tail(1:10, -3)
unique(c(2, 4, 2, 5, 9, 5, 0))

#Recherche d'éléments dans un vecteur
x <- c(4, -1, 2, -3, 6)
which(x < 0)
ind<-which(x < 0)
x[ind]
match(2, x)
-1:2 %in% x

#Arrondi
x<-c(-3.6800000, -0.6666667, 3.1415927, 0.3333333)
round(x)
round(x, 3)
floor(x)
ceiling(x)
trunc(x)

#Sommaires et statistiques descriptives
x<-c(14, 17, 7, 9, 3, 4, 25, 21, 24, 11)
sum(x); prod(x)
diff(x)
mean(x)
var(x)
min(x); max(x)
range(x)
median(x)
quantile(x)
summary(x)
search()
install.packages("fBasics")
require(fBasics) #ou library(fBasics)
basicStats(x)
t(basicStats(x))
install.packages("numbers")
