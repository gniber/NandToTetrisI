// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// R*V = R*'s value
// To multiplies R0V and R1V 
// A : we are going to add R0V to R2V (assigned to 0
// in the begining ) R1V times.
// B : And each time decrease R1V by one
// Until R1V reaches zero then we break the loop

@R1	// Assign R1's value to R2's value so R1's value won't change
D = M
@R3
M = D
@R2	// Assign it to 0 so we can re-use it
M = 0

(Loop)
	@R3	    // If R3V <= 0 then break the loop and got to The End
	D = M 
	@End	   
	D;JEQ	   
	
	// A
	@R0        
	D = M
	@R2
	M = D + M
	
	// B
	@R3	  
	M = M - 1
  
	@Loop
	0;JMP

(End)
	@End
	0;JMP
