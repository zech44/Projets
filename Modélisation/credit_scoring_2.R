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
url='credit.csv'


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
df$Loan.Status <- as.factor(df$Loan.Status)

#Table de fréquence de la variable cible ("Loan.Status")
print(prop.table(table(df$Loan.Status)))

#Diagramme à barre de loan_status
plot(df$Loan.Status, main="Statut de crédit")



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
cat_names <- setdiff(names(df_cat), "Loan.Status")

for (var in cat_names) {
  cat("\n\n-- Variable :", var, "--\n")
  tab <- table(df[[var]], df$Loan.Status)
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



#Fonction de construction d'un graphique montrant la relation entre une variable indépendante et la variable cible
show_relation <- function(data, feature, title_y) {
  ggplot(data, aes(x="", y=feature, fill = Loan.Status)) +
    geom_boxplot() +
    labs(x="", y=title_y)
}


#Histogramme et boite à moustache du Current.Loan.Amount vs Loan.Status
hist(df$Current.Loan.Amount, main="Histogramme du montant actuel du prêt")
show_relation(subset(df, df$Current.Loan.Amount < 5000000), subset(df, df$Current.Loan.Amount < 5000000)$Current.Loan.Amount, "Current.Loan.Amount")


#Histogramme et boite à moustache de Annual.Income vs Loan.Status
hist(df$Annual.Income, main="Histogramme du Revenu annuel")
show_relation(subset(df, df$Annual.Income < 5000000), subset(df, df$Annual.Income < 5000000)$Annual.Income, "Annual.Income")


#Histogramme et boite à moustache du Credit.Score
hist(df$Credit.Score, main="Histogramme du score de crédit")
show_relation(subset(df, df$Credit.Score < 5000), subset(df, df$Credit.Score < 5000)$Credit.Score, "Credit.Score")


#Histogramme et boite à moustache du Monthly.Debt
hist(df$Monthly.Debt, main="Histogramme de la dette mensuel")
show_relation(df, df$Monthly.Debt, "Monthly.Debt")


#Histogramme et boite à moustache de Years.of.Credit.History
hist(df$Years.of.Credit.History, main="Years.of.Credit.History")
show_relation(df, df$Years.of.Credit.History, "Years.of.Credit.History")


#Histogramme et boite à moustache de Number.of.Open.Accounts
hist(df$Number.of.Open.Accounts, main="Number.of.Open.Accounts")
show_relation(df, df$Number.of.Open.Accounts, "Number.of.Open.Accounts")


#Histogramme et boite à moustache du Number.of.Credit.Problems
hist(df$Number.of.Credit.Problems, main="Number.of.Credit.Problems")
show_relation(df, df$Number.of.Credit.Problems, "Number.of.Credit.Problems")


#Histogramme et boite à moustache du Current.Credit.Balance
hist(df$Current.Credit.Balance, main="Current.Credit.Balance")
show_relation(subset(df, df$Current.Credit.Balance < 5000000), subset(df, df$Current.Credit.Balance < 5000000)$Current.Credit.Balance, "Current.Credit.Balance")


#Histogramme et boite à moustache du Maximum.Open.Credit
hist(df$Maximum.Open.Credit, main="Maximum.Open.Credit")
show_relation(subset(df, df$Maximum.Open.Credit < 4000000), subset(df, df$Maximum.Open.Credit < 4000000)$Maximum.Open.Credit, "Maximum.Open.Credit")


#Histogramme et boite à moustache du Tax.Liens
hist(df$Tax.Liens, main="Tax.Liens")
show_relation(df, df$Tax.Liens, "Tax.Liens")


#Visualisation de la Variable Term
df %>%
  ggplot(aes(x = Term, fill = Term)) +
  geom_bar() +
  theme_bw()
#on discrétise maintenant le même graphique de Term selon la variable Loan.Status
df %>%
  ggplot(aes(x = Term, fill = Term)) +
  geom_bar() +
  theme_bw() +
  facet_wrap(~ Loan.Status, scale="free", ncol=2)


#Visualisation de la Variable Years.in.current.job
df %>%
  ggplot(aes(x = Years.in.current.job, fill = Years.in.current.job)) +
  geom_bar() +
  theme_bw()
#on discrétise maintenant le même graphique de Years.in.current.job selon la variable Loan.Status
df %>%
  ggplot(aes(x = Years.in.current.job, fill = Years.in.current.job)) +
  geom_bar() +
  theme_bw() +
  facet_wrap(~ Loan.Status, scale="free", ncol=2)


#Visualisation de la Variable Home.Ownership
df %>%
  ggplot(aes(x = Home.Ownership, fill = Home.Ownership)) +
  geom_bar() +
  theme_bw()
#on discrétise maintenant le même graphique de Home.Ownership selon la variable Loan.Status
df %>%
  ggplot(aes(x = Home.Ownership, fill = Home.Ownership)) +
  geom_bar() +
  theme_bw() +
  facet_wrap(~ Loan.Status, scale="free", ncol=2)


#Visualisation de la Variable Purpose
df %>%
  ggplot(aes(x = Purpose, fill = Purpose)) +
  geom_bar() +
  theme_bw()
#on discrétise maintenant le même graphique de Purpose selon la variable Loan.Status
df %>%
  ggplot(aes(x = Purpose, fill = Purpose)) +
  geom_bar() +
  theme_bw() +
  facet_wrap(~ Loan.Status, scale="free", ncol=2)


#Visualisation de la Variable Months.since.last.delinquent
df %>%
  ggplot(aes(x = Months.since.last.delinquent, fill = Months.since.last.delinquent)) +
  geom_bar() +
  theme_bw()
#on discrétise maintenant le même graphique de Months.since.last.delinquent selon la variable Loan.Status
df %>%
  ggplot(aes(x = Months.since.last.delinquent, fill = Months.since.last.delinquent)) +
  geom_bar() +
  theme_bw() +
  facet_wrap(~ Loan.Status, scale="free", ncol=2)


#Visualisation de la Variable Bankruptcies
df %>%
  ggplot(aes(x = Bankruptcies, fill = Bankruptcies)) +
  geom_bar() +
  theme_bw()
#on discrétise maintenant le même graphique de Bankruptcies selon la variable Loan.Status
df %>%
  ggplot(aes(x = Bankruptcies, fill = Bankruptcies)) +
  geom_bar() +
  theme_bw() +
  facet_wrap(~ Loan.Status, scale="free", ncol=2)






    #Nettoyage des données
#copie de la dataframe
df_clean <- df
#nombre de ligne dans df_clean
nrow(df_clean)
#ajustement des outliers par la méthode de l'IQR
index_outlier_loan_amount <- which(
  df_clean$Current.Loan.Amount < (quantile(df_clean$Current.Loan.Amount, 0.25, na.rm = TRUE) - 1.5 * IQR(df_clean$Current.Loan.Amount, na.rm = TRUE)) | 
    df_clean$Current.Loan.Amount > (quantile(df_clean$Current.Loan.Amount, 0.75, na.rm = TRUE) + 1.5 * IQR(df_clean$Current.Loan.Amount, na.rm = TRUE))
)

index_outlier_credit_score <- which(
  df_clean$Credit.Score < (quantile(df_clean$Credit.Score, 0.25, na.rm = TRUE) - 1.5 * IQR(df_clean$Credit.Score, na.rm = TRUE)) | 
    df_clean$Credit.Score > (quantile(df_clean$Credit.Score, 0.75, na.rm = TRUE) + 1.5 * IQR(df_clean$Credit.Score, na.rm = TRUE))
)

index_outlier_annual_income <- which(
  df_clean$Annual.Income < (quantile(df_clean$Annual.Income, 0.25, na.rm = TRUE) - 1.5 * IQR(df_clean$Annual.Income, na.rm = TRUE)) | 
    df_clean$Annual.Income > (quantile(df_clean$Annual.Income, 0.75, na.rm = TRUE) + 1.5 * IQR(df_clean$Annual.Income, na.rm = TRUE))
)

index_outlier_debt <- which(
  df_clean$Monthly.Debt < (quantile(df_clean$Monthly.Debt, 0.25, na.rm = TRUE) - 1.5 * IQR(df_clean$Monthly.Debt, na.rm = TRUE)) | 
    df_clean$Monthly.Debt > (quantile(df_clean$Monthly.Debt, 0.75, na.rm = TRUE) + 1.5 * IQR(df_clean$Monthly.Debt, na.rm = TRUE))
)

index_outlier_credit_balance <- which(
  df_clean$Current.Credit.Balance < (quantile(df_clean$Current.Credit.Balance, 0.25, na.rm = TRUE) - 1.5 * IQR(df_clean$Current.Credit.Balance, na.rm = TRUE)) | 
    df_clean$Current.Credit.Balance > (quantile(df_clean$Current.Credit.Balance, 0.75, na.rm = TRUE) + 1.5 * IQR(df_clean$Current.Credit.Balance, na.rm = TRUE))
)

index_outlier_max_open_cred <- which(
  df_clean$Maximum.Open.Credit < (quantile(df_clean$Maximum.Open.Credit, 0.25, na.rm = TRUE) - 1.5 * IQR(df_clean$Maximum.Open.Credit, na.rm = TRUE)) | 
    df_clean$Maximum.Open.Credit > (quantile(df_clean$Maximum.Open.Credit, 0.75, na.rm = TRUE) + 1.5 * IQR(df_clean$Maximum.Open.Credit, na.rm = TRUE))
)
#suppresion de ces lignes
df_clean <- df_clean[-index_outlier_loan_amount,]
df_clean <- df_clean[-index_outlier_credit_score,]
df_clean <- df_clean[-index_outlier_annual_income,]
df_clean <- df_clean[-index_outlier_debt,]
df_clean <- df_clean[-index_outlier_credit_balance,]
df_clean <- df_clean[-index_outlier_max_open_cred,]



#gestion des NA pour Credit.Score (non applicables)
index_NA_Credit.Score <- which(is.na(df_clean$Credit.Score))
df_clean$Credit.Score[index_NA_Credit.Score] <- median(df_clean$Credit.Score, na.rm = TRUE)
#pour Annual.Income
index_NA_Annual.Income <- which(is.na(df_clean$Annual.Income))
df_clean$Annual.Income[index_NA_Annual.Income] <- median(df_clean$Annual.Income, na.rm = TRUE)
#pour Months.since.last.delinquent
index_NA_Months.since.last.delinquent <- which(is.na(df_clean$Months.since.last.delinquent))
df_clean$Months.since.last.delinquent[index_NA_Months.since.last.delinquent] <- median(df_clean$Months.since.last.delinquent, na.rm = TRUE)
#pour Maximum.Open.Credit
index_NA_Maximum.Open.Credit <- which(is.na(df_clean$Maximum.Open.Credit))
df_clean$Maximum.Open.Credit[index_NA_Maximum.Open.Credit] <- median(df_clean$Maximum.Open.Credit, na.rm = TRUE)
#pour Tax.Liens
index_NA_Tax.Liens <- which(is.na(df_clean$Tax.Liens))
df_clean$Tax.Liens[index_NA_Tax.Liens] <- median(df_clean$Tax.Liens, na.rm = TRUE)
#pour Bankruptcies
index_NA_Bankruptcies <- which(is.na(df_clean$Bankruptcies))
df_clean$Bankruptcies[index_NA_Bankruptcies] <- median(df_clean$Bankruptcies, na.rm = TRUE)

#Vérification
print(summary(df_clean))





    #Préparation des données pour la phase de modélisation
#Normalisation des variables numériques
#créer une copie de df_clean
df_clean2 <- df_clean
#création d'une fonction de normalisation
normalize <- function(x) {
  return((x - min(x))/(max(x)-min(x)))
}

for (col in colnames(df_clean2)) {
  if (is.numeric(df_clean2[[col]])) {
    df_clean2[[col]] <- normalize(df_clean2[[col]])
  }
}
#vérification
head(df_clean2)



#séparation des données
set.seed(131)
index_train <- sample(1:nrow(df_clean2), 0.8 * nrow(df_clean2))
train_set <- df_clean2[index_train,]
test_set <- df_clean2[-index_train,]

print(nrow(train_set))
print(nrow(test_set))

prop.table(table(train_set$Loan.Status))
prop.table(table(test_set$Loan.Status))





#Création d'une fonction de construction de modèle de régression logistique
log_modeling <- function(train) {
  model <- glm(Loan.Status~ ., family = 'binomial', data = train )
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
  Conf_mat <- table(test_set$loan_status, predicted_status)
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
  seuils <- seq(0.10, 0.75, by=0.01)
  
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
