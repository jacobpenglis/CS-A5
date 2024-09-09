// This file is based on part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: Mult.asm

// Multiplies R1 and R2 and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R0         // Initialise R0
M=0

@R1         // Check if r1 val is 0
D=M
@END
D;JEQ

@R2         // Check if r2 val is 0
D=M
@END
D;JEQ

// if either val is 0, don't change output R0

@R2          // Check if R2 val if negative
D=M
@POS
D;JGT

D=-D        // Negate negative val
D=D+1

(POS)       // Regardless/Otherwise, initialise, INDEX, or, how many times multiplication needs to occur
@INDEX
M=D

(LOOP)      // Main multiplication loop through addition, decrement index in each loop
@R1
D=M
@R0
M=M+D
@INDEX
M=M-1
D=M
@LOOP
D;JGT

@R1         // Check if R1 is negative (<0)
D=M
@NEGATE
D;JLT

(END)
@END
0;JMP

(NEGATE)    // Negate final result
@R0
M=-M
M=M+1
@END
0;JMP
