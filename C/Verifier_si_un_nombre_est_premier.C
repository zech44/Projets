#include<stdio.h>
#include<stdlib.h>

int main(void)
{
    int nb,r=0;
    do
	{
		printf("Entrez l'entier N:\n");
		scanf("%d",&nb);
	}
	while(nb<0);
    for(int i = 1 ; i <= nb ; i++ )
    {
        if(nb % i == 0)
        {
           r++;
        }         
    }
		if(r>2)
			printf("%d n'est pas un nombre premier\n", nb);
		else
			printf("%d est un nombre premier\n", nb);
}

