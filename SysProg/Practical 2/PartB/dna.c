#include <string.h>
#include <stdio.h>

char *dna_strand(const char *dna)
{
	int len = strlen(dna);		// This is the length of your strand
	char *result = strdup(dna); // This allocates memory for your result
	for (int i = 0; i < len; i++)
	{
		if (dna[i] == 'A')
			result[i] = 'T';
		if (dna[i] == 'T')
			result[i] = 'A';
		if (dna[i] == 'G')
			result[i] = 'C';
		if (dna[i] == 'C')
			result[i] = 'G';
	}
	return result;
}

int main()
{
	printf("The complementary strand is: [%s]\n", dna_strand("GTAT"));
	return 0;
}