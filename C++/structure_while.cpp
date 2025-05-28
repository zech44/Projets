#include <iostream>

using namespace std;

int main()
{
int nbrecredit,cpt;
cout << "entrez le nombre de credits \n";
cin >> nbrecredit;
cpt=1;
while ( nbrecredit<60 && cpt<2){
	cout << "saisir nombre de credits \n";
	cin >> nbrecredit;
	cpt++;
}
if(nbrecredit>=60){
	cout << " vous etes Admis";
}
else{cout << "vous etes Refuse";
}
return 0;
}