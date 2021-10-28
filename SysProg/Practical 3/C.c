#include <stdio.h>

struct point {
	float x;
	float y;
	float z;
};

struct triangle {
	struct point A;
	struct point B;
	struct point C;
	float area;
};

int main (int argc, const char * argv[]) {
	
	struct triangle T[5];
	int i;
	
	FILE *inputFile, *outputFile;
	
	inputFile = fopen( "input.txt", "r" );
	if (inputFile == NULL )
		return 1;

	for (i=0; i<5; i++) {
		
		fscanf ( inputFile, "%f %f %f %f %f %f %f %f %f",
				&T[i].A.x, &T[i].A.y, &T[i].A.z,
				&T[i].B.x, &T[i].B.y, &T[i].B.z, 
				&T[i].C.x, &T[i].C.y, &T[i].C.z );
		
		T[i].area = ( T[i].A.x*(T[i].B.y - T[i].C.y) + 
					 T[i].B.x*(T[i].C.y - T[i].A.y) + 
					 T[i].C.x*(T[i].A.y - T[i].B.y) ) / 2.0 ;
		
	}
	
	
	fclose( inputFile );
	
	
	outputFile = fopen( "output.txt", "w" );
	if (outputFile == NULL )
		return 1;
	
	for (i=0; i<5; i++) {
		
		fprintf ( outputFile, "%1.2f %1.2f %1.2f %1.2f %1.2f %1.2f %1.2f %1.2f %1.2f \t %1.2f\n",
				T[i].A.x, T[i].A.y, T[i].A.z,
				T[i].B.x, T[i].B.y, T[i].B.z, 
				T[i].C.x, T[i].C.y, T[i].C.z,
				T[i].area );
		
	}
	
	fclose( outputFile );
	
	
    return 0;
}