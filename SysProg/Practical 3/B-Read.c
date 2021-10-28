#include <stdio.h>

int main (int argc, const char * argv[]) {
    char name[20];
    int age;
    double height;
	
    FILE *inputFile;
	
    inputFile = fopen("read.txt", "r" );
//    swapping the above line for the one below allows you to give the input filename on the commandline
//    inputFile = fopen(argv[1], "r" );

    if (inputFile == NULL ) {
        printf("Can't open file : %s\n", argv[1]);
	return 1;
    }
    fscanf ( inputFile, "%s %d %lf", name, &age, &height);
	
    fclose( inputFile );
    
    printf("Name  : %s\n", name);
    printf("Age   : %d\n", age);
    printf("Height: %f\n", height);
	
    return 0;
}