/*
 * collatz_conjecture.asm
 *
 *      Author: Robbe De Groeve
 */

.global collatz_conjecture
.p2align 2
.type collatz_conjecture, %function


collatz_conjecture:
	.fnstart
		startup:
			LDR R2,	[R0] //move start value to R2
			MOV R3, #0   //place the number of iterations in R3
			MOV R4, #3   //Set R4 to 4 for later multiplications by 3


		//Loop to test the conjecture /////////////////////////////
		while:
			CMP R2, #1   //Compare the R2 value with 1
			BEQ end	     //If r2 == 1, branch to the end section
			ADD R3, #1   //Else, add 1 to the iteration
			TST R2, #1   //R2 AND 1 operation, if R2 is even the zero flag is set
			BNE uneven   //if the zero flag is clear, jump to uneven
			B even	     //if the zero flag is set, branch to even

		even:
			LSR R2, #1   //Logical shift right (/2)
			B while      //Branch back to the loop

		uneven:
			MUL R2, R4   //Multiply R2 by 3 (R4)
			ADD R2, #1   //Add 1 to R2
			B while      //Branch back to the loop
		//////////////////////////////////////////////////////////


		end:
			STR R2, [R0] //Place R2 back on the address of R0
			STR R3, [R1] //Place the iterations count on the adress of R1
			BX lr		 //Branch back to the main program

	.fnend
