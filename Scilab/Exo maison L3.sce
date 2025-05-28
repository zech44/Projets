// sol : solution de l'quation
// resi : suite des résidus relatifs
// err : suite des erreurs rélatifs 
// rays : rayon spectral 
// eps : précision epsilon 


////JACOBI
function [sol,resi,err,rays] = Jacobi(A,b,x0,eps)
    // Verifiction des termes nuls sur la diagonale de A
    if ~and(diag(A)) then
        error("La diagonale contient une valeur nuls")
    end
    // Decomposition de A = D-E-F
    D = diag(diag(A))
    E = -triu(A)+D
    F = -tril(A)+D
    //Initialisation
    x=A\b'
    sol = x0
    for k = 1 : 200
        x1 = sol
        sol = inv(D)*((E+F))*sol+b'
        resi = norm(A*x0-b)/norm(b')
        err =  norm(sol-x)/norm(x)
        disp(k," eme itération : Résidu relatif = ", resi, " , erreur relative = ", err)
        if norm(sol-x1)< eps
            break
        end
    end
    rays = max(norm(inv(M)*(N)))
    disp("Le rayon spectrale (1/M)*N est : ", rays)
endfunction




////GAUSS SIEDEL
function [sol,resi,err,rays] = Gaussiedel(A,b,x0,eps)
    // Verifiction des termes nuls sur la diagonale de A
    if ~and(diag(A)) then
        error("La diagonale contient une valeur nuls")
    end
    // Decomposition de A = D-E-F
    D = diag(diag(A))
    E = -triu(A)+D
    F = -tril(A)+D
    M = D
    N = E+F
    //Initialisation
    x=A\b'
    sol = x0
    for k = 1 : 200
        x1 = sol
        sol = inv(M)*((N))*sol+b'
        resi = norm(A*x0-b)/norm(b')
        err =  norm(sol-x)/norm(x)
        disp(k," eme itération : Résidu relatif = ", resi, " , erreur relative = ", err)
        if norm(sol-x1)< eps
            break
        end
    end
    rays = max(norm(inv(M)*(N)))
    disp("Le rayon spectrale (1/M)*N est : ", rays)
endfunction

////RELAXATION
function [sol,resi,err,rays] = Relaxation(A,b,x0,eps)
    // Verifiction des termes nuls sur la diagonale de A
    if ~and(diag(A)) then
        error("La diagonale contient une valeur nuls")
    end
    // Decomposition de A = D-E-F
    D = diag(diag(A))
    E = -triu(A)+D
    F = -tril(A)+D
    M = (1/w)*D-E
    N = F+D*(1-w)/w
    //Initialisation
    x=A\b'
    sol = x0
    for k = 1 : 200
        x1 = sol
        sol = inv(M)*((N))*sol+b'
        resi = norm(A*x0-b)/norm(b')
        err =  norm(sol-x)/norm(x)
        disp(k," eme itération : Résidu relatif = ", resi, " , erreur relative = ", err)
        if norm(sol-x1)< eps
            break
        end
    end
    rays = max(norm(inv(M)*(N)))
    disp("Le rayon spectrale (1/M)*N est : ", rays)
endfunction



A= [9 1 1 ; 1 16 4 ; 1 4 25]
b=[14 45 85]
x0=[0 0 0]
eps= 0.05

[sol,resi,err,rays] = Jacobi(A,b',x0,eps)
