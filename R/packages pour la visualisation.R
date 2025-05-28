install.packages("ggplot2")
install.packages("lattice")
install.packages("plotly")
install.packages("shiny")

#1)Présentation des Packages de Visualisation en R

#ggplot2
#exemple pratique: Imaginons que tu souhaites visualiser les ventes mensuelles d'une entreprise. Voici 
#un exemple de graphique de série temporelle avec ggplot2.
library(ggplot2)
sales_data <- data.frame( 
  month = 1:12, 
  sales = c(120, 150, 130, 160, 180, 170, 200, 210, 230, 220, 190, 250) 
) 
ggplot(sales_data, aes(x = month, y = sales)) + geom_line(color = "blue") +  
  geom_point(size = 3) + labs(title = "Évolution des ventes mensuelles", x = 
                                "Mois", y = "Ventes") + theme_minimal()

#Cas pratique : Dans le secteur financier, un nuage de points (scatter plot) peut être utilisé pour 
#montrer la relation entre la rentabilité et le risque d'actions. Voici un code de base 
#pour cette visualisation : 
library(ggplot2)
stock_data <- data.frame(risk = rnorm(100, mean = 5, sd = 2), return = 
                           rnorm(100, mean = 10, sd = 5), sector = sample(c("Tech", "Health", 
                                                                            "Finance"), 100, replace = TRUE) 
) 
ggplot(stock_data, aes(x = risk, y = return, color = sector)) + 
  geom_point(size = 3) + labs(title = "Risque vs Rendement par secteur", x = 
                                "Risque", y = "Rendement") + theme_minimal()

#lattice
#Exemple pratique : Voici un exemple de visualisation montrant la croissance des plantes sous différentes 
#conditions d'éclairage et d'irrigation avec le package lattice :

library(lattice) 
plant_data <- data.frame(height = rnorm(100, mean = 50, sd = 10), light = factor(rep(c("Faible", "Modérée", "Forte"), times = c(33,33, 34))), water = factor(rep(c("Peu", "Moyenne", "Beaucoup"), each = 33)))

# Générer les données
plant_data <- data.frame(
  height = rnorm(100, mean = 50, sd = 10), 
  light = factor(rep(c("Faible", "Modérée", "Forte"), length.out = 100)), 
  water = factor(rep(c("Peu", "Moyenne", "Beaucoup"), length.out = 100))
)

# Créer le graphique avec xyplot
xyplot(height ~ light | water, data = plant_data, 
       main = "Croissance des plantes selon la lumière et l'eau", 
       xlab = "Niveau de lumière", ylab = "Hauteur des plantes")




#cas pratique: Dans le domaine de la santé, un chercheur pourrait visualiser la répartition des 
#niveaux de cholestérol selon l'âge et le sexe. Voici comment un graphique en treillis 
#peut être créé pour comparer ces groupes :

health_data <- data.frame( 
  age = rep(1:100, times = 3), 
  cholesterol = rnorm(300, mean = 200, sd = 30), 
  gender = rep(c("Homme", "Femme"), each = 150)) 
xyplot(cholesterol ~ age | gender, data = health_data,  
       type = "p", col = "blue", 
       main = "Niveaux de cholestérol par âge et genre", 
       xlab = "Âge",  
       ylab = "Cholestérol")


#plotly
#Exemple pratique : Supposons que tu présentes les performances de différentes stratégies 
#d'investissement. Voici un exemple de graphique interactif avec plotly. 

