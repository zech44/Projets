#include<iostream>

using namespace std;

int main(){
	float s_total,s_brut,prime;
	cout<< "Bienvenue !\nCe programme vous servira a calculer le salaire d'un individu a partir du salaire brute et de sa prime."<<endl;
	cout<< "\nVeuillez entrer le salaire brut de l'individu :"<< endl;
	cin >> s_brut;
	while(s_brut<0){
		cout<< "Veuillez entrer le salaire brut valide de l'individu :"<< endl;
		cin >> s_brut;
	}
	if (s_brut<=1000000){
		prime=20000;
	}
	else{
		prime=50000;
	}
	s_total=s_brut+prime;
	cout<< "Le salaire de l'ouvrier est : "<< s_total << endl;
	return 0;
}