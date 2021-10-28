#include <stdio.h>
#include <string.h>

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
	
	FILE *inputFile=NULL, *outputFile=NULL;
	char inputFileName[256];
	char outputFileName[256];
	char buffer[256];
	
        if (argc>1) 
		inputFile = fopen( argv[1], "r" );
	if (inputFile==NULL) {
		printf("Give input filename (default: input.txt): ");
//We could use if (scanf("%s",inputFileName)>0) on the next line, except that it won't work on blank lines, so we use fgets() and then sscanf()
		if (fgets(buffer, 256, stdin)!=NULL)
			if (sscanf(buffer,"%s",inputFileName)>0) {
				inputFile = fopen( inputFileName, "r" );
			}
			else 
				inputFile = fopen( "input.txt", "r" );
		else 
			inputFile = fopen( "input.txt", "r" );
	}


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
	
        if (argc>2) 
		outputFile = fopen( argv[2], "r" );
	if (argc==2) {
		strcpy(outputFileName,argv[1]);
		strcat(outputFileName,".out");
		outputFile = fopen( outputFileName, "w" );
		}
	if (outputFile==NULL) {
		printf("Give output filename (default: output.txt): ");
		if (fgets(buffer, 256, stdin)!=NULL)
			if (sscanf(buffer,"%s",outputFileName)>0) {
				outputFile = fopen( outputFileName, "w" );
			}
			else 
				outputFile = fopen( "output.txt", "w" );
		else 
			outputFile = fopen( "output.txt", "w" );
	}
	
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