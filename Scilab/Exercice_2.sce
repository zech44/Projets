// 1) Entrer la taille d'une matrice carré
disp("Veuillez entrer la taille de la matrice carré A");
i=input("Veuillez entrer le nombre de ligne de la matrice :");
j=input("Veuillez entrer le nombre de colonne de la matrice :");
// 2) Entrer les composantes de A
for b=1:i
    for c=1:j
        A(b,c)=input("Veuillez entrer la valeur de  A(",i,",",j,") :");
    end
end
// 3) Calculer la moyenne de chaque colonne de A
vectA=sum(A,"row");
for b=1:i
    disp("La moyenne de la colonne ");disp(j);disp(" est : ");disp(vectA(j)/j);
end
// 4) Afficher le numéro d'une colonne pour laquelle  la moyenne est maximale
