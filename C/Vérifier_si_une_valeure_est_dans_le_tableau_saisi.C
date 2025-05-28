#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <stdbool.h>

int main(void)
{
    int tab[10],i,R;
    bool vrai=false;
    for(i=0;i<=9;i++)
	{
        printf("Entrez le nombre %d\n",i+1);
        scanf("%d",&tab[i]);
    }
    printf("Entrez un entier de votre choix:\n");
    scanf("%d",&R);
    for(i=0;i<=9;i++)
	{
        if(tab[i]==R)
		{
            vrai=true;
        }
    }
    if(vrai)
	{
        printf("%d se trouve dans le tableau\n",R);
    }
    else
	{
        printf("%d ne se trouve pas dans le tableau",R);
    }
}

