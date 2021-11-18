#include <stdio.h>
#include <stdlib.h>
void *calloc2(size_t nmemb, size_t size);
void *realloc2(void *ptr, size_t old_size, size_t new_size);

void *calloc2(size_t nmemb, size_t size)
{
	char *ptr = malloc(nmemb * size);
	for (unsigned int i = 0; i < nmemb * size; i++)
		ptr[i] = 0;
	return ptr;
}

void *realloc2(void *ptr, size_t old_size, size_t new_size)
{
	char *output_ptr = malloc(new_size);
	if (output_ptr != NULL)
	{
		size_t size_to_move = old_size < new_size ? old_size : new_size;
		for (unsigned int i = 0; i < size_to_move; i++)
			output_ptr[i] = ((char *)ptr)[i];
		free(ptr);
	}
	return output_ptr;
}

int main()
{

	int *a = calloc2(sizeof(int), 5);
	for (int c = 0; c < 5; c++)
		printf("%d\n", a[c]);

	a = realloc2(a, sizeof(int) * 5, sizeof(int) * 7);
	for (int c = 0; c < 7; c++)
		printf("%d\n", a[c]);

	return 0;
}
