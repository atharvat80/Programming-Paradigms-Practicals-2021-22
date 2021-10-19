// Bubble sort in C
// Source: https://www.programiz.com/dsa/bubble-sort

#include <stdio.h>

void bubbleSort(int array[], int size)
{
	// loop to access each array element
	for (int step = 0; step < size - 1; ++step)
	{
		// loop to compare array elements
		for (int i = 0; i < size - step - 1; ++i)
		{
			// compare two adjacent elements change > to < to sort in descending order
			if (array[i] > array[i + 1])
			{
				// swapping occurs if elements are not in the intended order
				int temp = array[i];
				array[i] = array[i + 1];
				array[i + 1] = temp;
			}
		}
	}
}

void printArray(int array[], int size)
{
	printf("Sorted Array in Ascending Order: ");
	for (int i = 0; i < size; ++i)
		printf("%d, ", array[i]);
	printf("\n");
}

int main()
{
	int data[] = {7, 2, 3, 5, 8, 4, 6, 1, 9};
	int size = 10;
	bubbleSort(data, size);
	printArray(data, size);
}
