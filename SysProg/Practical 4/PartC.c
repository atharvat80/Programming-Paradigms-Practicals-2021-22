#include <stdio.h>

void print_reversed(char *str);

int main()
{
	char my_string[] = "sitcnas subitnom repus suie atnemadnuF";
	print_reversed(my_string);
	printf("\n");
	return 0;
}

void print_reversed(char *str)
{
	char *str2 = str;
	while (*str2 != '\0')
		str2++;						  // Go through the string until you hit the null character
	for (str2--; str2 >= str; str2--) // The first str2 - rewinds back from the null character a the end; the second str2 - rewinds after that
		printf("%c", *str2);
}
