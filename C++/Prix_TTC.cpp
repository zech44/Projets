#include<iostream>

using namespace std;

int main(){
	float pht,pttc,tva,nbre_k;
	cout << "Bienvenue !\nCe programme sert a calculer le prix TTC d'une quantité de tomates que vous allez saisir.\nLet's Go !";
	cout << "\nVeuillez entrer le prix hors taxe du Kilogramme :"<< endl;
	cin >> pht;
	cout << "Veuillez entrer le nombre de Kilogrammes a acheter :"<< endl;
	cin >> nbre_k;
	cout << "Veuillez entrer le taux de la TVA (NB: en decimal!) :"<< endl;
	cin >> tva;
	if(tva>=0 && pht>=0 && nbre_k>=0){
		pttc=nbre_k*(pht+pht*tva);
		cout << "Le prix TTC de cette quantite de tomates est : "<< pttc<< endl;
	}
	else{
		cout << "Erreur ! L'une des donnees saisie est invalide.";
	}
	return 0;
}