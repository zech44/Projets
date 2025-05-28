#importation des différentes librairies utiles
#install.packages("ggthemes")
#install.packages("tidyverse")
#install.packages("ROSE")
#install.packages("pROC")
#install.packages("corrplot")



#Chargement des différentes librairies
library(tidyverse)
library(ggthemes)
library(ROSE)
library(pROC)
library(corrplot)



#Paramétrage des sorties graphiques
options(repr.plot.width=6, repr.plot.height=4)
theme_set(theme_minimal())


#Récupération du dataset dans le répertoire
url='Loan_default.csv'


#Affectation de notre dataset à une variable manipulable df
df <- read.csv(url, sep = ";")


#Visualisation du contenu de notre variable df
head(df)
view(df) # autre méthode de visualisation


#Visualisation de la structure de notre dataframe df
str(df)


#Résumé statistique du contenu de notre dataframe
summary(df)


#Transformtion de la variable cible en variable catégorielle
df$Default <- as.factor(df$Default)

#Table de fréquence de la variable cible ("Default")
print(prop.table(table(df$Default)))

#Diagramme à barre de Default
plot(df$Default, main="Statut du crédit")


#Fonction de construction d'un graphique montrant la relation entre une variable indépendante et la variable cible
show_relation <- function(data, feature, title_y) {
  ggplot(data, aes(x="", y=feature, fill = Default)) +
    geom_boxplot() +
    labs(x="", y=title_y)
}


#Nuage de point entre la variable cible et la durée d'activité professionnelle
ggplot(df, aes(x=MonthsEmployed, y=DTIRatio)) + 
  geom_point(aes(color=Default, shape = Default))

#Boite à moustache du DTIRation vs Default
show_relation(df, df$DTIRatio, 'DTIRatio')


#LoanAmount vs Default
show_relation(df, df$LoanAmount, "LoanAmount")

#Histogramme de LoanAmount disrétisé par Default
ggplot(df, aes(x=LoanAmount)) +
  geom_histogram(color="red", fill="red", bins=50)+
  facet_wrap(~ Default, scales="free", ncol=2)

#Histogramme et boite à moustache du revenu annuel
hist(df$Income, main="Histogramme du Revenu annuel")
show_relation(df, df$Income, "Income")

#histogramme et boite à moustache du taux d'intérêt des crédits (InterestRate)
hist(df$InterestRate, main = "Taux d'intérêt")
show_relation(df, df$InterestRate, "InterestRate")

#Histogramme et boite à moustache de MonthsEmployed
hist(df$MonthsEmployed, main="MonthsEmployed")
show_relation(df, df$MonthsEmployed, "MonthsEmployed")


#Histogramme et boite à moustache de CreditScore
hist(df$CreditScore, main="CreditScore")
show_relation(df, df$CreditScore, "CreditScore")


#Histogramme et boite à moustache de NumCreditLines
hist(df$NumCreditLines, main="NumCreditLines")
show_relation(df, df$NumCreditLines, "NumCreditLines")


#Histogramme et boite à moustache de LoanTerm
hist(df$LoanTerm, main="LoanTerm")
show_relation(df, df$LoanTerm, "LoanTerm")


#Histogramme et boite à moustache de l'age (Age)
hist(df$Age, main="Age")
show_relation(df, df$Age, "Age")

#Visualisation de la Variable HasMortgage
df %>%
  ggplot(aes(x = HasMortgage, fill = HasMortgage)) +
  geom_bar() +
  theme_bw()
#on discrétise maintenant le même graphique de HasMortgage selon la variable Default
df %>%
  ggplot(aes(x = HasMortgage, fill = HasMortgage)) +
  geom_bar() +
  theme_bw() +
  facet_wrap(~ Default, scale="free", ncol=2)


#Visualisation de la Variable HasDependents
df %>%
  ggplot(aes(x = HasDependents, fill = HasDependents)) +
  geom_bar() +
  theme_bw()
#on discrétise maintenant le même graphique de HasDependents selon la variable Default
df %>%
  ggplot(aes(x = HasDependents, fill = HasDependents)) +
  geom_bar() +
  theme_bw() +
  facet_wrap(~ Default, scale="free", ncol=2)


