#include <stdio.h>
#include <stdlib.h>


void main(void) {
	int A,B;
	printf("Ce pogramme nous servira a determiner le PPCM et le PGCD de 2 entiers choisis.\nVeuillez entrer la valeur d'un nombre :");
	scanf("%d",&A);
	printf("Veuillez entrer la valeur d'un deuxieme nombre:");
	scanf("%d",&B);
	/*Calcul du PPCM*/
	int nbr_A=A,nbr_B=B;
	while(nbr_A!=nbr_B){
		nbr_A+=A;
		nbr_B+=B;
	}
	/*Calcul du PGCD*/
	int i,PGCD=1;
	float nombreA,nombreB;
	for (i=1;i<=A;i++){
            nombreA=A%i;
            nombreB=B%i;
		if(nombreA==0 && nombreB==0){
			PGCD=i;
		}
	}
	/*Affichage du résultat*/
	printf("\n\tOn obtient que PPCM(%d;%d) = %d & PGCD(%d;%d) = %d",A,B,nbr_A,A,B,PGCD);
}
