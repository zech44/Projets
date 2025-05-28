clear

e = 0
while (e==0) 
n=input("Saississez une taille pour votre matrice carre d''ordre > 3, n = ")
if n >= 3 then
    a=input("Saississez les un nombre pour la diagonale principale a = ")
    b=input("Saississez les un nombre pour la sous-diagonale b = ")
    c=input("Saississez les un nombre pour la sur-diagonale c = ")
    for i=1:n
        for j=1:n
            if j==i then
                A(i,j)=a
            end
            if j==i-1 then
                A(i,j)=b
            end
            if j==i+1 then
                A(i,j)=c
            end
            if j<>i+1 && j<>i-1 && j<>i  then
                A(i,j)=0
            end
        end
    end
    disp('A = ', A)
    disp("Les valeurs propres sont : ", spec(A))
    disp("Les vecteurs propres sont : ", bdiag(A))
    e=input("Pour reessayer taper ''0'' ")
    
    
end
end
