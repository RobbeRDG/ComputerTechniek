#include <stdio.h>
#include <stdlib.h>

extern void mem_swap(int *, int *);

int main(void) {
	// define the values to be put in the memory location of addr1 and addr2
	int num1 = 26;
	int num2 = 259;


	printf("Num1 = %d, Num2 = %d\n", num1 , num2 );
	mem_swap(&num1, &num2); // swap values

	puts("Successfully swapped?"); // extend this example to print the values
	// view the registers and memory to see the effect of the memory swap

	printf("Num1 = %d, Num2 = %d\n", num1 , num2 );
	return EXIT_SUCCESS;
}
