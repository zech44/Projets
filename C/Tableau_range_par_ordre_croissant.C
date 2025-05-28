#include <stdio.h>

int main (void)
{
    int i,p,r,j;
    int tab[10];
    p=0;
    for(i=0;i<=9;i++)
    {
        printf("Entrez le nombre numero: %d\n",i+1);
        scanf("%d",&tab[i]);
    }
    for(i=0;i<=9;i++)
    {
        for(j=i+1;j<10;j++)
        {
            if(tab[i]>tab[j])
            {
                p=tab[j];
                tab[j]=tab[i];
                tab[i]=p;
            }
        }
    }
    puts("voici le tableau ranger par ordre croissant:");
    for(i=0;i<=9;i++)
    {
        printf("%d;",tab[i]);
    }
}
