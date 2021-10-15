all:
	gcc -E main.c -o preprocessed.c
	gcc -S main.c -o assembly.asm
	gcc main.c -o main

clean:
	rm preprocessed.c assembly.asm main