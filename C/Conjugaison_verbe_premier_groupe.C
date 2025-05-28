#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(void)
{	
	char *deb[6]={"je","tu","il","nous","vous","ils"};
	char *term[6]={"e","es","e","ons","ez","ent"};
	char *adrterm;
	char verbe[26];
	int i;
	do
	{
		printf("entrer le verbe de premier groupe\n");
		scanf("%s",&verbe);
		adrterm=verbe+(strlen(verbe)-2);

	}
	while(strcmp(adrterm,"er"));
  	for(i=0; i<6 ;i++)
	{
		strcpy(adrterm,term[i]);
		printf("%s \t %s \n",deb[i],verbe);
	}	
	return 0;
}

