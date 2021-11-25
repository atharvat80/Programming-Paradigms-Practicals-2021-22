#include "scalar.h"
static int dim;

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
