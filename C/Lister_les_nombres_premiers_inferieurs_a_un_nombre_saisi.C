#include<stdio.h>
#include<stdlib.h>

int main()
{
    int nombre=1;
    int i,r,n,cp;
    cp=0;
    do
	{
		printf("Entrez l'entier N:\n");
		scanf("%d",&n);
	}
	while(n<0);
    printf("Les nombres premiers inferieurs a %d sont au nombre de:\n",n);
    while(nombre <n)
	{
		//tant que nombre < n alors
         r=0;//pour compter le nombre de diviseurs
         nombre++;
         for (i=1 ; i<=nombre ; i++)
         {
             if ((nombre%i)==0) 
                r++;
         }
         if(r==2)//Le nombre premier se divise sur 1 et sur lui meme
         {
         	cp=cp+1;
         }
   }
   printf(" %d \n",cp);
   system("pause");
}