#Visualisation de la Variable HasCoSigner
df %>%
  ggplot(aes(x = HasCoSigner, fill = HasCoSigner)) +
  geom_bar() +
  theme_bw()
#on discrétise maintenant le même graphique de HasCoSigner selon la variable Default
df %>%
  ggplot(aes(x = HasCoSigner, fill = HasCoSigner)) +
  geom_bar() +
  theme_bw() +
  facet_wrap(~ Default, scale="free", ncol=2)


#Visualisation du motif du prêt (LoanPurpose)
df %>%
  ggplot(aes(x = LoanPurpose, fill = LoanPurpose)) +
  geom_bar() +
  theme_bw()

df %>%
  ggplot(aes(x = LoanPurpose, fill = LoanPurpose)) +
  geom_bar() +
  theme_bw() +
  facet_wrap(~ Default, scale="free", ncol=2)



#Visualisation de l'état civil (MaritalStatus)
df %>%
  ggplot(aes(x = MaritalStatus, fill = MaritalStatus)) +
  geom_bar() +
  theme_bw()

df %>%
  ggplot(aes(x = MaritalStatus, fill = MaritalStatus)) +
  geom_bar() +
  theme_bw() +
  facet_wrap(~ Default, scale="free", ncol=2)


#Visualisation du type d'emploi (EmploymentType)
df %>%
  ggplot(aes(x = EmploymentType, fill = EmploymentType)) +
  geom_bar() +
  theme_bw()

df %>%
  ggplot(aes(x = EmploymentType, fill = EmploymentType)) +
  geom_bar() +
  theme_bw() +
  facet_wrap(~ Default, scale="free", ncol=2)


#Visualisation de l'Education
df %>%
  ggplot(aes(x = Education, fill = Education)) +
  geom_bar() +
  theme_bw()

df %>%
  ggplot(aes(x = Education, fill = Education)) +
  geom_bar() +
  theme_bw() +
  facet_wrap(~ Default, scale="free", ncol=2)




#Test de Fisher, de khi-2 et heat map
#Création d'une nouvelle dataframe contenant toutes les variables numériques
index_num <- names(df)[sapply(df, is.numeric)]
df_num <- df[index_num]
head(df_num)
#Calculer la matrice de corrélation
matrice_correlation <- cor(df_num, use = "complete.obs")
#Créer la heatmap de corrélation avec des coefficients plus visibles
corrplot(matrice_correlation, method = "color", type = "upper", order = "hclust",
         tl.col = "black", tl.srt = 45, 
         addCoef.col = "black", 
         cl.pos = "n",
         cl.cex = 1.2, 
         addCoefasPercent = TRUE, 
         number.cex = 0.8)


index_cat <- names(df)[!sapply(df, is.numeric)]
df_cat <- df[index_cat]
head(df_cat)
cat_names <- setdiff(names(df_cat), "Default")

for (var in cat_names) {
  cat("\n\n-- Variable :", var, "--\n")
  tab <- table(df[[var]], df$Default)
  print(tab)
  
  # Choix du test statistique selon les conditions du tableau croisé
  if (all(chisq.test(tab)$expected > 5)) {
    cat("Test du Chi-2\n")
    print(chisq.test(tab))
  } else {
    cat("Test de Fisher\n")
    print(fisher.test(tab))
  }
}



    #Préparation des données pour la phase de modélisation
#Normalisation des variables numériques
#création d'une copie de df
df1 <- df
#création d'une fonction de normalisation
normalize <- function(x) {
  return((x - min(x))/(max(x)-min(x)))
}

for (col in colnames(df1)) {
  if (is.numeric(df1[[col]])) {
    df1[[col]] <- normalize(df1[[col]])
  }
}
#vérification
head(df1)



#séparation des données pour le train et le test
set.seed(131)
index_train <- sample(1:nrow(df1), 0.8 * nrow(df1))
train_set <- df1[index_train,]
test_set <- df1[-index_train,]
#Affichage du nombre de ligne obtenue pour le train et le test
print(nrow(train_set))
print(nrow(test_set))
#vérification des proportions de classes
prop.table(table(train_set$Default))
prop.table(table(test_set$Default))


