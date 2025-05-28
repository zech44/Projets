function[y]=factoriel(n)
    y=prod(1:n);
endfunction

n=input("Donnez un entier naturel n:");
p=input("Donnez un entier naturel p < n:");


// Calcul de la Cpn
Cpn=factoriel(n)/(factoriel(p)*factoriel(n-p))
disp(Cpn)