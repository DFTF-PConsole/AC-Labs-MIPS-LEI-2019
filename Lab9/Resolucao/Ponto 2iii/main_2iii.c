#include<stdio.h>

int convertMaisculas(int *ptr);

int main ( )
{
	int str[50];

	printf("Introduza uma string: ");
	fgets (str, sizeof(str), stdin);
	
	printf("String original: %s\n");
	
	convertMaisculas(str);
	
	printf("String final: %s\n");
}