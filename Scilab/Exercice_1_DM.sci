// 1) Ecrire un programme Scilab permettant d'entrer un entier naturel N non nul
N=input("Veuillez entrer un entier non nul :");
while N<=0
    disp("La valeur que vous venez d''entrer n''est pas celle d''un entier naturel non nul");
    N=input("Veuillez entrer une autre valeur :");
end
// 2) Ecrire un programme Scilab permettant de calculer la somme Sn
function Sn=Somme(N)
    Sn=0;
for k=0:N
A=[4/(8*k+1),-2/(8*k+4),-1/(8*k+5),-1/(8*k+6)];
Sn=Sn+16^(-1*k)*sum(A);
end
endfunction
disp("Pour n=");disp(N);disp(" Sn=");disp(Sn);
//3) Ecrire un programme Scilab permettant d'afficher S1000
S1000=Somme(1000);
disp("pour n=1000, on a S1000="); 
disp(S1000);
