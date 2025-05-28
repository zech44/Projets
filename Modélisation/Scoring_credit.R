#importation des différentes librairies utiles
#install.packages("ggthemes")
#install.packages("pROC")
#install.packages("tidyverse")
#install.packages("ROSE")


#Chargement des différentes librairies
library(tidyverse)
library(ggthemes)
library(ROSE)
library(pROC)


#Paramétrage des sorties graphiques
options(repr.plot.width=6, repr.plot.height=4)
theme_set(theme_minimal())


#Récupération du dataset
url='https://github.com/JosueAfouda/Credit-Risk-Modeling/raw/master/data_credit.txt'


#Affectation de notre dataset à une variable manipulable df
df <- read.csv(url)


#Visualisation du contenu de notre variable df
head(df)
view(df) # autre méthode de visualisation


#Visualisation de la structure de notre dataframe df
str(df)


#Résumé statistique du contenu de notre dataframe
summary(df)


#Transformtion de la variable cible en variable catégorielle
df$loan_status <- as.factor(df$loan_status)

#Table de fréquence de la variable cible ("loan_status")
print(prop.table(table(df$loan_status)))

#Diagramme à barre de loan_status
plot(df$loan_status, main="Statut de crédit")


#Nuage de point entre la variable cible et la durée d'activité professionnelle
ggplot(df, aes(x=person_emp_length, y=loan_percent_income)) + 
  geom_point(aes(color=loan_status, shape = loan_status))

#Boite à moustache du loan_percent_income vs loan_status
ggplot(df, aes(x="", y=loan_percent_income, fill = loan_status)) +
  geom_boxplot() +
  labs(x="", y="loan_percent_income")

#Fonction de construction d'un graphique montrant la relation entre une variable indépendante et la variable cible
show_relation <- function(data, feature, title_y) {
  ggplot(data, aes(x="", y=feature, fill = loan_status)) +
    geom_boxplot() +
    labs(x="", y=title_y)
}

#loan_amnt vs loan_status
show_relation(df, df$loan_amnt, "loan_amnt")

#Histogramme de loan_amnt disrétisé par loan_status
ggplot(df, aes(x=loan_amnt)) +
  geom_histogram(color="red", fill="red", bins=50)+
  facet_wrap(~ loan_status, scales="free", ncol=2)

#Histogramme, nuage de points et boite à moustache du revenu annuel
hist(df$person_income, main="Histogramme du Revenu annuel")
plot(df$person_income, ylab ="Revenu annuel")
#show_relation(df, df$person_income, "person_income")
show_relation(subset(df, df$person_income < 100000), subset(df, df$person_income < 100000)$person_income, "person_income")

#histogramme et boite à moustache du taux d'intérêt des crédits (loan_int_rate)
hist(df$loan_int_rate, main = "Taux d'intérêt")
show_relation(df, df$loan_int_rate, "loan_int_rate")

#Histogramme et boite à moustache de person_emp_length
hist(df$person_emp_length, main="person_emp_length")
show_relation(df, df$person_emp_length, "person_emp_length")

#Variable age (person_age)
hist(df$person_age, main="person_age")
show_relation(df, df$person_age, "person_age")

#Variable person_home_ownership
df %>%
  ggplot(aes(x = person_home_ownership, fill = person_home_ownership)) +
  geom_bar() +
  theme_bw()
#on discrétise maintenant le même truc
df %>%
  ggplot(aes(x = person_home_ownership, fill = person_home_ownership)) +
  geom_bar() +
  theme_bw() +
  facet_wrap(~ loan_status, scale="free", ncol=2)


#Variable motif du prêt
df %>%
  ggplot(aes(x = loan_intent, fill = loan_intent)) +
  geom_bar() +
  theme_bw()

df %>%
  ggplot(aes(x = loan_intent, fill = loan_intent)) +
  geom_bar() +
  theme_bw() +
  facet_wrap(~ loan_status, scale="free", ncol=2)


