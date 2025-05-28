# Simuler des données
set.seed(123)
n <- 30
x <- rnorm(n, mean = 50, sd = 10)
y <- 2 * x + rnorm(n, mean = 0, sd = 5)

cat("Données simulées :\n")
print(data.frame(x = x, y = y))

# Paires concordantes et discordantes
compter_paires <- function(x, y) {
  n <- length(x)
  concordantes <- 0
  discordantes <- 0
  
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      if ((x[i] < x[j] && y[i] < y[j]) || (x[i] > x[j] && y[i] > y[j])) {
        concordantes <- concordantes + 1
      } else if ((x[i] < x[j] && y[i] > y[j]) || (x[i] > x[j] && y[i] < y[j])) {
        discordantes <- discordantes + 1
      }
    }
  }
  
  return(list(concordantes = concordantes, discordantes = discordantes))
}


resultats_paires <- compter_paires(x, y)
concordantes <- resultats_paires$concordantes
discordantes <- resultats_paires$discordantes

cat("\nNombre de paires concordantes :", concordantes, "\n")
cat("Nombre de paires discordantes :", discordantes, "\n")

tau_kendall <- (concordantes - discordantes) / (concordantes + discordantes)
cat("\nTau de Kendall :", tau_kendall, "\n")

# Calculer la p-value
calcul_p_value_kendall <- function(tau, n) {
  z <- tau * sqrt((9 * n * (n - 1)) / (2 * (2 * n + 5)))
  
  p_value <- 2 * pnorm(-abs(z))
  
  return(p_value)
}

p_value <- calcul_p_value_kendall(tau_kendall, n)

cat("p-value :", p_value, "\n")

# Interprétation
if (p_value < 0.05) {
  cat("Conclusion : Il existe une corrélation significative entre les deux variables (p < 0.05).\n")
} else {
  cat("Conclusion : Il n'y a pas de corrélation significative entre les deux variables (p >= 0.05).\n")
}