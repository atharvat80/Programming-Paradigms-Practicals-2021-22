#include <stdio.h>
#include <stdlib.h>

// A static variable inside a function keeps its value between invocations.
// A static global variable or a function is "seen" only in the file it's declared in
// Source : https://stackoverflow.com/questions/572547/what-does-static-mean-in-c
static int dim;
void set_dim(int d);
int get_dim();
int scalar_product(int *v1, int *v2);

void set_dim(int d)
{
	dim = d;
}

int get_dim()
{
	return dim;
}

int scalar_product(int *v1, int *v2)
{
	int ans = 0;
	for (int a = 0; a < dim; a++)
	{
		ans += v1[a] * v2[a];
	}
	return ans;
}

int main(int argc, char *argv[])
{

	int d;
	if (argc < 2)
	{
		printf("Please input dimension on the commandline e.g. ./main 3\n");
		return 1;
	}
	sscanf(argv[1], "%d", &d);
	set_dim(d);

	int *v1 = calloc(sizeof(int), get_dim());
	if (v1 == NULL)
	{
		printf("Error, malloc() failed\n");
		return 2;
	}

	int *v2 = calloc(sizeof(int), get_dim());
	if (v2 == NULL)
	{
		printf("Error, malloc() failed\n");
		return 2;
	}

	printf("Input first vector: ");
	for (int a = 0; a < get_dim(); a++)
	{
		scanf("%d", v1 + a);
	}

	printf("Input second vector: ");
	for (int a = 0; a < get_dim(); a++)
	{
		scanf("%d", v2 + a);
	}

	printf("The scalar product is %d\n", scalar_product(v1, v2));
	return 0;
}
