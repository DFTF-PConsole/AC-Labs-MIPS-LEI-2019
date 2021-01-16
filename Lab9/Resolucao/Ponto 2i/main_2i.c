#include<stdio.h>

int oddnumber(int *ptr, int n);

int main ( )
{
	int tab[]={1,2,3,4,5,6,7,8,9,10};
	int n=10;
	int i;
	
	printf(" O Array original: ");
	for(i=0;i<9;i++){
		printf("%d , ",tab[i]);
	}
  
  printf("%d \t ",tab[i]);

  printf("Esta tabela possui %d números ímpares\n",oddnumber(tab, n));
	
	
}