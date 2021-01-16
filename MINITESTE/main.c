#include <stdio.h>
#define DIM 6

int muda_num (int *ptr1, int *ptr2, int dim, int num);

int main() {
int i;
int res;
int array1[DIM] = {9,2,3,4,5,6};
int array2[DIM] = {5,1,7,15,1,8};
res=muda_num(array1, array2, DIM, 6);

printf("Array 1 Manipulado: \n");
for (i = 0; i < DIM; i++) {
	printf("Indice i=%d valor: %d \n", i, array1[i]);
}
printf("\nArray 2 Manipulado: \n");
for (i = 0; i < DIM; i++)  {
	printf("Indice i=%d valor: %d \n", i, array2[i]);
}
printf("\nValor Devolvido: %d \n", res);

return 0;
}