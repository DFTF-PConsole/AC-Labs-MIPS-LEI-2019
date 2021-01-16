#include <stdio.h>
#include <stdlib.h>


int max (int *tabela, int numValores);

int min (int *tabela, int numValores);

int main ()
{
	int *array;
	int vMax,vMin, n, i;
	
	printf ("Introduza o numero de elementos da tabela:\n");
	scanf ("%d", &n);
	array = malloc(n*sizeof(int));
	for (i = 0; i < n; i++) {
		scanf ("%d", array+i);
	}	
	vMax = max (array, n);
	vMin = min (array, n);
	
	printf ("O valor maximo: %d\n",vMax);
	printf ("O valor minimo: %d\n",vMin);
	
	return 0;
}
