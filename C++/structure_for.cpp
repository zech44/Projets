#include <iostream>

using namespace std;

int main()
{
int N,factoriel,i;
cout << "Saisir l'entier a calculer"<< endl;
cin >> N;
while(N<0){
	cout << "Erreur, "<<N<<" est negatif !\nSaisir un autre entier a calculer"<< endl;
	cin >> N;
}
factoriel=1;
if(N=0){	
factoriel=1;
}
else{
	for(i=1;i<=N;i++){
	factoriel=factoriel*i;
	}
}
cout << "La factoriel est " << factoriel << endl;
return 0;
}