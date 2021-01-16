#include<stdio.h>

int conta_char(char *ptr, char letra);

int main ( )
{
	char str[]="Arquitetura de Computadores";
	char letra='u';
	
	printf("O caracter %c aparece %d vezes \n",letra,conta_char(str,letra));
}