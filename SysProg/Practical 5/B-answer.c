#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

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
}  ;

struct triangle** subdivide(int depth, struct triangle* tri) {
    // The termination case:
    if (depth == 1) {
        // We're creating an array of pointers here - to 2 *'s one for array the second for pointers
        struct triangle **ret = malloc(sizeof(struct triangle*) * 2); //the current triangle and a NULL
        assert (ret != NULL);
        ret[0] = tri;
        ret[1] = NULL;
        return ret;
    }
    // The recursive case:
    else {
        // subdivide the triangle into two and send each half to subdivide
        // Break the A-B side in half - arbitrary - could use any side here
        struct point newPoint;
        newPoint.x =  (tri->A.x + tri->B.x) / 2;
        newPoint.y =  (tri->A.y + tri->B.y) / 2;
        newPoint.z = tri->A.z; // only works as all triangles lie in the same z plane
        // tri->x is equivalent to (*try).x, i.e. it gets the member called x 
        // from the struct that tri points to.
        
        // Create the first new triangle (A, newpoint, C)
        struct triangle *first = malloc(sizeof(struct triangle));
        assert( first != NULL );
        first->A = tri->A;
        first->B = newPoint;
        first->C = tri->C;
        
        // Recursively split this new triangle
        struct triangle** firstSub = subdivide(depth - 1, first);
        
        // Create the second new triangle (newpoint, B, C)
        struct triangle *second = malloc(sizeof(struct triangle));
        assert( second != NULL );
        second->A = newPoint;
        second->B = tri->B;
        second->C = tri->C;
        
        // Recursively split this new triangle
        struct triangle** secondSub = subdivide(depth - 1, second);
        
        // We're now finished with triangle - so discard as never needed again
        free(tri);
        
        // We now need to merge these two arrays of triangles together to form one return
        // We need to know how many elements we got back - not
        int length = 0;
        while (firstSub[length] != NULL)
            length++;
        // We now have the size of the array + 1
        
        // Create array for merging the two together
        struct triangle **ret = malloc(sizeof(struct triangle*) * (2*length)+1); //one extra at the end for NULL
        assert (ret != NULL);
        int pos = 0;
        // Add First
        for (int i = 0; i < length; i++) {
            ret[pos] = firstSub[i];
            pos++;
        }
        // Add Second
        for (int i = 0; i < length; i++) {
            ret[pos] = secondSub[i];
            pos++;
        }
        // Set the last element to NULL
        ret[pos] = NULL;
        
        // We're finished with firstSub and secondSub - so free them
        free(firstSub);
        free(secondSub);
        
        // Return the array of triangles
        return ret;
    }
}

int main (int argc, const char * argv[]) {
	
	struct triangle *T[5];
	int i;
	
	FILE *inputFile, *outputFile;
	
	inputFile = fopen( "input.txt", "r" );
	assert( inputFile != NULL );

	for (i=0; i<5; i++) {
		
		T[i] = malloc( sizeof( struct triangle ) );
		assert( T[i] != NULL );
	
		fscanf ( inputFile, "%f %f %f %f %f %f %f %f %f",
				&(*T[i]).A.x, &(*T[i]).A.y, &(*T[i]).A.z,
				&(*T[i]).B.x, &(*T[i]).B.y, &(*T[i]).B.z, 
				&(*T[i]).C.x, &(*T[i]).C.y, &(*T[i]).C.z );
		
		(*T[i]).area = ( (*T[i]).A.x * ((*T[i]).B.y - (*T[i]).C.y) + 
					 (*T[i]).B.x * ((*T[i]).C.y - (*T[i]).A.y) + 
					 (*T[i]).C.x * ((*T[i]).A.y - (*T[i]).B.y) ) / 2.0;
		
	}
	
	
	fclose( inputFile );
	
	
	outputFile = fopen( "output.txt", "w" );
	if (outputFile == NULL )
		return 1;
	
	for (i=0; i<5; i++) {
		
        // Subdivide the triangle
        struct triangle **sub = subdivide(4, T[i]);
        
        // not sure how many triangles so do this as a while loop
        int pos = 0;
        while (sub[pos] != NULL) {
            
            (*sub[pos]).area = ( (*sub[pos]).A.x * ((*sub[pos]).B.y - (*sub[pos]).C.y) +
                            (*sub[pos]).B.x * ((*sub[pos]).C.y - (*sub[pos]).A.y) +
                            (*sub[pos]).C.x * ((*sub[pos]).A.y - (*sub[pos]).B.y) ) / 2.0;
            
            fprintf ( outputFile, "%1.2f %1.2f %1.2f %1.2f %1.2f %1.2f %1.2f %1.2f %1.2f \t %1.2f\n",
				(*sub[pos]).A.x, (*sub[pos]).A.y, (*sub[pos]).A.z,
				(*sub[pos]).B.x, (*sub[pos]).B.y, (*sub[pos]).B.z,
				(*sub[pos]).C.x, (*sub[pos]).C.y, (*sub[pos]).C.z,
				(*sub[pos]).area );
            pos++;
        }
	}
	
	fclose( outputFile );
	
	
    return 0;
}
