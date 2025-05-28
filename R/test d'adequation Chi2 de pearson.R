calcul_chi2 <- function(observations, theorique) {
  taille_obs <- length(observations)
  taille_theorique <- length(theorique)
  eff1 <- c()
  categories <- sort(unique(observations)) 
  nb_categories <- length(categories)
  
  if (taille_obs == taille_theorique) {
    # Calcul des effectifs 
    eff1 <- table(observations)  
    eff2 <- table(theorique)
    
    kk <- sum(eff2)
    p0 <- eff2 / kk 
    
    S <- 0
    for (categorie in names(eff1)) {
      frequence_observee <- eff1[[categorie]]   
      frequence_attendue <- eff2[[categorie]]   
      
      # Formule de Pearson
      S <- S + ((frequence_observee - frequence_attendue)^2 / frequence_attendue)
    }
    
    # Calcul de la statistique de chi-carré
    statistique_Tn <- S
    cat("La statistique de test Tn =", statistique_Tn, "\n")
    
  
    resultat_chi2 <- chisq.test(eff1, p = p0)
    print(resultat_chi2)
    
    return(list(Tn = statistique_Tn, test_chi2 = resultat_chi2))
    
  } else {
    print("Erreur : Les tailles des deux échantillons ne correspondent pas.")
  }
}

set.seed(123) 
observations <- c("A","A","B","C","C","C","D","D","D","E")  
theorique <-  c("A","B","B","C","C","C","D","E","E","E")     
resultat_final <- calcul_chi2(observations, theorique)