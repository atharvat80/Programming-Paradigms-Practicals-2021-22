#include <stdio.h>
void mult_vec(int *v1, int *v2, int *v3, int n);

int main()
{

	int a[3] = {1, 2, 3};
	int b[3] = {4, 5, 6};
	int c[3];
	int dim = 3;

	mult_vec(a, b, c, dim);
	printf("Resulting vector is: ");

	for (int i = 0; i < dim; i++)
		printf("%d ", c[i]);

	printf("\n");
	return 0;
}

void mult_vec(int *v1, int *v2, int *v3, int n)
{

	for (int i = 0; i < n; i++)
	{
		v3[i] = v1[i] * v2[i];
	}
}
