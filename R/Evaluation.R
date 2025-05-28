#Première partie
#Exercice n°1
#a) Calculez votre IMC en utilisant directement la valeur de votre poids et de votre taille:
(IMC<-(74/1.84**2))

#b) Calculez votre IMC à partir de "monPoids" et de "maTaille":
monPoids <- 74 #en kilogrammes
maTaille <- 1.84 # en metre
IMC <- monPoids / (maTaille ** 2)
IMC


#Exercice n°2
# Enregistrez le montant de votre budget dans la variable "monBudget":
monBudget <- 300
#a)VTT à 260 euros, un casque à 30 euros et une veste polaire à 60 euros. Pouvez-vous réaliser cet achat ?
prixVTT <- 260
prixCasque <- 30
prixVestep <- 60
prixTotal1 <- prixVTT + prixCasque + prixVestep
#Vérifions que cet achat peut, oui ou non ,être réalisé
ifelse(monBudget >= prixTotal1, print("Cet achat peut-être réalisé"), print("Cet achat ne peut-être réalisé"))
#ainsi, le code nous dit que cet achat ne peut-être réalisé

#b)Le vendeur vous propose gratuitement la veste polaire si vous achetez le VTT et le casque de suite. Pouvez-vous réaliser cet achat ?
prixTotal2 <- prixVTT + prixCasque

#Vérifions que cet achat peut, oui ou non ,être réalisé
ifelse(monBudget >= prixTotal2, print("Cet achat peut-être réalisé"), print("Cet achat ne peut-être réalisé"))
#ainsi, le code nous dit que cet achat peut-être réalisé

#c)Quel sera le montant total de la réduction ? Quelle est l’offre la plus intéressante ? 
reduction <- 0.30 * prixTotal1
#affichage du montant total de la réduction avec la fonction "cat()"
cat("Le montant total de la reduction est : ",reduction,"\n")

#calculons l'offre avec la réduction
(prixTotal3 <- prixTotal1 - reduction)

#comparons les offres:
ifelse(prixTotal2 >= prixTotal3, print("L'offre avec la réduction de 30% est la meilleur"), print("L'offre précédente, sans remise est la meilleure"))

#d)Après l'achat, combien d'argent vous reste-t-il ?
(monBudget <- monBudget - prixTotal3)



#Exercice n°3
#a) Rentrons les valeurs dans les variables ccont et exam
(ccont <- c(11, 13, 15.5, 12, 8, 9, 13, 16))
(exam <- c(8.5, 14, 15, 10, 12, 13, 14, 17))

#b) Quelle est la note finale à l'UE de chaque étudiant ?
#Calcul de la note finale
(note_UE <- 0.4 * ccont + 0.6 * exam)

#c) Quelle est la note au control continue, à l'examen et à l'UE pour l'étudiant numéro 6 ?
# Notes pour l'étudiant numéro 6
cat("La note au controle continue de l'étudiant 6 est : ",ccont[6],"\n")
cat("La note a l'examen de l'étudiant 6 est : ",exam[6],"\n")
cat("La note a l'UE de l'étudiant 6 est : ",note_UE[6],"\n")

#d) Calculons les moyennes. Quelle est la note la plus élevée à l’UE ? La note la plus basse ?
# Moyenne au contrôle continue
cat("La moyenne au controle continue est : ",mean(ccont),"\n")
# Moyenne à l'examen
cat("La moyenne a l'examen est : ",mean(exam),"\n")
# Moyenne à l'UE
cat("La note au controle continue est : ",mean(note_UE),"\n")

# La note la plus élevée à l'UE
cat("La note la plus élevé à l'UE est : ",max(note_UE),"\n")

# La note la plus basse à l'UE
cat("La note la plus basse a l'UE est : ",min(note_UE),"\n")


#Exercice n°4
(df <- read.csv("chuteurs_Examen.csv",sep=";"))
#a). Quelle est la nature des variables étudiées ?
str(df)
#b). Analysez la variable sexe (paramètres statistiques descriptifs et au moins une représentation graphique).
#statistique descriptive
library(fBasics)
summary(df$sexe)

# Représentation graphique
library(ggplot2)
ggplot(df, aes(x = sexe)) +geom_bar() +
  labs(title = "Distribution de la variable sexe", x = "Sexe", y = "Nombre")
#c). Analysez la variable age (paramètres statistiques descriptifs et au moins une représentation graphique). 
basicStats(df$age)

# Représentation graphique
library(ggplot2)
ggplot(df, aes(x = age)) +
  geom_histogram(binwidth = 4, fill = "blue", color = "black") +
  labs(title = "Distribution de la variable age", x = "Age", y = "Nombre")

#d). Réalisez l’histogramme de l’age en choisissant les intervalles suivants:[65, 75], ]75, 85], ]85, 100].
# Créer les intervalles
breaks <- c(65, 75, 85, 100)
# Histogramme
ggplot(df, aes(x = age)) +
  geom_histogram(breaks = breaks, fill = "green", color = "black") +
  labs(title = "Histogramme de l'âge", x = "Age", y = "Nombre")

#Exercice n°5
#a).Décrivez la variable age en fonction du statut de la variable chute. 
by(df$age, df$chute, summary)

#b). Construisez l’histogramme de l’âge des patients pour chaque niveau de la variable chute.
library(ggplot2)
ggplot(df, aes(x = age, fill = chute)) +
  geom_histogram(position = "dodge", binwidth = 5) +
  labs(title = "Histogramme de l'âge par niveau de chute", x = "Age", y = "Nombre")

#c). Donnez la représentation sous la forme d’une boîte à moustache de l’âge en fonction du niveau de la variable chute. 
ggplot(df, aes(x = chute, y = age)) +geom_boxplot() +
  labs(title = "Boîte à moustache de l'âge par niveau de chute", x = "Chute", y = "Age")

#Exercice n°6
#a). Donnez le tableau de contingence des fréquences absolues du mode de vie (mode2vie) en fonction de la notion de chute (chute). 
(table_cont <- table(df$mode2vie, df$chute))
#b). Donnez les fréquences relatives des chuteurs et non chuteurs (chute) selon leur mode de vie (mode2vie)
frequences_relatives <- prop.table(table_cont)
frequences_relatives

#Exercice n°7
#a). Représentez graphiquement la consommation de médicaments en fonction 
#de l’âge des patients
ggplot(df, aes(x = age, y = nbmedic)) +geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Consommation de médicaments en fonction de l'âge", x = "Age",
       y = "Nombre de médicaments")



#Exercice n°8
# Écrivez un script R pour calculer la somme des nombres pairs dans un vecteur donné. 
Vecteur <- c(1, 2, 3, 4, 5, 6, 7)
Somme <-  0
for (nombre in vecteur) {
  if (nombre %% 2==0) {
  somme <- somme + nombre
  }
}
