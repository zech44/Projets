#include <stdio.h>
#include <stdlib.h>


int main(int argc, char *argv[]) {
	char texte[133];
	int c, i;
	printf("entrer un texte de moins d'une ligne (max 132 caracteres) \n");
	gets(texte);
	c = 0;
	for(i=0;texte[i];i++){
	if (texte[i]=='e'){
	c = c+1;
	}
	}
	printf("le nombre de 'e' minuscule que le texte contient est:%d\n",c);
	return 0;
}
