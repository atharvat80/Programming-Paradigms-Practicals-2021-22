#include <stdio.h>

int main()
{

    int a[] = {0, 1, 2, 3, 4};
    int i, *p;

    for (i = 0; i <= 4; i++)
        printf("a[%d]=%d ", i, a[i]);
    printf("\n");

    for (p = &a[0]; p <= &a[4]; p++)
        printf("*p=%d ", *p);
    printf("\n");

    for (p = &a[0], i = 1; i <= 4; i++)
        printf("p[%d]=%d ", i, p[i]);
    printf("\n");

    for (p = a, i = 0; p + i <= a + 4; i++)
        printf("*(p+%d)=%d ", i, *(p + i));
    printf("\n");

    for (p = a + 4; p >= a; p--)
        printf("*p=%d ", *p);
    printf("\n");

    for (p = a + 4, i = 0; i <= 4; i++)
        printf("p[-%d]=%d ", i, p[-i]);
    printf("\n");

    for (p = a + 4; p >= a; p--)
        printf("*p=%d ", a[p - a]);
    printf("\n");

    return 0;
}