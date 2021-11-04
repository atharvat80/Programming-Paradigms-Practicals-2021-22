#include <stdio.h>

void swap_nums(int *x, int *y)
{
  int tmp;
  tmp = *x;
  *x = *y;
  *y = tmp;
}

void swap_pointers(char **x, char **y)
{
  char *tmp;
  tmp = *x;
  *x = *y;
  *y = tmp;
}

int main()
{

  int a = 3, b = 4;
  char *s1, *s2;

  swap_nums(&a, &b);

  printf("a is %d\n", a);
  printf("b is %d\n", b);

  s1 = "This should be printed second";
  s2 = "This should be printed first";

  swap_pointers(&s1, &s2);

  printf("s1 -> %s\n", s1);
  printf("s2 -> %s\n", s2);

  return 0;
}
