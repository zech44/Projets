#include<iostream>

using namespace std;

int main (){
	int l_entier,temp;
	temp=0;
	while(temp<5){
		cout << "Veuillez entrer un entier svp :"<<endl;
		cin >> l_entier;
		if (l_entier<=100 && l_entier>=50){
			cout << "GAGNE"<<endl;
			temp=5;
		}
		else{
			cout << "PERDU"<<endl;
			temp++;
		}
	}
	cout<<"Fin du jeu !"<<endl;
	return 0;
}