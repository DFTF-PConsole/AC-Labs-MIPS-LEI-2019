#include <stdio.h>
#include <stdlib.h>
int main()
{
    int x, y, temp;
    x = temp = y = 0;
    printf("Qual o seu numero?: ");
    scanf(" %d", &x);
    y = (3*x) - 1;
    for (temp = 0 ; temp <= y; temp++)
    {
        printf("%d \n", temp);
    }
    return 1;
}
