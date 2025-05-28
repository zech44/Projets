# Simuler des données
set.seed(123)
echantillon1 <- rnorm(30, mean = 50, sd = 10)
echantillon2 <- rnorm(35, mean = 55, sd = 12)

donnees_combinees <- c(echantillon1, echantillon2)

rangs <- rank(donnees_combinees)

rangs_echantillon1 <- rangs[1:length(echantillon1)]
rangs_echantillon2 <- rangs[(length(echantillon1) + 1):length(donnees_combinees)]

# Statistique de Mann-Whitney-Wilcoxon
U1 <- sum(rangs_echantillon1) - (length(echantillon1) * (length(echantillon1) + 1)) / 2
U2 <- sum(rangs_echantillon2) - (length(echantillon2) * (length(echantillon2) + 1)) / 2
U <- min(U1, U2)

cat("Statistique de Mann-Whitney-Wilcoxon (U) :", U, "\n")

# Calculer la p-value
calcul_p_value_mw <- function(U, n1, n2) {
  mu_U <- (n1 * n2) / 2
  sigma_U <- sqrt((n1 * n2 * (n1 + n2 + 1)) / 12)
  
  z <- (U - mu_U - 0.5) / sigma_U
  
  p_value <- 2 * pnorm(-abs(z))
  
  return(p_value)
}

n1 <- length(echantillon1)
n2 <- length(echantillon2)
p_value <- calcul_p_value_mw(U, n1, n2)

cat("p-value :", p_value, "\n")

# Interprétation
if (p_value < 0.05) {
  cat("Conclusion : Les deux échantillons ne proviennent pas de la même distribution (p < 0.05).\n")
} else {
  cat("Conclusion : Les deux échantillons proviennent de la même distribution (p >= 0.05).\n")
}