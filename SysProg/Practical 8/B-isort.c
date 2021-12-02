#include <stdio.h>
#include <stdlib.h>

// size_t == unsigned long
void isort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *));
void copy(void *dest, void *src, size_t n);
int compare(const void *, const void *);


int main()
{
    int num, width, i;
    int arr[] = {52, 14, 50, 48, 13};     //array to sort
    num = sizeof(arr) / sizeof(arr[0]);   //number of elements
    width = sizeof(arr[0]);               //size of each element
    isort(arr, num, width, compare);
    for (i = 0; i < 5; i++)
        printf("%d ", arr[i]);
    printf("\n");
    return 0;
}


int compare(const void *arg1, const void *arg2)
{
    return *(int *)arg1 - *(int *)arg2;
}


void copy(void *dest, void *src, size_t n)
{
    //Copies n bytes from src to dest. Alternatively, you could use memcpy().
    for (size_t i = 0; i < n; i++)
    {
        ((char *)dest)[i] = ((char *)src)[i];
    }
}


void isort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *))
{
    char *x = malloc(size); //used for storing base[i] each time through the loop
    //Note: (char*)base+size*i is a pointer to base[i]
    for (size_t i = 1; i < nmemb; i++)
    {
        int j;                                  /*Note that this *CAN* go negative, so can't use size_t here*/
        copy(x, (char *)base + size * i, size); //Sets x=base[i]
        for (j = i - 1; (j >= 0) && (compar(x, (char *)base + size * j) < 0); j--)
        {
            copy((char *)base + size * (j + 1), (char *)base + size * j, size); //base[j+1]=base[j]
        }
        j++;
        copy((char *)base + size * j, x, size); //Sets base[j]=x
    }
}
