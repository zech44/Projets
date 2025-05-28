# La méthode d'inversion
    # Simulons une loi exponentielle
lambda <- 5
U <- runif(10000, 0, 1)
Y <- -(1/lambda) * log(U)
print(Y)
plot(Y)
hist(Y)


    # Simulons une loi Weibull
Beta <- 5
Teta <- 2
U <- runif(1000)
X <- Beta*(log(1/U))^(1/Teta)




# La méthode de transformation générale
    #Loi du chi-2
v <- 3
U <- runif(v*10000)
U <- matrix(data=U, nrow=v) #matrice des sommes
X <- -log(U) # d’uniforme à exponentielle
Y <- 2*apply(X,2,sum) #sommes donnant le chi-deux
print(Y)
plot(Y)
hist(Y)



    #Loi gamma
alpha <- 3
beta <-5
U <- runif(alpha*10000)
U <- matrix(data=U, nrow = alpha)
X <- -log(U)
Y <- beta * apply(X, 2, sum)
print(Y)
plot(Y)
hist(Y)

    #Loi Beta
a <- 3
b <-5
U <- runif((a+b)*10000)
U <- matrix(data=U, nrow = a+b)
X <- -log(U)
Y <- apply(X[1:a,], 2, sum)/ apply(X, 2, sum)
print(Y)
plot(Y)
hist(Y)


    #Loi Normal centré réduite
U=runif(3*10000)
V=runif(3*10000)
X=log(U)
Y1=sqrt(-2*X)*cos(2*pi*V)
Y2=sqrt(-2*X)*sin(2*pi*V)
hist(Y1)
hist(Y2)


#Méthode de rejet
    #Simulons une loi triangulaire sur [0,1] 
    #f(x)=2x,x∈[0,1] (triangulaire croissante) on utilise g(x)=1 (loi uniforme)
M <- 2
X <- rep(0,1000)
i <- 0
while (i < n) {
  x_cand <- runif(1)
  u <- runif(1)
  if (u <= M * x_cand) {  # f(x)/M*g(x)
    i <- i + 1
    X[i] <- x_cand
  }
}