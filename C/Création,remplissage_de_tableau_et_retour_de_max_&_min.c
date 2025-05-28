#include <stdio.h>
#include <math.h>
#include <conio.h>
#include <stdlib.h>

	void maxmin(int * t, int l ,int * max, int * min)
	{
		int i;
		*max=t[0];
		*min=t[0];
		for(i=0;i<l;i++){
			if(*max<t[i]){
				*max=t[i];
			}
			if(*min>t[i]){
				*min=t[i];
			}
		}
	}
	
	int main(){
	int i,max,min,taille;
	printf("saisir la taille du tableau\n");
	scanf("%d",&taille);
	int tab[taille];
	for(i=0;i<taille;i++){
	
		printf("entre une valeur:");
	scanf("%d",&tab[i]);}
	printf("\n");
	maxmin(tab,taille,&max,&min);
	printf("max=%d\n min=%d\n",max,min);
	
	
}
