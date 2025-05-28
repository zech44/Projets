#exercice 1
#Écrire une expression R pour créer la liste
x=list(1:5,data=matrix(1:6,2,3,F),c(0,0,0),test=c(F,F,F,F))
# Extraire les étiquettes de la liste.
names(x)
#Trouver le mode et la longueur du quatrième élément de la liste
mode(x$test)
length(x$test)
# Extraire les dimensions du second élément de la liste
dim(x$data)
#Extraire les deuxième et troisième élément du second élément de la liste.
x$data[, 2:3]
# Remplacer le troisième élément de la liste par le vecteur 3:8.
v=3:8
x[[3]] <- v
x
#-------------------------------------------------------------------------
#exrcice 2
x<-c(1,18,2,1,5,2,6,1,12,3,13,8,20,1,5,7,7,4,14,10)
x
#a)deuxième élément de l’échantillon
x[2]
#b)cinq premiers éléments de l’échantillon.
x[1:5]
#c)éléments strictement supérieurs à 14.
x[x>14]
#d)les éléments sauf les éléments en positions 6, 10 et 12.
e<-x[-c(6,10,12)]
e
#-------------------------------------------------------------------------
#exercice 3
x <- matrix(sample(1:100, 70), 7, 10)
x
#a) L’élément (4, 3).
x[4,3]

#b) Le contenu de la sixième ligne.
x[6,]

#c) Les première et quatrième colonnes (simultanément)
x[,c(1,4)]

#d) Les lignes dont le premier élément est supérieur à 50
x[x[,1]>50]
x[x[, 1] > 50, ]


