#include <stdio.h>

int main (int argc, const char * argv[]) {
    char* name = "Andrew";
    int age = 22;
    double height = 1.88;
	
    FILE *outputFile;
	
    outputFile = fopen("output.txt", "w" );
//    swapping the above line for the one below allows you to give the input filename on the commandline
//    outputFile = fopen( argv[1], "w" );
    if (outputFile == NULL ) {
        printf("Can't write to file %s\n", argv[1]);
		return 1 ;
    }
    
    fprintf ( outputFile, "%s\n%d\n%1.2f\n", name, age, height);
    
    fclose( outputFile );
	
    return 0;
}