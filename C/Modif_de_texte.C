#include<stdio.h>
#include<stdlib.h>
#include<string.h>
   #define car 'e'
    #define mot 132
int main(void)
{
   	char texte[mot+1];
   	char *adr;
   	printf("Entrez le texte\n");
   	gets(texte);
   	adr=texte;
   	while(adr=strchr(adr,car))
	{
   	strcpy(adr,adr+1);
   	}
   	printf("Voici votre nouveau texte\n");
   	puts(texte);
   }
