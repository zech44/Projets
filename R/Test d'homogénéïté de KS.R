# Simuler des données
set.seed(123)
echantillon1 <- rnorm(50, mean = 50, sd = 10)
echantillon2 <- rnorm(60, mean = 55, sd = 12)

# Fonctions de répartition empiriques
calcul_cdf_empirique <- function(x, donnees) {
  sum(donnees <= x) / length(donnees)
}

echantillon1_trie <- sort(echantillon1)
echantillon2_trie <- sort(echantillon2)

points_communs <- sort(unique(c(echantillon1_trie, echantillon2_trie)))

cdf_echantillon1 <- sapply(points_communs, function(x) calcul_cdf_empirique(x, echantillon1_trie))
cdf_echantillon2 <- sapply(points_communs, function(x) calcul_cdf_empirique(x, echantillon2_trie))

# Statistique de KS
statistique_ks <- max(abs(cdf_echantillon1 - cdf_echantillon2))

cat("Statistique de KS :", statistique_ks, "\n")

# Calcul de la p-value
calcul_p_value_ks <- function(statistique_ks, n1, n2) {
  n_effectif <- (n1 * n2) / (n1 + n2)
  
  lambda <- max(0, (sqrt(n_effectif) + 0.12 + 0.11 / sqrt(n_effectif)) * statistique_ks)
  p_value <- 2 * exp(-2 * lambda^2)
  return(p_value)
}

n1 <- length(echantillon1)
n2 <- length(echantillon2)
p_value <- calcul_p_value_ks(statistique_ks, n1, n2)

cat("p-value :", p_value, "\n")

# Interprétation
if (p_value < 0.05) {
  cat("Conclusion : Les deux échantillons ne proviennent pas de la même distribution (p < 0.05).\n")
} else {
  cat("Conclusion : Les deux échantillons proviennent de la même distribution (p >= 0.05).\n")
}