library(plotly) 
investment_data <- data.frame(time = 1:12, strategy_A = c(5, 10, 15, 20, 
18, 25, 30, 40, 35, 45, 50, 55), strategy_B = c(7, 14, 20, 25, 23, 27, 33, 
38, 40, 47, 52, 60)) 
p <- plot_ly(investment_data, x = ~time, y = ~strategy_A, name = "Stratégie 
A", type = 'scatter', mode = 'lines+markers') %>% add_trace(y =~strategy_B, 
name = 'Stratégie B', mode = 'lines+markers') %>% layout(title = 
"Performances des stratégies d'investissement", xaxis = list(title = "Temps 
(mois)"), yaxis = list(title = "Rendement")) 
p

#shiny
#exemple pratique: Voici un code simplifié pour créer une application shiny où l’utilisateur peut choisir 
#un jeu de données à visualiser et ajuster les paramètres du graphique : 
library(shiny)  
library(ggplot2) 
ui <- fluidPage(titlePanel("Visualisation interactive des ventes"), 
                sidebarLayout(  
                  sidebarPanel( 
                    sliderInput("month", "Sélectionner le mois :", min = 1, max= 
                                  12, value = 6) 
                  ), 
                  mainPanel( 
                    plotOutput("salesPlot")) 
                ) 
) 
server <- function(input, output) { 
  output$salesPlot <- renderPlot({ 
    ggplot(sales_data, aes(x = month, y = sales)) + 
      geom_line() + 
      geom_point() + 
      labs(title = paste("Ventes pour le mois", input$month)) 
  }) 
} 
shinyApp(ui = ui, server = server)


#------------------------------------------------------------------------------
#II)Principes de Base de ggplot2
#Exemples de graphiques simples : Scatter plot (nuage de points) : 
library(ggplot2)  
data <- data.frame(x = rnorm(100), y = rnorm(100)) 
ggplot(data, aes(x = x, y = y)) + 
  geom_point() + 
  labs(title = "Nuage de points", x = "Variable X", y = "Variable Y") 

#Exemples de graphiques simples :Bar plot (diagramme à barres) : 
data <- data.frame(group = c("A", "B", "C"), value = c(3, 5, 7)) 
ggplot(data, aes(x = group, y = value)) + 
  geom_bar(stat = "identity", fill = "blue") + 
  labs(title = "Diagramme à barres", x = "Groupe", y = "Valeur")

#---------------------------------------------------------------------------

#III) Personnalisation des Graphiques 
#Ajouter des titres, étiquettes et légendes :
ggplot(data, aes(x = group, y = value)) + 
  geom_bar(stat = "identity", fill = "blue") + 
  labs(title = "Titre du graphique", x = "Axe des groupes", y = "Axe 
des valeurs") + 
  theme_minimal() 

#Modifier les couleurs, les thèmes et les styles : 
#Changer les couleurs 
ggplot(data, aes(x = group, y = value, fill = group)) + 
  geom_bar(stat = "identity") + scale_fill_manual(values = c("red", 
                                                             "green", "blue")) + labs(title = "Couleurs personnalisées") 

#Modifier les couleurs, les thèmes et les styles :
#Utiliser un thème différent
ggplot(data, aes(x = group, y = value)) + geom_bar(stat = 
                                                     "identity", fill = "blue") + labs(title = "Thème classique") +  
  theme_classic()

#Utilisation des facettes : 
data <- data.frame( 
  group = rep(c("A", "B", "C"), each = 10), 
  category = rep(c("X", "Y"), each = 5, times = 3), 
  value = rnorm(30) 
) 
ggplot(data, aes(x = group, y = value)) + 
  geom_point() + 
  facet_wrap(~ category) + 
  labs(title = "Graphiques en facettes")

#------------------------------------------------------------------------------------------
#IV) Graphiques Avancés avec ggplot2
#Création de graphiques complexes :Heatmaps (cartes de chaleur)
data <- data.frame(x = rep(1:10, each = 10), y = rep(1:10, times = 
                                                       10), z = rnorm(100)) 
ggplot(data, aes(x = x, y = y, fill = z)) + 
  geom_tile() + 
  scale_fill_gradient(low = "white", high = "red") + 
  labs(title = "Carte de chaleur")

#Boxplot (diagramme en boîte): 
data <- data.frame(group = rep(c("A", "B", "C"), each = 50), value = 
                     rnorm(150)) 
ggplot(data, aes(x = group, y = value)) + 
  geom_boxplot() + 
  labs(title = "Boxplot par groupe") 

#Intégration des données géospatiales :Animation et interaction avec ggplot2 et plotly :
library(plotly) 
p <- ggplot(data, aes(x = group, y = value)) + geom_boxplot() 
ggplotly(p)

#--------------------------------------------------------------------------------

#V) Cas Pratiques et Applications

#Finance : Utilisation de ggplot2 pour visualiser des tendances financières, 
#comme les rendements d'actifs au fil du temps. 

financial_data <- data.frame(time = 1:12, 
                             returns = c(5, 10, 15, -5, 7, 12, 8, 14, -3, 11, 16, 20)) 
ggplot(financial_data, aes(x = time, y = returns)) + 
  geom_line(color = "green") + labs(title = "Rendement des actifs au 
fil du temps", x = "Temps", y = "Rendement") 



#Santé : Analyse des données médicales avec des boxplots pour comparer 
#des groupes de patients selon des traitements.

health_data <- data.frame(group = rep(c("Traitement", "Contrôle"), 
                                      each = 50), result = c(rnorm(50, mean = 5), rnorm(50, mean = 3))) 
ggplot(health_data, aes(x = group, y = result)) + 
  geom_boxplot() + labs(title = "Résultats des patients selon le 
groupe") 


#Sciences Sociales : Visualisation des résultats d'enquêtes et de sondages 
#avec des diagrammes en barres et des nuages de points. 

survey_data <- data.frame( 
  age_group = rep(c("18-25", "26-35", "36-45"), times = 3), 
  satisfaction = c(3, 4, 5, 2, 3, 5, 1, 2, 4) 
) 
ggplot(survey_data, aes(x = age_group, y = satisfaction)) + 
  geom_bar(stat = "identity", fill = "orange") + 
  labs(title = "Satisfaction selon le groupe d'âge")

