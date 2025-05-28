#include <stdio.h>
#include <stdlib.h>


void main(void) {
	int i,A,B,test;
	float res;
	char oper;
	printf("Entrez un nombre:");
	scanf("%d",A);
	printf("Entrez un autre nombre:");
	scanf("%d",B);
	printf("Entrez un operateur:");
	scanf("%c",oper);
	switch(oper){
		case +: res=A+B;
				break;
		case -: res=A-B;
				break;
		case *: res=A*B;
				break;
		case /: res=A/B;
				break;
		default:break;
	}
	print("Frappez 1 pour reessayer");
	scanf("%d",test);
	while(test=1){
		printf("Entrez un nombre:");
	scanf("%d",A);
	printf("Entrez un autre nombre:");
	scanf("%d",B);
	printf("Entrez un operateur:");
	scanf("%c",oper);
	switch(oper){
		case +: res=A+B;
				break;
		case -: res=A-B;
				break;
		case *: res=A*B;
				break;
		case /: res=A/B;
				break;
		default:break;
	}
	print("Frappez 1 pour reessayer");
	scanf("%d",test);
	}
}
