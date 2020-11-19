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
			LDR R2,	[R0] //Plaats het start nummer in R2
			MOV R3, #0   //Zet R3 gelijk aan 0, voor het aantal iteraties
			MOV R4, #3   //Zet R4 gelijk aan 3, voor latere vermenigvuldiginen


		//Loop van Collatz vermoeden /////////////////////////////
		while:
			CMP R2, #1   //Vergelijk de waarde van R2 met 1
			BEQ end	     //Als R2 == 1, branch naar de "end" sectie
			ADD R3, #1   //Anders, verhoog de iteraties met 1
			TST R2, #1   //R2 AND 1 operatie, als R2 even is wordt de "zero flag" gezet
			BNE uneven   //Als de "zero flag" niet actief is, branch naar "uneven"
			B even	     //Anders, branch naar even

		even:
			LSR R2, #1   //Logische verschijving naar rechts (= /2)
			B while      //Branch naar "while"

		uneven:
			MUL R2, R4   //Vermenigvuldig R2 met R4 (= R2*3)
			ADD R2, #1   //Verhoog R2 met 1
			B while      //Branch naar "while"
		//////////////////////////////////////////////////////////


		end:
			STR R2, [R0] //Plaats R2 terug op het adres van R0
			STR R3, [R1] //Plaats het aantal iteraties op het adres van R1
			BX lr		 //Branch terug naar het main programma

	.fnend
