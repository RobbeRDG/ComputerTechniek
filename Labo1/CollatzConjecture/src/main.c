#include <stdio.h>
#include <stdlib.h>

/*
	C is used as entry point to write assembly functions.
	Function is declared as extern because it is implemented in an other file

*/

extern void collatz_conjecture(int *, int *);

int main(void) {
	//set the input integer and start count
	int num = 10;
	int count = 0;

	//Place the number in the collatz algorithm
	collatz_conjecture(&num, &count);

	if (num == 1) printf("the conjecture is correct and needed %d iterations", count);
	else printf("Something went wrong");


	return EXIT_SUCCESS;
}
