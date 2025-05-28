#include <stdio.h>
#include <stdlib.h>

int main()
{
    int nombre,i,resultat=0,temp=0;
    do{
        printf("Veuillez entrez un nombre\n");
        scanf("%d",&nombre);
        printf("\n Table de %d :",nombre);
        for(i=1;i<=10;i++){
            resultat=i*nombre;
            printf("\n %d * %d = %d",nombre,i,resultat);
        }
        printf("\n Veuillez entrer la valeur '1' pour faire une autre table.\n");
        scanf("%d",&temp);
    }
    while(temp==1);{
        printf("\n\nVeuillez entrez un autre nombre\n");
        scanf("%d",&nombre);
        printf("\n Table de %d :",nombre);
        for(i=1;i<=10;i++){
            resultat=i*nombre;
            printf("\n %d * %d = %d",nombre,i,resultat);
        }
        printf("\n Veuillez entrer la valeur '1' pour faire une autre table.");
        scanf("%d",&temp);
    }
    return 0;
}
