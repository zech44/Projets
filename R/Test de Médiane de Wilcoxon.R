# Simuler des données
set.seed(123)
donnees_simulees <- rnorm(20, mean = 50, sd = 10)

mediane_theorique <- 50

differences <- donnees_simulees - mediane_theorique

differences <- differences[differences != 0]
rangs <- rank(abs(differences))

# Statistique de Wilcoxon
somme_rangs_positifs <- sum(rangs[differences > 0])
somme_rangs_negatifs <- sum(rangs[differences < 0])

statistique_wilcoxon <- min(somme_rangs_positifs, somme_rangs_negatifs)

cat("Statistique de Wilcoxon (W) :", statistique_wilcoxon, "\n")

# Calculer la p-value
calcul_p_value_wilcoxon <- function(statistique_wilcoxon, nombre_observations) {
  esperance_w <- nombre_observations * (nombre_observations + 1) / 4
  ecart_type_w <- sqrt(nombre_observations * (nombre_observations + 1) * (2 * nombre_observations + 1) / 24)
  
  z <- (statistique_wilcoxon - esperance_w - 0.5) / ecart_type_w
  
  p_value <- 2 * pnorm(-abs(z))
  
  return(p_value)
}

nombre_observations <- length(differences)
p_value <- calcul_p_value_wilcoxon(statistique_wilcoxon, nombre_observations)

cat("p-value :", p_value, "\n")

# Interprétation
if (p_value < 0.05) {
  cat("Conclusion : La médiane des données est significativement différente de", mediane_theorique, "(p < 0.05).\n")
} else {
  cat("Conclusion : La médiane des données n'est pas significativement différente de", mediane_theorique, "(p >= 0.05).\n")
}