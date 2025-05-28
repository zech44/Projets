#include <math.h>
#include <conio.h>
#include <stdlib.h>
#include <stdio.h>
int main(void){
	char verbe[20];
	int nb,i;
	do { 
	
	printf("saisir un verbe\n");
	gets(verbe);
	nb=strlen(verbe);
	}
		while ( verbe[nb-1]!='r'&& verbe[nb-2]!='e');
		
		//nb=strlen(verbe);
		if(verbe[nb-1]=='r'&& verbe[nb-2]=='e')
		{
			verbe[nb-1]='\0';
			verbe[nb-2]='\0';
		
		printf("la conjugaison au present du verbe %s est:\n\n",verbe);
		
			printf("je %sais\n",verbe);
	        printf("tu %sais\n",verbe);
	        printf("il %sait\n",verbe);
	        printf("nous %sions\n",verbe);
	        printf("vous %siez\n",verbe);
	        printf("ils %saient\n",verbe);	
		}
		else
		{
			puts("ce verbe n'est pas valide !\n");
		}
		



	}
