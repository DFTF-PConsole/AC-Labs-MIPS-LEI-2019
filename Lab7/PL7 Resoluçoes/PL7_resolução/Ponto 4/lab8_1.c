#include <stdio.h>

int Mandelbrot (int z0, n);

int main ()
{
	int z0, n, z;
	printf ("Introduza o valor inicial (z0):\n");
	scanf ("%d", &z0);
	printf ("Indique o numero de iteracoes (n):\n");
	scanf ("%d", &n);
	z = Mandelbrot (z0, n);
	return 0;
}
