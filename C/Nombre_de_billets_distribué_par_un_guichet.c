#include <stdio.h>
int main()
{
int billet ,cp1,cp2,cp3,cp4;
do{
printf("entrer le montant souhaiter:\n");
scanf("%d",&billet);
 }
while(billet<=0);

cp1=billet/10000;
cp2=(billet%10000)/5000;
cp3=((billet%10000)%5000)/2000;
cp4=(((billet%10000)%5000)%2000)/1000;        
printf("\n\n\n");
printf("afficher le nombre de billet a retirer est:\n %d billet de 10000\n %d billet de 5000\n %d billet de 2000\n %d billet de 1000\n",cp1,cp2,cp3,cp4);
}
