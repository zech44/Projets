#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int main(void){
    int tab[10],i,superieur=0;
    for(i=0;i<=9;i++){
        printf("saisissez les entiers %d:\n",i+1);
        scanf("%d",&tab[i]);

        }

        for(i=0;i<=10;i++){
            if(tab[i]>=10)
			{
            	superieur+=1;
        	}
        }
        printf("Nous avons %d entiers superieurs ou egaux a 10",superieur);


}

