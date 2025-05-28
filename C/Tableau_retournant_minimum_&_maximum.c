#include <stdio.h>
#include <stdlib.h>


int main() 
{
	int tab[10], i, max, min;
	for(i = 0; i<10; i++){
		printf("veuillez entrer un nombre:");
		scanf("%d", &tab[i]);
		}
	min = tab[0];
	max = tab[0];	
	for(i = 0; i<10; i++){	
	if(tab[i]> max){
	max = tab[i];
	}
	if(tab[i]< min){
	min = tab[i];
	}
	}
	printf("le plus grand nombre est: %d\n", max);
	printf("le plus petit nombre est: %d", min);
	
}