#Nettoyage des données
#copie de la dataframe
df_clean <- df
#nombre de ligne dans df_clean
nrow(df_clean)
#ajustement des outliers par la méthode de l'IQR
index_outlier_income <- which(df_clean$person_income < quantile(df_clean$person_income, 0,25) - 1.5 * IQR(df_clean$person_income) | df_clean$person_income > quantile(df_clean$person_income,0.75) + 1.5 * IQR(df_clean$person_income))
#suppresion de ces lignes
df_clean <- df_clean[-index_outlier_income,]
#vérification en traçant l'histogramme du revenu annuel
hist(df_clean$person_income, main = "Histogramme du revenu annuel")


#suppression des valeurs abberantes au niveau de la variable person_age
df_clean <- subset(df_clean, df_clean$person_age < 100)
nrow(df_clean)


#gestion des NA pour person_emp_length (non applicables)
index_NA_person_emp_length <- which(is.na(df_clean$person_emp_length))
df_clean$person_emp_length[index_NA_person_emp_length] <- median(df_clean$person_emp_length, na.rm = TRUE)
#pour loan_int_rate
index_NA_loan_int_rate <- which(is.na(df_clean$loan_int_rate))
df_clean$loan_int_rate[index_NA_loan_int_rate] <- median(df_clean$loan_int_rate, na.rm = TRUE)

#Vérification
print(summary(df_clean$person_emp_length))
print(summary(df_clean$loan_int_rate))


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

prop.table(table(train_set$loan_status))
prop.table(table(test_set$loan_status))



#Résolution du problème de déséquilibre des classes
nrow(subset(train_set, train_set$loan_status == 0))
nrow(subset(train_set, train_set$loan_status == 1))

#méthode de sur-échantillonage
train_oversampled <- ovun.sample(formula = loan_status~ ., data = train_set, method = 'over', seed = 131)
print(class(train_oversampled))
print(summary(train_oversampled))
#nouvelle dataframe
train_oversampled_df <- train_oversampled$data
#visualisation et vérification
head(train_oversampled_df)
prop.table(table(train_oversampled_df$loan_status))

#méthode de sous-échantillonage
train_undersampled <- ovun.sample(formula = loan_status~ ., data = train_set, method = 'under', seed = 131)
print(class(train_undersampled))
print(summary(train_undersampled))
#nouvelle dataframe
train_undersampled_df <- train_undersampled$data
#visualisation et vérification
head(train_undersampled_df)
prop.table(table(train_undersampled_df$loan_status))

#méthode combinée (under et over)
train_ros_rus <- ovun.sample(formula = loan_status~ ., data = train_set, method = 'both', N = 12000, seed = 131 )
train_ros_rus_df <- train_ros_rus$data
prop.table(table(train_ros_rus_df$loan_status))




#Création d'une fonction de construction de modèle de régression logistique
log_modeling <- function(train) {
  model <- glm(loan_status~ ., family = 'binomial', data = train )
  return(model)
}
log_model <- log_modeling(train_set)
summary(log_model)

#prédiction de valeurs
preds_log <- predict(log_model, newdata = test_set, type = 'response')
head(preds_log)


#Définition d'un seuil
seuil <- 0.3
#Conversion des probabilités en résultats (0 ou 1) de la variable loan_status
preds_status <- ifelse(preds_log > seuil, 1, 0)
#matrice de confusion
conf_mat <- table(test_set$loan_status, preds_status)
print(conf_mat)

#composants de la matrice de confusion
TN <- conf_mat[1,1]
FN <- conf_mat[2,1]
FP <- conf_mat[1,2]
TP <- conf_mat[2,2]

#Score de classification
accuracy <- (TP + TN) / nrow(test_set)
print(accuracy)
# seuil de 0.5 , accuracy = 86,22%
# seuil de 0.4 , accuracy = 85,61%
# seuil de 0.3 , accuracy = 84%

#Sensibilité
sensitivity <- TP / (FN + TP)
print(sensitivity)
# seuil de 0.5 , sensitivity = 56,6%
# seuil de 0.4 , sensitivity = 64,31%
# seuil de 0.3 , sensitivity = 72,36%

#Spécificité du model
specificity <- TN / (TN + FP)
print(specificity)
# seuil de 0.5 , specificity = 95,15%
# seuil de 0.4 , specificity = 92,03%
# seuil de 0.3 , specificity = 87,51%


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
  seuils <- seq(0.01, 0.99, by=0.01)
  
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













