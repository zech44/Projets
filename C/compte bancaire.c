#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <math.h>


int main(void)
{
    char nom[20];
    int anneNaissance,depotInitial,i,differenceNaissance,j;
    float soldeAnne;
    printf("Entrez votre nom:\n");
    gets(nom);
    printf("Entrez votre annee de naissance:\n");
    scanf("%d",&anneNaissance);
    printf("Entrez votre depot initial:\n");
    scanf("%d",&depotInitial);
    soldeAnne=depotInitial;
    differenceNaissance=2021-(anneNaissance+6);
    printf("Voici les differents soldes de %s suivant les années\n",nom);
    for(i=0;i<=differenceNaissance;i++)
        {
        soldeAnne+=((depotInitial*3.5)/100)-13200;

        printf("Annee : %d      Solde : %f\n",anneNaissance+6+i,soldeAnne);
    }

    }
