// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

(Loop)
	@8191 		// The number of Memory map's words
	D = A
	@SCREEN
	D = D + A	// The value of D is the last index of Memory map
	@p
	M = D
	@KBD
	D = M
	@Fill
	D;JNE
	@Clear
	D;JEQ
	@Loop
	0;JMP

(Fill)
	@SCREEN
	D = M

	@Loop
	D;JNE		// If the value of SCREEN[0] not equal to 0 than all the Memory map's words are in black
	@p
	A = M
	M = -1
	@p
	M = M - 1

	@Fill
	0;JMP	

(Clear)
	@SCREEN
	D = M

	@Loop
	D;JEQ		// If the value of SCREEN[0]  equal to 0 than all the Memory map's words are in white
	@p
	A = M
	M = 0
	@p
	M = M - 1

	@Clear
	0;JMP	
