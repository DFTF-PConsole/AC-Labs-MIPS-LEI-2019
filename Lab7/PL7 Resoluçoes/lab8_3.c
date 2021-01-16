#include <stdio.h>

int programa(int*);
int PolyCalc(int, int, int, int, int);

int main()
{
	int vec[5]={4, 2, 10, 1, 6};
	int f, i;
	
	f=programa(vec);
	
	printf("\nf = %d\n", f);
	return 0;
}
