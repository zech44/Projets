# Simuler des données
set.seed(123)
donnees <- rnorm(100, mean = 50, sd = 10)

# Définir la distribution théorique
moyenne_theorique <- 50
ecart_type_theorique <- 10

breaks <- seq(min(donnees) - 1, max(donnees) + 1, length.out = 6)  # 5 classes
classes <- cut(donnees, breaks = breaks, include.lowest = TRUE)

freq_obs <- table(classes)

freq_att <- diff(pnorm(breaks, mean = moyenne_theorique, sd = ecart_type_theorique)) * length(donnees)

print("Fréquences observées :")
print(freq_obs)
print("Fréquences attendues :")
print(freq_att)

# Test du chi-carré manuel
test_chi2_manuel <- function(freq_obs, freq_att) {
  chi2 <- sum((freq_obs - freq_att)^2 / freq_att)
  
  df <- length(freq_obs) - 1

  p_value <- pchisq(chi2, df, lower.tail = FALSE)

  return(list(chi2 = chi2, df = df, p_value = p_value))
}

resultat_chi2 <- test_chi2_manuel(freq_obs, freq_att)

cat("\nRésultats du test du chi-carré :\n")
cat("Statistique du chi-carré :", resultat_chi2$chi2, "\n")
cat("Degrés de liberté :", resultat_chi2$df, "\n")
cat("p-value :", resultat_chi2$p_value, "\n")

# Interprétation
if (resultat_chi2$p_value < 0.05) {
  cat("Conclusion : Les données ne suivent pas la distribution théorique (p < 0.05).\n")
} else {
  cat("Conclusion : Les données suivent la distribution théorique (p >= 0.05).\n")
}