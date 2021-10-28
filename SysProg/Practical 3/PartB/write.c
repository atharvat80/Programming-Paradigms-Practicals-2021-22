#include <stdio.h>

// argc means "argument count". It signifies how many arguments are being passed into the executable. 
// argv means "argument values". It is a pointer to an array of characters (strings).
// Command line arguments can be accessed using argv by indexing into it e.g. argv[1], argv[2], ...
// Note the first string in argv is the full path to the compiled executable
// i.e. argv[0] = full path to compiled write.c 
int main(int argc, const char *argv[])
{
	char *name = "Name";
	int age = 21;
	double height = 1.88;

	FILE *outputFile;

	outputFile = fopen("output.txt", "w");
	
	if (outputFile == NULL)
	{
		printf("Can't write to file %s\n", argv[1]);
		return 1;
	}

	fprintf(outputFile, "%s\n%d\n%1.2f\n", name, age, height);
	fclose(outputFile);

	return 0;
}