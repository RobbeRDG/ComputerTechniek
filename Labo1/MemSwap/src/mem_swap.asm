.global mem_swap
.p2align 2
.type mem_swap, %function

mem_swap: // Function "asm_function" entry point.
	.fnstart

	// Function arguments (if any) are in R0 and R1.
	// This also implies that calling a new function in this function will corrupt R0 and R1

	LDR r2, [R0]
	LDR r3, [R1]
	LDR r4, [R0]

	MOV r2,r3
	MOV r3,r4

	str r2, [R0]
	str r3, [R1]

	bx lr
	.fnend
