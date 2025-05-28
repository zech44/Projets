#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int main (void)
{
	char mot[35];
	printf("saisir le mot:\n");
	scanf("%s",mot);
	strrev(mot);
	printf("l'envers du mot est: %s",mot);
}
