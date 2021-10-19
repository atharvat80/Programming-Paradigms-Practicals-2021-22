// Binary Search
// Source: https://www.programmingsimplified.com/c/source-code/c-program-binary-search

#include <stdio.h>

#define ARRAY_SIZE 10 //Search in an array of this length
#define SEARCH 6	  //search for this number

int main()
{
	int array[ARRAY_SIZE] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	int first = 0;
	int last = ARRAY_SIZE - 1;
	int middle = (first + last) / 2;

	while (first <= last)
	{
		if (array[middle] < SEARCH)
			first = middle + 1;
		else if (array[middle] == SEARCH)
		{
			printf("%d found at location %d.\n", SEARCH, middle + 1);
			break;
		}
		else
			last = middle - 1;

		middle = (first + last) / 2;
	}
	if (first > last)
		printf("Not found! %d isn't present in the list.\n", SEARCH);

	return 0;
}
