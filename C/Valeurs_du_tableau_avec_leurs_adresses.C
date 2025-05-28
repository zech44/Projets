#include <stdio.h>
int main (void)
{
	int i;
	int tab[10]={4,12,53,19,11,60,24,12,89,19};
	printf("cette application est un tableau prealablement remplis. Ces donnees ainsi que leurs adresses sont les suivantes:\n");
	printf("\n");
	for(i=0;i<=9;i++)
	{
		printf("la donnee numero %d est: %d\n",i+1,tab[i]);
		printf("l'adresse de la donnee numero %d est: %p\n",i+1,tab[i]);
		printf("\n");
	}
}
