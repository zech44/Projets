#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int main(void)
{
    int tab[10],i,PosMax;
    for(i=0;i<=9;i++)
	{
        printf("Saisissez L entier numero %d\n",i+1);
        scanf("%d",&tab[i]);
	}
	PosMax=0;
	for(i=0;i<=9;i++)
	{
        if(tab[i]>=tab[PosMax])
		{
			PosMax= i;
		}
    }
    printf("Le plus grand element %d est a l'indice: %d\n",tab[PosMax],PosMax);
}