#Création d'une fonction de construction de modèle de régression logistique
log_modeling <- function(train) {
  model <- glm(Default~ ., family = 'binomial', data = train )
  return(model)
}
log_model <- log_modeling(train_set)
summary(log_model)

#prédiction de valeurs
preds_log <- predict(log_model, newdata = test_set, type = 'response')
head(preds_log)




#construction d'une fonction d'évaluation du modèle
model_evaluation <- function(Model, Seuil) {
  predictions <- predict(Model, newdata = test_set, type='response')
  predicted_status <- ifelse(predictions > Seuil, 1, 0)
  Conf_mat <- table(test_set$Default, predicted_status)
  Accuracy <- (Conf_mat[2,2] + Conf_mat[1,1]) / nrow(test_set)
  Sensitivity <- Conf_mat[2,2] / (Conf_mat[2,2] + Conf_mat[2,1])
  Specificity <- Conf_mat[1,1] / (Conf_mat[1,1] + Conf_mat[1,2])
  One_minus_spec <- 1 - Specificity
  
  results <- list(Conf_mat, Accuracy, Sensitivity, Specificity, One_minus_spec)
  names(results) <- c('Matrice de confusion', 'Score de classification', 'Sensibilité du model', 
                      'Spécificité du model', 'One minus specificity')
  return(results)
}
#vérification de la fonction d'évaluation
print(model_evaluation(log_model,0.3))


#création d'une fonction d'affichage des résultats du model pour divers seuils
print_results <- function(Model) {
  #définition des seuils
  seuils <- seq(0.05, 0.75, by=0.01)#En cas d'erreur, modifier les valeurs 
                                    #en les rapprochants un peu plus de 0,5
  
  #vecteurs vides pour stocker les métriques d'évaluation du modèle pour divers seuils
  acc_model <- c()
  sens_model <- c()
  spec_model <- c()
  one_minus_spec_model <- c()
  
  for (i in seuils) {
    r <- model_evaluation(Model, i)
    acc_model <- append(acc_model, r[['Score de classification']])
    sens_model <- append(sens_model, r[['Sensibilité du model']])
    spec_model <- append(spec_model, r[['Spécificité du model']])
    one_minus_spec_model <- append(one_minus_spec_model, r[['One minus specificity']])
  }
  
  #Dataframe des métriques pour divers seuils
  resultats <- data.frame(cbind(seuils,acc_model, sens_model, spec_model, one_minus_spec_model))
  
  #Graphiques montrant les métriques pour différents seuils
  plots <- ggplot()+
            geom_line(data = resultats, aes(x = seuils, y = acc_model, colour = 'red')) +
            geom_line(data = resultats, aes(x = seuils, y = sens_model, colour = 'green')) +
            geom_line(data = resultats, aes(x = seuils, y = spec_model, colour = 'blue')) +
            labs(x= 'Seuil', y='Score') +
            scale_color_discrete(name='Métriques', labels=c("Accuracy", "Sensitivity", "Specificity"))
            
  #Courbe ROC
  roc_curve <- ggplot() +
                  geom_line(data = resultats, aes(x = one_minus_spec_model, y=sens_model)) +
                  labs(x='1-Specificity', y='Sensitivity')
  
  #résultats de la fonction
  all_results <- list(resultats, plots, roc_curve)
  names(all_results) <- c('Metrics', 'Plot', 'ROC Curve')
  
  return(all_results)
}
#Métriques de log_model pour différents seuils
head(print_results(log_model)[['Metrics']])
tail(print_results(log_model)[['Metrics']])
#Graphique montrant les métriques de log_model pour diverses seuils
print_results(log_model)[['Plot']]



#courbe ROC de log_model
print_results(log_model)[['ROC Curve']]


#AUC vs seuils de log_model
auc_model <- function(model) {
  predictions <- predict(model, newdata=test_set, type='response')
  return(auc(roc(test_set$Default, predictions)))
}

print(auc_model(log_model))










