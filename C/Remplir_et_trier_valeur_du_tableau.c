void trievaleur(int t[], int l )   
{
		int *p=t;
		
	int aux,i,j;

	for(i=0;i<(l-1);i++)
	{
	
	for(j=i+1;j<l;j++)
	{
	
	if(*(t+i)>*(t+j))  
       {
	
    aux=*(t+j);
    *(t+j)=*(t+i);
    *(t+i)=aux;
       }
   }
   }
}

int main()
{
	int i,max,min,taille;
	printf("saisir la taille du tableau\n");
	scanf("%d",&taille);
	int tab[taille];
	for(i=0;i<taille;i++){
	
		printf("entre une valeur:");
	scanf("%d",&tab[i]);}
	printf("\n");
		trievaleur(tab,taille);
		
	printf("tableau trie est:\n");
for(i=0;i<taille;i++){

     printf("%d",tab[i]);
     printf("\n");
}
}
	

