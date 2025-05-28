# Simuler des données
set.seed(123) 
donnees_simulees <- rnorm(100, mean = 50, sd = 10)

moyenne_theorique <- 50
ecart_type_theorique <- 10

# Fonction de répartition empirique
fdr_empirique <- function(x, donnees) {
  sum(donnees <= x) / length(donnees)
}

# Fonction de répartition théorique
fdr_theorique <- function(x) {
  pnorm(x, mean = moyenne_theorique, sd = ecart_type_theorique)
}

# Statistique de KS
donnees_triees <- sort(donnees_simulees)

differences <- sapply(donnees_triees, function(x) {
  abs(fdr_empirique(x, donnees_triees) - fdr_theorique(x))
})

statistique_ks <- max(differences)

cat("Statistique de KS :", statistique_ks, "\n")

# Calcul de la p-value
calcul_p_value_ks <- function(statistique_ks, n) {
  lambda <- max(0, (sqrt(n) + 0.12 + 0.11 / sqrt(n)) * statistique_ks)
  p_value <- 2 * exp(-2 * lambda^2)
  return(p_value)
}

nombre_observations <- length(donnees_simulees)
p_value <- calcul_p_value_ks(statistique_ks, nombre_observations)

cat("p-value :", p_value, "\n")

# Interprétation
if (p_value < 0.05) {
  cat("Conclusion : Les données ne suivent pas la distribution théorique (p < 0.05).\n")
} else {
  cat("Conclusion : Les données suivent la distribution théorique (p >= 0.05).\n")
}