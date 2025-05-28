// 1) Ecrire un programme Scilab qui demande à un utilisateur d'entrer trois réels a, b et c
a=input("Veuillez entrer une valeur reelle a:");
b=input("Veuillez entrer une valeur reelle b:");
c=input("Veuillez entrer une valeur reelle c:");
// 2) Ecrire un programme Scilab qui permet à un utilisateur de vérifier si le réel a est nul. Si tel est le cas de demander d'entrer un réel a non nul
while a=0
    disp("La valeur ''a'' doit-etre non nulle !");
    a=input("Veuillez entrer une autre valeur de a:");
end
// 3) et 4) Ecrire un programme Scilab qui permet à un utilisateur de résoudre dans C, l'équation (E) : ax2 + bx + c = 0 et afficher les solutions de (E)
discriminant=(b^2)-(4*a*c);
// Cas où le discriminant est positif
if (discriminant>0) then
    disp("l''equation (E) admet deux solutions disctintes réelles X1 et X2 dans C");
    X1=(-b-sqrt(discriminant))/(2*a);
    X2=(-b+sqrt(discriminant))/(2*a);
    //aficher les solutions
     disp("Les solutions sont :");
     disp(X1);
     disp(X2);
// Cas où le discriminant est nul
elseif(discriminant==0) then
    disp("l''equation admet une solution double réelle X0 dans C");
    X0=-b/(2*a);
    //aficher les solutions
    disp("La solution est :");
    disp(X0);
// Cas où le discriminant est négatif
elseif (discriminant<0) then
    disp("l''equation admet deux solutions distinctes complexes Z1 et Z2 dans C");
    Z1=(-b+%i*sqrt(discriminant))/(2*a);
    Z2=(-b-%i*sqrt(discriminant))/(2*a);
    //aficher les solutions
    disp("Les solutions sont :");
    disp(Z1);
    disp(Z2);
 end
 // 5) Ecrire un programme Scilab qui permet à un utilisateur de tracer la courbe représentative de la fonction f
 x=linspace(-10,0.5,10);
 y=(log((abs(a*(x.^5))))+b*(x.^2)+2*c)./((x.^2)+1);
 plot(x,y);
