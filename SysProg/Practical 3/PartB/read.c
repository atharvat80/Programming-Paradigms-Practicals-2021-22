#include <stdio.h>

// argc means "argument count". It signifies how many arguments are being passed into the executable. 
// argv means "argument values". It is a pointer to an array of characters (strings).
// Command line arguments can be accessed using argv by indexing into it e.g. argv[1], argv[2], ...
// Note the first string in argv is the full path to the compiled executable
// i.e. argv[0] = full path to compiled read.c 

int main(int argc, const char *argv[])
{
	char name[20];
	int age;
	double height;

	FILE *inputFile;

	// To get the filename straight from commandlind
	// inputFile = fopen(argv[1], "r" );
	inputFile = fopen("read.txt", "r");

	if (inputFile == NULL)
	{
		printf("Can't open file : %s\n", argv[1]);
		return 1;
	}
	
	fscanf(inputFile, "%s %d %lf", name, &age, &height);
	fclose(inputFile);
	printf("Name  : %s\n", name);
	printf("Age   : %d\n", age);
	printf("Height: %f\n", height);

	return 0;
}