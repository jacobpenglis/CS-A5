// Calculates the absolute value of R1 and stores the result in R0.
// (R0, R1 refer to RAM[0], and RAM[1], respectively.)

// Put your code here.
@R1
D=M
@POS        // (A=[POS]) Conditional IF (Memory of R1 > 0), no need to change
D;JGE       // >= 0
@R1         // Otherwise load R1 into A reg again
D=-M
@R0
M=D
@END
0;JMP

(POS)       // If positive, just store
@R0
M=D
@END
0;JMP

(END)       // loop until fin
@END
0;JMP