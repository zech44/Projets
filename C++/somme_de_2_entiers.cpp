#include<iostream>

using namespace std;

int Somme(int a, int b){
	int S;
	S=a+b;
	return S;
};

int main(){
cout << "entrer 2 entiers"	 << endl;
int x,y,z;
cin >> x;
cin >> y;
z=Somme(x,y);
cout << "La somme est "<< z << endl;
return 0;
}